`timescale 1ns / 1ps


module mips(

input [15:0]initial_address,

input PCWrite,
input IorD,
input MemWrite,
input IRWrite,
input RegDst,
input MemtoReg,
input RegWrite,
input ALUSrcA,
input [1:0]ALUSrcB,
input [3:0]ALUControl,
input clk,
input rst,
input PCSrc
);

wire [31:0]instruction;
wire [31:0]instruction_q;
wire [31:0]data_q;
wire [31:0]A_register_q;
wire [31:0]B_register_q;
wire [31:0]RD1;
wire [31:0]RD2;
wire [15:0]Adr;
wire [31:0]RD;

wire [31:0]SrcA;
wire [31:0]SrcB;
wire [31:0]ALUResult;
wire [31:0]ALUOut;

wire [15:0]PC;
wire [15:0]PC_q;

wire [31:0]SignImm;
wire [31:0]ZeroImm;

wire [31:0]WD3;

wire [4:0]A3;

register_n # (.n(16)) PC_register (.D(PC),.clk(clk),.rst(rst),.load(PCWrite),.Q(PC_q));

mux_2_1 # (.N (16))(.A(PC_q), .B(ALUOut[15:0]), .sel(IorD), .Y(Adr));

Instr_Data_Memory #(.DATA_WIDTH(32), .ADDR_WIDTH(16) )(
	.Addr(Adr),
	.clk(clk),
	.WE(MemWrite),
	.WD(B_register_q),
	.RD(RD)
);
	
register_n # (.n(32)) instruction_register (.D(RD),.clk(clk),.rst(rst),.load(IRWrite),.Q(instruction_q));
register_n # (.n(32)) data_register (.D(RD),.clk(clk),.rst(rst),.load(1'b1),.Q(data_q));

mux_2_1 # (.N (5))(.A(instruction_q[20:16]), .B(instruction_q[15:11]), .sel(RegDst), .Y(A3));
mux_2_1 # (.N (32))(.A(ALUOut), .B(data_q), .sel(MemtoReg), .Y(WD3));


register_file uut (
		.WD3(WD3), 
      .AW(A3), 
		.RD1(RD1), 
		.AR_1(instruction_q[25:21]), 
      .RD2(RD2), 
		.AR_2(instruction_q[20:16]), 
		.RD(1'b1), 
		.WR(RegWrite), 
		.rst(rst), 
		.EN(1'b1), 
		.clk(clk));

register_n # (.n(32)) A_register (.D(RD1),.clk(clk),.rst(rst),.load(1'b1),.Q(A_register_q));
register_n # (.n(32)) B_register (.D(RD2),.clk(clk),.rst(rst),.load(1'b1),.Q(B_register_q));

sign_extend #(.width(16))(.extend(instruction_q[15:0]), .extended(SignImm));
zero_extend #(.width(16))(.extend(instruction_q[15:0]), .extended(ZeroImm));

mux_2_1 # (.N (32))(.A(PC_q), .B(A_register_q), .sel(ALUSrcA), .Y(SrcA));

mux_4_1 # (.N(32))(.A(B_register_q),.B(4), .C(SignImm),.D(ZeroImm), .SEL(ALUSrcB),.Y(SrcB));

ALU # (.WIDTH(31))(
    .A(SrcA),
    .B(SrcB),
    .REG_CONTROL(ALUControl),
    .RESULT(ALUResult),
	 .zero(),
	 .carry_out(),
	 .overflow()
    );

register_n # (.n(32)) ALU_result_register (.D(ALUResult),.clk(clk),.rst(rst),.load(1'b1),.Q(ALUOut));

mux_2_1 # (.N (32))(.A(ALUResult), .B(ALUOut), .sel(PCSrc), .Y(PC));


endmodule

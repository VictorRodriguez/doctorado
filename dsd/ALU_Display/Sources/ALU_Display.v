`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITESO
// Engineer: Victor Rodriguez
//////////////////////////////////////////////////////////////////////////////////


module ALU_Display # (parameter WIDTH = 4)(
    input signed [WIDTH:0] A,
    input signed [WIDTH:0] B,
    input [3:0] REG_CONTROL,
	 input clk,
    output [20:0] DISPLAYS,
	 output sign, //PIN_AD20
	 output zero,
	 output carry_out,
	 output overflow,
	 output [3:0] LEDS 
    );
   
	localparam ALU_WIDHT = WIDTH + 1;
	// Registers varibales
	wire signed [WIDTH:0] A_register;
   wire signed [WIDTH:0] B_register;
	
	// ALU variables
	wire [ALU_WIDHT:0] RESULT_ALU;
	wire [ALU_WIDHT:0] RESULT_ALU_FILTER;
	
	// REG variables
	wire [3:0] OUT_REG;
	
	// BCD variables
	wire [11:0] RESULT_WIRE_BCD;
	wire [11:0] RESULT_WIRE_BINARY;
	wire [11:0] RESULT_MUX_2_1;
	wire [11:0] RESULT_MUX_2_1_register;

	wire rst;
	wire load;
	wire arithmetic;
	
	assign LEDS[0] = ~REG_CONTROL[0];
	assign LEDS[1] = ~REG_CONTROL[1];
	assign LEDS[2] = ~REG_CONTROL[2];
	assign LEDS[3] = ~REG_CONTROL[3];
	
	
	tabla_control(
    .a(~REG_CONTROL[0]),
    .b(~REG_CONTROL[1]),
    .c(~REG_CONTROL[2]),
    .d(~REG_CONTROL[3]),
    .OUT_REG(OUT_REG),
    .rst(rst),
    .load(load),
    .arithmetic(arithmetic)
    );
	
	register_n # (.n(ALU_WIDHT))(
    .D(A),
    .clk(clk),
    .rst(rst),
    .load(load),
    .Q(A_register)
    );
	 
	 register_n # (.n(ALU_WIDHT))(
    .D(B),
    .clk(clk),
    .rst(rst),
    .load(load),
    .Q(B_register)
    );
	 
	ALU ALU_1(
    .A(A_register),
    .B(B_register),
    .REG_CONTROL(OUT_REG),
    .RESULT(RESULT_ALU),
	 .zero(zero),
	 .carry_out(carry_out),
	 .overflow(overflow)
    );
 
 	 assign RESULT_ALU_FILTER = (RESULT_ALU[ALU_WIDHT] == 1'b1)? -RESULT_ALU:RESULT_ALU;
 	 assign sign = ~(arithmetic & RESULT_ALU[ALU_WIDHT]);

 
	 BCD(
     .bin(RESULT_ALU_FILTER),
     .bcd(RESULT_WIRE_BCD)
    );
    
	 //assign RESULT_WIRE_BINARY = {7'b0,RESULT_ALU};
	 assign RESULT_MUX_2_1 = (arithmetic == 1'b1)? RESULT_WIRE_BCD:RESULT_ALU;

	 register_n # (.n(12))(
    .D(RESULT_MUX_2_1),
    .clk(clk),
    .rst(rst),
    .load(load),
    .Q(RESULT_MUX_2_1_register)
    );
	 
	 decode_7_anode(
    .IN(RESULT_MUX_2_1_register[3:0]),
    .a(DISPLAYS[0]),
    .b(DISPLAYS[1]),
    .c(DISPLAYS[2]),
    .d(DISPLAYS[3]),
    .e(DISPLAYS[4]),
    .f(DISPLAYS[5]),
    .g(DISPLAYS[6])
    );
	
	 decode_7_anode(
    .IN(RESULT_MUX_2_1_register[7:4]),
    .a(DISPLAYS[7]),
    .b(DISPLAYS[8]),
    .c(DISPLAYS[9]),
    .d(DISPLAYS[10]),
    .e(DISPLAYS[11]),
    .f(DISPLAYS[12]),
    .g(DISPLAYS[13])
    );
	 
	 
	 decode_7_anode(
    .IN(RESULT_MUX_2_1_register[11:8]),
    .a(DISPLAYS[14]),
    .b(DISPLAYS[15]),
    .c(DISPLAYS[16]),
    .d(DISPLAYS[17]),
    .e(DISPLAYS[18]),
    .f(DISPLAYS[19]),
    .g(DISPLAYS[20])
    );
	
endmodule
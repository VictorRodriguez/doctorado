
`timescale 1ns / 1ps

module regFile_tb_full;

 // Entradas
	reg [31:0] WD3;
	reg [4:0] AW;
	reg [4:0] AR_1;
	reg [4:0] AR_2;
	reg RD;
	reg WR;
	reg rst;
	reg EN;
	reg clk;

 // Salidas
 wire [31:0] RD1;
 wire [31:0] RD2;

	register_file uut (
		.WD3(WD3), 
      .AW(AW), 
		.RD1(RD1), 
		.AR_1(AR_1), 
      .RD2(RD2), 
		.AR_2(AR_2), 
		.RD(RD), 
		.WR(WR), 
		.rst(rst), 
		.EN(EN), 
		.clk(clk)
 );

 initial begin

  // Initialize Inputs

  WD3  = 32'b0;
  AW  = 4'b0;
  AR_1  = 4'b0;
  AR_2  = 4'b0;
  RD  = 1'b0;
  WR  = 1'b1;
  EN  = 1'b1;
  clk  = 1'b0;

  // Wait 100 ns for global reset to finish
  rst  = 1'b1;
  #100;
  rst  = 1'b0;
 end
 
always
begin
#1000 WR = ~WR;
end 

always
begin
#200 RD = ~RD;
end 

always
begin
#100 WD3 = WD3 + 1;
end 

always
begin
#100 AW  = AW + 1;
end

always
begin
#100 AR_1  = AR_1 + 1;
end

always
begin
#100 AR_2  = AR_2 + 1;
end

always 
begin
	#10 clk = ~clk;
end 

endmodule 
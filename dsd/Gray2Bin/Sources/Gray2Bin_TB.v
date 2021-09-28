// Testbench for a Gray code to binary code converter
// ITESO
// Cuauhtemoc Aguilera
`timescale 1ns / 1ps
module Gray2Bin_TB ();

parameter SIZE = 4;

reg [SIZE-1:0]gray;
wire [SIZE-1:0]bin;

Gray2Bin #( .SIZE(4) ) UUT (.gray(gray), .bin(bin) ); 

initial 
	begin
		gray = {SIZE{1'b0}}; 
	end

always
	begin
		# 10 gray = gray + 1'b1;
	end
	
endmodule


// Gray code to binary code converter, parameterized.
// This code is taken from Verilog Pro webpage.
// https://www.verilogpro.com/verilog-generate-configurable-rtl/
// The original code is edited by
// Cuauhtemoc Aguilera
// ITESO

`timescale 1ns / 1ps

module Gray2Bin
#(parameter SIZE = 4)
(
input [SIZE-1:0] gray,
output [SIZE-1:0] bin
); 
genvar gi;
// Use generate and endgenerate keywords 
generate
	for (gi=0; gi < SIZE; gi=gi+1)
 	 begin : genbit
		assign bin[gi] = ^gray[SIZE-1:gi]; 
	end
endgenerate
endmodule




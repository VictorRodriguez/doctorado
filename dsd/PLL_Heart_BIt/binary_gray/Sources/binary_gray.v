// Binary code to Gray code converter, parameterized.
// Victor Rodriguez
// ITESO

`timescale 1ns / 1ps

module binary_gray #(parameter SIZE = 4)(
	input [SIZE-1:0] bin,
	output [SIZE-1:0] gray
); 
genvar gi;
// Use generate and endgenerate keywords 
generate
	for (gi=0; gi < SIZE-1; gi=gi+1)
 	 begin : gengray
		assign gray[gi] = ^bin[gi+1:gi]; 
	end
endgenerate
	assign gray[SIZE-1] = bin[SIZE-1];
endmodule


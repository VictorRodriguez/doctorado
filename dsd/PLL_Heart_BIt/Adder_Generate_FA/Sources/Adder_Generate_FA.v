// Parameterized structured adder, base on full_adder module
// This hierarchical model use de for-generate instruction.
// Cuauhtemoc Aguilera
// ITESO
module Adder_Generate_FA
	#(parameter SIZE = 4)
(
  input  	[SIZE-1:0] A, B,
  input  	cin,
  output 	cout,
  output 	[SIZE-1:0] Sum
);
wire [SIZE : 0] C_w;
	genvar gi;

assign C_w[0] = cin;
assign cout = C_w[SIZE];

generate 
	for(gi = 0; gi < SIZE ; gi = gi+1)
		begin: bit_
			full_adder fa (.a(A[gi]), .b(B[gi]), .c(C_w[gi]),
						.s(Sum[gi]), .co (C_w[gi+1]) );
		end
	endgenerate
endmodule
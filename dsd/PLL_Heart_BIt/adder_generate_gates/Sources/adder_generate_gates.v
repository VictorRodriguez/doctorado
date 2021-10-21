// Parameterized structured adder base on basic gates
// This code is taken from Verilog Pro webpage.
// https://www.verilogpro.com/verilog-generate-configurable-rtl/
// The original code is edited by
// Cuauhtemoc Aguilera
// ITESO
module adder_generate_gates
	#(parameter SIZE = 4)
(
  input  	[SIZE-1:0] A, B,
  input  	cin,
  output 	cout,
  output 	[SIZE-1:0] Sum
);
wire [SIZE :0] C_w;
	genvar i;
assign C_w[0] = cin;
assign cout = C_w[SIZE];

generate 
	for(i = 0; i < SIZE ; i = i+1)
		begin:bit_
			wire s, ab, sC_w;
			xor 	g1 ( s, A[i], B[i]);
			xor 	g2 ( Sum[i], s, C_w[i]);
			and 	g3 ( ab, A[i], B[i]);
			and 	g4 ( sC_w, s, C_w[i]);
			or 	g5 ( C_w[i+1], ab, sC_w);
		end
	endgenerate
endmodule

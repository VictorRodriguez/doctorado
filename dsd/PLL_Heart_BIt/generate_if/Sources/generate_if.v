// Verilog model to show how works the if-generate instruction
// This code is based on the examples of:
// https://www.chipverify.com/verilog/verilog-generate-block#generate-if
// Cuauhtemoc Aguilera

// Top-level Design 
module generate_if (
input [3:0] A, B,
input sel,
output  [3:0] Y);

parameter SELECT_DESIGN = 0;
	generate
		if (SELECT_DESIGN == 0)
			mux_assign mux_0 	(.A(A), .B(B), .sel(sel), .Y(Y) );
		else
			mux_if mux_1		(.A(A), .B(B), .sel(sel), .Y(Y) );
	endgenerate
endmodule
// Circuit option one 
module mux_assign (
	input [3:0]A, B,
	input sel,
	output [3:0]Y
	);
	assign Y = (sel)? B : A;
initial
	begin
		$display ("mux_assign is instantiated");
	end 
endmodule
	// Circuit option two
module mux_if (
	input [3:0] A, B,
	input sel,
	output reg [3:0]Y
	);
always @ (A, B, sel)
	begin
		if (sel==1'b1)
			Y = B;
		else 
			Y = A;
	end
initial
	begin
		$display ("mux_if is instantiated");
	end 
endmodule


module mux(
	input din0,
	input din1,
	input sel,
	output dout);
assign dout = (sel)? din0:din1;
endmodule
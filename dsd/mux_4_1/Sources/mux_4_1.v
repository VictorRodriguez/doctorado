module mux_4_1(
	input din0,
	input din1,
	input din2,
	input din3,
	input [1:0]sel,
	output dout);

	wire mux_1,mux2;
	
	mux(.din0(din0),.din1(din1),.sel(sel[1]),.dout(mux_1));
	mux(.din0(din2),.din1(din3),.sel(sel[1]),.dout(mux_2));
	
	mux(.din0(mux_1),.din1(mux_2),.sel(sel[0]),.dout(dout));
	
endmodule
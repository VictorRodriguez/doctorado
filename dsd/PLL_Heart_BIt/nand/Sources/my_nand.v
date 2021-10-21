
module my_nand(
	input a,
	input b,
	output y);

	assign y = ~(a & b);
endmodule



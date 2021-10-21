`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module my_nand_tb();

	reg a,b;
	wire salida;
	
	module my_nand UUT(
	.a(a),
	.b(b),
	.y)(salida);
	

	initial 
		begin
			a = 0;
			b = 0;
		end
	
	always
		begin
			#10 a = ~a
		end

	always
		begin
			#20 b = ~b
		end
endmodule
	

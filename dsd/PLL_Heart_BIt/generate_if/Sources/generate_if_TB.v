// Testbench to verifY the generate_if module
`timescale 1ns / 1ps
module generate_if_TB ();
	reg [3:0]A, B;
	reg sel;
	wire [3:0]Y;

integer i;

generate_if # (.SELECT_DESIGN(0)) UUT ( .A(A), .B(B), .sel(sel), .Y(Y) );
initial
	begin
		A 	<= 0;
		B 	<= 0;
		sel 	<= 0;
// assign random values to UUT input ports
	   for (i= 0; i< 16; i= i + 1)
		begin
			#10  A <= $random;
			     B <= $random;
			     sel <= $random;
			$monitor ("i=%0d A=0x%0h B=0x%0h sel=0x%0h Y=0x%0h", i, A, B, sel, Y);
		end
	end
endmodule

	
	
	



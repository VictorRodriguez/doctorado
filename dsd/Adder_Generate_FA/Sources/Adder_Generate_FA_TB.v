`timescale 1ns / 1ps
// Testbech for the parameterized structured adder base on full_adder module
// Cuauhtemoc Aguilera
// ITESO
module Adder_Generate_FA_TB ();
parameter WIDTH = 4;

reg [WIDTH-1:0] A, B;
reg cin;
wire [WIDTH-1:0] Sum;
wire cout;



Adder_Generate_FA #(.SIZE(WIDTH) )
	UUT ( .A(A), .B(B), .cin(cin), .cout(cout), .Sum(Sum) );

	
initial
	begin
		A = {WIDTH{1'b0}};
		B = {WIDTH{1'b0}};
		cin = 1'b0;
	end

always
	begin
		#10 B = B+ 1'b1;
	end
always
	begin
		#160 A = A+ 1'b1;
	end
always
	begin
		#2560 cin = ~cin;
	end	
endmodule

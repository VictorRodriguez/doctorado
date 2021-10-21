// ITESO
// Cuauhtemoc Aguilera
// This code was taken from Intel Timing Analyzer Tutorial It was edited y improved.
module add_tree_numbers(clock, nrst, A, B, C, sum);
input clock;
input nrst;
input [7:0] A,B,C;
output [9:0] sum;
// Registers
reg [7:0] reg_A, reg_B, reg_C /* synthesis keep */;
reg [9:0] reg_sum /* synthesis keep */;
always @(negedge nrst or posedge clock)
 begin
	if (nrst === 1'b0)
	 begin
		reg_A <= 8'h00;
		reg_B <= 8'h00;
		reg_C <= 8'h00;
		reg_sum <= 10'H00;
	 end
	else
	 begin 
		reg_A <= A;
		reg_B <= B;
		reg_C <= C;
		reg_sum <= reg_A + reg_B + reg_C;
	 end
 end
assign sum = reg_sum;
endmodule

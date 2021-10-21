/////////////////////////////////////////////////////////////////////////
// Company: ITESO
// Engineer: Victor Rodriguez
// Top module to make multiplier using shift registers
/////////////////////////////////////////////////////////////////////////


module multiplier(

	input signed [4:0]A,
	input signed [4:0]B,
	input start,
	input clk,
	input rst,
   output [20:0] DISPLAYS,
	output sign,
	output ready
);

	wire [11:0] RESULT_WIRE_BCD;
	wire [10:0] WIRE_REGISTER;
   
	wire [10:0] RESULT_MUL;
	
	wire [4:0]A_abs;
   wire [4:0]B_abs; 

   assign A_abs = (A[4]== 1'b1)? -A:A;
   assign B_abs = (B[4]== 1'b1)? -B:B; 
   assign sign = ~(A[4] ^ B[4]);

	seq_mul # (.N(5)) UUT(
    .clk(clk),
    .rst(~rst),
    .start(~start),
    .A(A_abs), //multiplicant
    .B(B_abs),// multiplier
    .RESULT(RESULT_MUL),
    .ready(ready),
    .state(),
    .multiplier(),
    .multiplicant(),
    .count_start(),
    .shift_multiplier_rigth(),
    .add_multiplicant(),
    .Q(count_start_wire)
    );
	 	
	 register_n # (.n(11))(
    .D(RESULT_MUL),
    .clk(clk),
    .rst(~rst),
    .load(ready),
    .Q(WIRE_REGISTER)
    );
	 
	  BCD(
     .bin({WIRE_REGISTER}),
     .bcd(RESULT_WIRE_BCD)
    );
	 
	 decode_7_anode(
    .IN(RESULT_WIRE_BCD[3:0]),
    .a(DISPLAYS[0]),
    .b(DISPLAYS[1]),
    .c(DISPLAYS[2]),
    .d(DISPLAYS[3]),
    .e(DISPLAYS[4]),
    .f(DISPLAYS[5]),
    .g(DISPLAYS[6])
    );
	
	 decode_7_anode(
    .IN(RESULT_WIRE_BCD[7:4]),
    .a(DISPLAYS[7]),
    .b(DISPLAYS[8]),
    .c(DISPLAYS[9]),
    .d(DISPLAYS[10]),
    .e(DISPLAYS[11]),
    .f(DISPLAYS[12]),
    .g(DISPLAYS[13])
    );
	 
	 
	 decode_7_anode(
    .IN(RESULT_WIRE_BCD[11:8]),
    .a(DISPLAYS[14]),
    .b(DISPLAYS[15]),
    .c(DISPLAYS[16]),
    .d(DISPLAYS[17]),
    .e(DISPLAYS[18]),
    .f(DISPLAYS[19]),
    .g(DISPLAYS[20])
    );

endmodule

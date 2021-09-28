

module multiplier(

	input signed [4:0]A,
	input signed [4:0]B,
	input start,
	input clk,
	input rst,
   output [20:0] DISPLAYS,
	output sign
);

	wire [11:0] RESULT_WIRE_BCD;
	wire [9:0] WIRE_REGISTER;
   
	wire [9:0] RESULT_MUL;
	
   multiplicador(
    .A(A),
    .B(B),
    .RESULT(RESULT_MUL),
    .clk(clk),
    .enable(1'b1),
    .rst(~rst)
    );
    
   assign sign = ~(A[4] ^ B[4]);
	
	 register_n # (.n(8))(
    .D(RESULT_MUL),
    .clk(clk),
    .rst(~rst),
    .load(~start),
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
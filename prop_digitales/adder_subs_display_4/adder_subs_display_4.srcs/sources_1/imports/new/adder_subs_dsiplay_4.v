`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/08/2021 06:27:50 PM
// Design Name: 
// Module Name: adder_subs_dsiplay_4
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module adder_subs_dsiplay_4 # (parameter n = 2, parameter width = 18, parameter YY = 250_000)(
    input [3:0] A,
    input [3:0] B,
    output [3:0] SEL,
    input sum_subs_sel,
    input enable,
    input rst,
    input clk,
    output seg_a,
    output seg_b,
    output seg_c,
    output seg_d,
    output seg_e,
    output seg_f,
    output seg_g,
    output dp
   );
    
    wire [3:0]wire_A,wire_B;
    wire [4:0]wire_Y,wire_Y_abs;
    wire overflow;
    
    adder_subs adder_subs_0 (
    .A(A),
    .B(B),
    .sum_subs_sel(sum_subs_sel),
    .Y(wire_Y),
    .overflow(wire_overflow)
    );
    
    abs_4 abs_4_0(
    .A(A),
    .A_abs(wire_A)
    );
    
    abs_4 abs_4_1(
    .A(B),
    .A_abs(wire_B)
    );
    
     abs_5 abs_5_0(
    .A(wire_Y),
    .A_abs(wire_Y_abs)
    );
    
    decode_4_dig_7seg  # (.n(n),.width(width),.YY(YY)) seg_0 (
    .A(wire_Y_abs[3:0]),
    .B({4'b0000,wire_Y_abs[4]}),
    .C(wire_B),
    .D(wire_A),
    .clk(clk),
    .rst(rst),
    .enable(enable),
    .seg_a(seg_a),
    .seg_b(seg_b),
    .seg_c(seg_c),
    .seg_d(seg_d),
    .seg_e(seg_e),
    .seg_f(seg_f),
    .seg_g(seg_g),
    .SEL(SEL)
    );
    
    
    dot_point_decode # (.n(n),.width(width),.YY(YY))dot_point_decode_0 (
    .dot_input(~wire_overflow),
    .dot_point(dp),
    .rst(rst),
    .clk(clk),
    .enable(enable)
    );
    
    //assign dp = 1'b1;
    
endmodule

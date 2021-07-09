`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/04/2021 09:10:34 PM
// Design Name: 
// Module Name: adder_subs_4
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


module adder_subs_4 # (parameter n = 2, parameter width = 18, parameter YY = 250_000)(
    input [3:0]A,
    input [3:0]B,
    input clk,
    input rst,
    input enable,
    input sum_subs_sel,
    output seg_a,
    output seg_b,
    output seg_c,
    output seg_d,
    output seg_e,
    output seg_f,
    output seg_g,
    output [3:0]SEL
    );
    
    
    wire [4:0] wire_S;
    wire [3:0] wire_A,wire_B,wire_Y;
    wire [1:0] wire_CNT;
    
    comp_2_4 comp_2_4_0 (.A(B),.Y(wire_Y));
    
    mux_2_1_size_4(.A(wire_Y),.B(B),.sel(sum_subs_sel),.Y(wire_B));
    
    adder_4 adder_0 (
    .A(A),
    .B(wire_B),
    .cin("0"),
    .S(wire_S));
    
    decode_4_dig_7seg # (.n(n), .width(width),.YY(YY))(  
    .A(wire_S [3:0]),
    .B(wire_S [4:4]),
    .C(B),
    .D(A),   
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
    
endmodule

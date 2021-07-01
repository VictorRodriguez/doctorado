`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/26/2021 02:12:46 PM
// Design Name: 
// Module Name: adder_decoder_7seg
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


module adder_decoder_7seg(


    input [3:0] A,
    input [3:0] B,
    input cin,
    output seg_a,
    output seg_b,
    output seg_c,
    output seg_d,
    output seg_e,
    output seg_f,
    output seg_g,
    output co,
    output [3:0]T
    );
    
    wire [4:0] wire_S;

    adder_4 adder_0 (.A(A),.B(B),.cin(cin),.S(wire_S));
       
    decoder_bin_hex_7seg decoder_bin_hex_7seg_0 (.w(wire_S[3]),.x(wire_S[2]),.y(wire_S[1]),.z(wire_S[0]),.a(seg_a),.b(seg_b),.c(seg_c),.d(seg_d),.e(seg_e),.f(seg_f),.g(seg_g));

    assign co = wire_S[4];
    
    assign T = "1110";
    

endmodule

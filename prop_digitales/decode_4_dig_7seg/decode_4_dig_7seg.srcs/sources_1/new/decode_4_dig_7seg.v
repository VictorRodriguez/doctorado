`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/30/2021 10:29:49 PM
// Design Name: 
// Module Name: decode_4_dig_7seg
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


module decode_4_dig_7seg(
    input [3:0] A,
    input [3:0] B,
    input [3:0] C,
    input [3:0] D,
    input clk,
    input seg_a,
    input seg_b,
    input seg_c,
    input seg_d,
    input seg_e,
    input seg_f,
    input seg_g,
    output [3:0] SEL
    );
    
    wire [4:0] wire_A,wire_B,wire_C,wire_D,wire_Y,wire_CNT;
    
    
    
    mux_4_1_size_4 mux_4_1_size_4_0(.A(A),
            .B(B),
            .C(C),.D(D),
            .Y(wire_Y),
            .SEL(wire_CNT));
    
    decoder_bin_hex_7seg decoder_bin_hex_7seg_0 (
         .w(wire_Y[3]),
         .x(wire_Y[2]),
         .y(wire_Y[1]),
         .z(wire_Y[0]),
         .a(seg_a),
         .b(seg_b),
         .c(seg_c),
         .d(seg_d),
         .e(seg_e),
         .f(seg_f),
         .g(seg_g));

    decode_2_4_display decode_2_4_display_0(.a(wire_CNT[1]),.b(wire_CNT[0]),.Y(SEL));
    


endmodule

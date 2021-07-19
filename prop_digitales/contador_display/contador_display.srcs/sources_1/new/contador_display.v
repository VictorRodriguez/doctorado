`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/15/2021 06:48:08 AM
// Design Name: 
// Module Name: contador_display
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


module contador_display # (parameter n = 4)(
    input nclk,
    input enable,
    input rst,
    input up,
    output seg_a,
    output seg_b,
    output seg_c,
    output seg_d,
    output seg_e,
    output seg_f,
    output seg_g,
    output [3:0]SEL
    );
    
    wire [n-1:0]wire_Q;
    wire new_clk;
    
    Delayer # ( .width(27), .YY(100000000) ) delay_0 ( .clk(nclk), .rst(rst), .enable(~enable), .iguales(new_clk) );  
    
    contador # (.n(n)) contador_1(
    .nclk(new_clk),
    .rst(rst),
    .enable(~enable),
    .up(up),
    .Q(wire_Q)
    );
    
    decoder_bin_hex_7seg decoder_bin_hex_7seg_1(
    .w(wire_Q[3]),
    .x(wire_Q[2]),
    .y(wire_Q[1]),
    .z(wire_Q[0]),
    .a(seg_a),
    .b(seg_b),
    .c(seg_c),
    .d(seg_d),
    .e(seg_e),
    .f(seg_f),
    .g(seg_g)
    );
    
    assign SEL = 4'b1110;
    
endmodule

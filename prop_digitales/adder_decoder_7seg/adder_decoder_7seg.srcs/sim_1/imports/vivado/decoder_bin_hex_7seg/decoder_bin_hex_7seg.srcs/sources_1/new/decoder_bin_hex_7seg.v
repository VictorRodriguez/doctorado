`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/26/2021 12:59:25 PM
// Design Name: 
// Module Name: decoder_bin_hex_7seg
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


module decoder_bin_hex_7seg(
    input w,
    input x,
    input y,
    input z,
    output a,
    output b,
    output c,
    output d,
    output e,
    output f,
    output g
    );
    
    assign a =  (~w&x&~y&~z) | (&w&x&~y&z) | (w&~x&y&z);
    assign b = (~&y&z&~w)  |  (w&x&y) | (y&z&w) | (~y&~z&w&x);
    assign c = (y&w&x)  | (~w&~x&~y&z) | (w&x&~y&~z) | (y&~z&~w&~x);
    assign d = (y&z&x) | (~y&z&w&~x) | (w&~x&y&~z) | (~y&~z&~w&x);
    assign e = (~w&x&~y) | (~w&x&z)  | (y&z&~w) | (w&~x&~y&z);
    assign f = (~w&~x&y) | (~w&y&z) | (w&x&~y&z);
    assign g = (~w&~x&~y&~z);
    
endmodule

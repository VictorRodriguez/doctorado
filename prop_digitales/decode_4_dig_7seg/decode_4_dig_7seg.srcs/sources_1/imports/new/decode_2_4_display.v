`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/30/2021 10:04:34 PM
// Design Name: 
// Module Name: decode_2_4_display
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


module decode_2_4_display(
    input a,
    input b,
    output [3:0]Y
    );


    assign Y[0] = a|b;
    assign Y[1] = a|~b;
    assign Y[2]= ~a|b;
    assign Y[3] = ~a|~b;
/*
    assign Y[0] = a|b;
    assign Y[2] = ~(~a&b);
    assign Y[1]= ~(a&~b);
    assign Y[3] = ~a|~b;
  */  
endmodule

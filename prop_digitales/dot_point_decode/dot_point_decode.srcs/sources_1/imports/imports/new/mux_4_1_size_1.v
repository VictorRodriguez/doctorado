`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/30/2021 09:43:24 PM
// Design Name: 
// Module Name: mux_4_1_size_4
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


module mux_4_1_size_1(
    input A,
    input B,
    input C,
    input D,
    output Y,
    input [1:0]SEL
    );
    
    assign Y = (SEL == 2'b00)? A:
               (SEL == 2'b01)? B:
               (SEL == 2'b10)? C:
               (SEL == 2'b11)? D:1'b0;    
endmodule

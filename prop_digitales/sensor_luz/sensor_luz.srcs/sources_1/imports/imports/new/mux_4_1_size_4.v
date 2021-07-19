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


module mux_4_1_size_4(
    input [3:0] A,
    input [3:0] B,
    input [3:0] C,
    input [3:0] D,
    output [3:0] Y,
    input [1:0]SEL
    );
    
    assign Y = (SEL == 2'b00)? A:
               (SEL == 2'b01)? B:
               (SEL == 2'b10)? C:
               (SEL == 2'b11)? D:4'b00000;    
endmodule

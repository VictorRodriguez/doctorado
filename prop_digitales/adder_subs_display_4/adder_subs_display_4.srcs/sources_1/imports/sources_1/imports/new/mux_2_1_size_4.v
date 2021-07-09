`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/29/2021 09:07:16 PM
// Design Name: 
// Module Name: mux_2_1_size_4
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


module mux_2_1_size_4(

    input [3:0] A,
    input [3:0] B, 
    input sel,
    output [3:0]Y
    );
    
    assign Y = (sel == 1'b1)? B:A;
    
    /*
    assign Y = (sel == 1'b00)? B:
               (sel == 1'b01)? B:
               (sel == 1'b10)? B:
               (sel == 1'b11)? B:4'b00000
    */

endmodule

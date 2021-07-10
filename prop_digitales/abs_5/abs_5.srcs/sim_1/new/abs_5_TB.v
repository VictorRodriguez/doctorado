`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/10/2021 07:17:16 AM
// Design Name: 
// Module Name: abs_5_TB
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


module abs_5_TB();

reg [4:0]A;
wire [4:0]A_abs;

abs_5 UUT(.A(A),.A_abs(A_abs));

initial
    begin
    A = 5'b0000;
    end
always
    begin
    #10 A = A + 1;
    end
    
endmodule

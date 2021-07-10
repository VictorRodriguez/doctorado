`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/10/2021 06:32:19 AM
// Design Name: 
// Module Name: abs_4_TB
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


module abs_4_TB();

reg [3:0]A;
wire [3:0]A_abs;

abs_4 UUT(.A(A),.A_abs(A_abs));

initial
    begin
    A = 4'b0000;
    end
always
    begin
    #10 A = A + 1;
    end
    
    
endmodule

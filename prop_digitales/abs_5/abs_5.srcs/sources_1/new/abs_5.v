`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/08/2021 03:30:36 PM
// Design Name: 
// Module Name: abs_5
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


module abs_5(
    input [4:0] A,
    output reg [4:0] A_abs
    );
    
 always  @*
    if (A[4]) begin
        A_abs = ~A + 1'b1;
    end else begin
        A_abs = A;
    end
   

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/08/2021 03:07:00 PM
// Design Name: 
// Module Name: abs_4
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


module abs_4(
    input [3:0] A,
    output reg [3:0] A_abs
    );
    
    
 always  @*
    if (A[3]) begin
        A_abs = ~A + 1'b1;
    end else begin
        A_abs = A;
    end
   

endmodule

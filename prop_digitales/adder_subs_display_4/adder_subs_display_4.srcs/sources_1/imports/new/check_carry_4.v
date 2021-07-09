`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/08/2021 09:27:41 AM
// Design Name: 
// Module Name: check_carry_4
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


module check_carry_4(
    input [4:0] A,
    output reg [4:0] S,
    input co_1,
    input co_2
    );
 

 always  @*
    if (co_1 & co_2) begin
        S = {A[3],A[3:0]};
    end else begin
        S = {co_2,A[3:0]};
    end
   

endmodule

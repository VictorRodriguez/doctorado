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
    output [4:0] S
    );
    
    assign S[4] = A[4] & ~A[3];
    assign S[3] = A[3];
    assign S[2] = A[2];
    assign S[1] = A[1];
    assign S[0] = A[0];

endmodule

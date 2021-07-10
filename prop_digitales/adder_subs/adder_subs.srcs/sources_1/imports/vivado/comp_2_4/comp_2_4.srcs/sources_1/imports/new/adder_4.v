`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/26/2021 09:12:00 AM
// Design Name: 
// Module Name: adder_4
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


module adder_4(
    input [3:0] A,
    input [3:0] B,
    output [4:0] S,
    input cin
    );
    
    wire co_0, co_1, co_2,co_3;
    
    full_adder fa0(.a(A[0]),.b(B[0]),.c(cin),.s(S[0]),.co(co_0));
    full_adder fa1(.a(A[1]),.b(B[1]),.c(co_0),.s(S[1]),.co(co_1));
    full_adder fa2(.a(A[2]),.b(B[2]),.c(co_1),.s(S[2]),.co(co_2));
    full_adder fa3(.a(A[3]),.b(B[3]),.c(co_2),.s(S[3]),.co(co_3));
    
    assign S[4] = (~co_3 & ~co_2)? S[3]:
               (~co_3 & co_2)? 1'b0:
               (co_3 & ~co_2)? 1'b1:
               (co_3 & co_2)? S[3]: 1'b0;
endmodule
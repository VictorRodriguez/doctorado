`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/05/2021 06:40:06 AM
// Design Name: 
// Module Name: comp_2_4
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


module comp_2_4(
    input [3:0] A,
    output [3:0] Y
    );
    
    adder_4 adder_4_0 (.A(~A),.B({4'b0001}),.S(Y),.cin(1'b0),.s_co_1(),.s_co_2());

endmodule

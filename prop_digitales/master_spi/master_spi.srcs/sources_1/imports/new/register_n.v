`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/19/2021 09:22:53 PM
// Design Name: 
// Module Name: register_n
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


module register_n # (parameter n = 4)(
    input [n-1:0]D,
    input clk,
    input rst,
    input load,
    output reg [n-1:0]Q
    );
    
    always @(posedge clk)
        if (rst)
            begin
                Q <= n-1'b0;
            end 
        else if (load)
            begin
            Q <= D;
            end
endmodule


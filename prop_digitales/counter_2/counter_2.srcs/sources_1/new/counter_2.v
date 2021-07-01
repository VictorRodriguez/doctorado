`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/01/2021 11:34:56 AM
// Design Name: 
// Module Name: counter_2
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


module counter_2(
    input clk,
    input rstn,
    output reg [3:0] OUT
    );
    
    always @(posedge clk) begin
    if (!rstn)
        OUT <= 0;
    else
        OUT <= OUT + 1;
    end    
endmodule

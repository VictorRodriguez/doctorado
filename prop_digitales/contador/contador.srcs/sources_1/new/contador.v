`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/15/2021 06:28:03 AM
// Design Name: 
// Module Name: contador
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


module contador # (parameter n = 8)(
    input nclk,
    input rst,
    input enable,
    output reg [n-1:0] Q
    );
    
    always @(posedge rst, negedge nclk)
    begin
    if(rst)
        Q<={n{1'b0}};
    else
        if (enable)
            Q <= Q + 1'b1; 
        else
            Q<=Q;
    end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/23/2021 11:06:45 PM
// Design Name: 
// Module Name: ff_t
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


module ff_t(
    input clk,
    input rst,
    input t,
    output reg q
    );
    
    always @(posedge clk)
    begin
        if (rst)
            q <= 0;
        else
            if(t)
                q <= ~q;
            else
                q <= q;
    end
endmodule

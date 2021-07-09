`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/06/2021 09:32:31 PM
// Design Name: 
// Module Name: ff_d
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


module ff_d(
    input d,
    input clk,
    input rst,
    output reg q,
    output not_q
    );
    
    assign not_q = ~d;
    
    always@ (posedge clk)
        begin
            if (rst)
                begin
                q <= 1'b0;
                //not_q <= 1'b1;
                end
            else
                begin
                q <= d;
                //not_q <= ~d;
                end 
        end
endmodule

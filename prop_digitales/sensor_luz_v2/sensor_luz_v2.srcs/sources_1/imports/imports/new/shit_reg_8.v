`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/08/2021 09:05:13 PM
// Design Name: 
// Module Name: shit_reg_8
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


module shit_reg_16(
    input serin,
    output reg [15:0] Q,
    input clk,
    input enable,
    input rst
    );
    
   always@(posedge rst or posedge clk)
   begin
        if (rst)
            Q <= 16'b00;
        else
            if(enable)
                Q <= {serin,Q[15:1]};
            else
                Q <= Q;
   end
    
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
//
//////////////////////////////////////////////////////////////////////////////////


module shift_right_pipo_reg #(parameter N = 5) (
    input [N-1:0] IN,
    output reg [N-1:0] Q,
    input clk,
    input enable,
    input rst
    );
    
    always @(posedge rst, posedge clk) 
    begin
        if (rst)
            Q <= IN;
        else
            if (enable)
                Q <= Q >> 1;
            else
                Q <= Q;
    end 
endmodule
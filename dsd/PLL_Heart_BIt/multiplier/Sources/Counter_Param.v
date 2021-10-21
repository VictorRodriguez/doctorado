`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITESO
// Engineer: Cuauhtemoc Aguilera
//////////////////////////////////////////////////////////////////////////////////
module Counter_Param  # (parameter n = 8)
(
    input clk,
    input rst,
    input enable,
    output reg [n-1:0] Q
    );

 always @(posedge rst, posedge clk) 
    begin
        if (rst)
            Q <= {n{1'b0}};
        else
            if (enable)
                Q <= Q + 1'b1;
            else
                Q <= Q;
    end 
endmodule


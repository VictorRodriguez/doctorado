`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
//////////////////////////////////////////////////////////////////////////////////


module adder_shifter_reg #(parameter n = 8)(
    input [n-1:0] A,
    input [2:0] count,
    output reg [2*n-1:0]Q,
    input rst,
    input enable,
    input clk
    );
   
   always @(posedge rst, posedge clk) 
    begin
        if (rst)
            Q <= {n{1'b0}};
        else
            if (enable)
                Q <= Q + (A << count);
            else
                Q <= Q;
    end 

endmodule

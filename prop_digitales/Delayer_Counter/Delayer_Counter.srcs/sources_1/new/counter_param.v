`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITESO
// Engineer: Cuauhtemoc Aguilera
//////////////////////////////////////////////////////////////////////////////////
module counter_param # (parameter n = 4)

(
    input clk,
    input rst,
    input enable,
    output reg [n-1:0] q
    );
    
  
 always @(posedge rst, posedge clk) 
    begin
        if (rst)
            q <= {n{1'b0}};
        else
            if (enable)
                q <= q + 1'b1;
            else
                q <= q;
    end 
endmodule

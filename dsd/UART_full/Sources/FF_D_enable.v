`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITESO 
// Engineer: Cuauhtemoc Aguilera
//////////////////////////////////////////////////////////////////////////////////
module FF_D_enable(
    input clk,
    input rst,
    input enable,
    input d,
    output reg q
    );
always @(posedge rst, posedge clk) // asychronous reset
    begin
        if(rst)
            q <= 1'b0;
        else
            if(enable)
                q <= d;
            else
                q <= q;
end
endmodule

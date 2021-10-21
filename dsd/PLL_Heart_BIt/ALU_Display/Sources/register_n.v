`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
//////////////////////////////////////////////////////////////////////////////////


module register_n # (parameter n = 4)(
    input [n-1:0]D,
    input clk,
    input rst,
    input load,
    output reg [n-1:0]Q
    );
    
    always @(posedge clk)
        if (rst)
            begin
                Q <= n-1'b0;
            end 
        else if (load)
            begin
            Q <= D;
            end
endmodule
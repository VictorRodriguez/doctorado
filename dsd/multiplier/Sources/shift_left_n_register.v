`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
//////////////////////////////////////////////////////////////////////////////////


module shift_left_n_register # (parameter N = 1)(
    input [4:0] IN,
    output reg [9:0] OUT,
    input rst,
    input enable,
    input clk
    );
   
    always@(posedge rst or posedge clk)
    begin
        if (rst)
            OUT <= 8'b00;
        else
            if(enable)
                OUT <= {{5-N{1'b0}},IN,{N{1'b0}}};
            else
                OUT <= OUT;
    end  
endmodule

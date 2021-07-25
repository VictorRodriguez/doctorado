`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/23/2021 10:48:32 PM
// Design Name: 
// Module Name: delayer_same_duty
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


module delayer_same_duty # (parameter width = 27, parameter YY = 100000000)(
    input clk,
    input rst,
    input enable,
    output out
    );
    
    wire iguales_w;
    Delayer # ( .width(width), .YY(YY) ) delay_i ( .clk(clk), .rst(rst), .enable(enable), .iguales(iguales_w) );
    
    ff_t ff_t_0( .clk(clk),.rst(rst),.t(iguales_w),.q(out));
    
     
endmodule

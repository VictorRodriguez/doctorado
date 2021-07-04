`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITESO
// Engineer:  Cuauhtemoc Aguilera
//////////////////////////////////////////////////////////////////////////////////


module Delayer_Counter # (parameter n = 4, parameter width = 27, parameter YY = 100000000)
(
    input clk,
    input rst,
    input enable,
    output [n-1:0] q
    );
    
 wire iguales_w; 
  
  Delayer       # ( .width(width), .YY(YY) ) delay_i ( .clk(clk), .rst(rst), .enable(enable), .iguales(iguales_w) );  
  
  counter_param # ( .n(n) ) counter_i (.clk(clk), .rst(rst), .enable(iguales_w), .q(q) );
  
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/23/2021 11:22:41 PM
// Design Name: 
// Module Name: delayer_same_duty_TB
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


module delayer_same_duty_TB();

reg clk,rst,enable;
wire out;

delayer_same_duty # (.width(8), .YY(10)) UUT(
    .clk(clk),
    .rst(rst),
    .enable(enable),
    .out(out)
    );

initial
    begin
    clk = 0;
    rst = 1;
    enable = 1;
    
    #20 rst = 0;
    end

always
    begin
        #10 clk = ~clk;
    end
endmodule

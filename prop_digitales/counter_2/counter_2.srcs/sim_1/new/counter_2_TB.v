`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/01/2021 11:38:39 AM
// Design Name: 
// Module Name: counter_2_TB
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


module counter_2_TB();

reg clk;
reg rstn;
wire [3:0] OUT;

counter_2 UUT(.clk(clk),.rstn(rstn),.OUT(OUT));

initial begin
    clk <= 0;
    rstn <= 0;
    
    #20 rstn <= 1;
    #80 rstn <= 0;
    #50 rstn <= 1;
end

always
    begin
        # 10 clk = ~clk;
    end

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/18/2021 09:53:45 PM
// Design Name: 
// Module Name: master_spi_TB
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


module master_spi_TB();

reg clk,rst,read;
wire sclk,cs;

master_spi UUT(.rst(rst),.clk(clk),.sclk(sclk),.cs(cs),.read(read));

initial
    begin
    clk = 0;
    rst = 0;
    read = 1;
    
    #5 rst = 1;
    #10 rst = 0;
    end
    
always
    begin
    #10 clk = ~clk;
    end

    
always
    begin
    #500 read = ~read;
    end
endmodule

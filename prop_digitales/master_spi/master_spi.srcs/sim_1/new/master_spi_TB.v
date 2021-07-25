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

reg clk,rst,read,miso;
wire sclk,cs;
wire [14:0]OUT;

master_spi UUT(.rst(rst),.clk(clk),.sclk(sclk),.cs(cs),.read(read), .miso(miso), .OUT(OUT));

initial
    begin
    clk = 0;
    rst = 0;
    read = 1;
    miso = 1;
    
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

always
    begin
    #100 miso = ~miso;
    end

endmodule

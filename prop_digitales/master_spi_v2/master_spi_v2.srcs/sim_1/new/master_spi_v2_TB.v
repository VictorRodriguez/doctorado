`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/29/2021 05:03:07 PM
// Design Name: 
// Module Name: master_spi_v2_TB
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


module master_spi_v2_TB();

reg clk,rst,read,count_limit;
wire cs;
wire [1:0]out;
wire load;
wire start_count;
wire reset_counter;

master_spi_v2 UUT(
    .clk(clk), 
    .read(read),
    .rst(rst),
//    .count_limit(count_limit), 
    .out(out), 
    .cs(cs),
    .load(load),
    .start_count(start_count),
    .reset_counter(reset_counter));
    
initial
    begin
    rst = 1;
    clk = 0;
    read = 0;
    count_limit = 0;
    
    #20 rst = 0;
    end
    
always
    begin
    #10 clk = ~clk;
    end
    
always
    begin
    #100 read = ~read;
    end
 
//always
//    begin
//    #2000 count_limit = ~count_limit;
//    end

endmodule

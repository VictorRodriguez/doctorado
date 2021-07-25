`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/23/2021 10:02:06 PM
// Design Name: 
// Module Name: sensor_luz_TB
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


module sensor_luz_TB();

reg clk,rst,sdo,enable;
wire sclk,cs;


sensor_luz UUT(
    .clk(clk),
    .rst(rst),
//    .sdo(sdo),
    .enable(enable),
    .sclk(sclk),
    .cs(cs)
    );
    
    
initial
    begin
        clk = 1'b0;
        rst = 1'b1;
        sdo = 1'b1;
        enable = 1'b0;
        #15 rst = 1'b0;
        
    end
    
always
    begin
        #10 clk = ~clk;
    end
endmodule

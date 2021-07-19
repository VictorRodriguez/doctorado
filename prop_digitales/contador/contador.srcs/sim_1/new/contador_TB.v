`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/15/2021 06:32:56 AM
// Design Name: 
// Module Name: contador_TB
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


module contador_TB();
    
    reg nclk,rst,enable;
    wire [4-1:0]Q;
    
    contador # (.n(4)) UUT(
    .nclk(nclk),
    .rst(rst),
    .enable(enable),
    .Q(Q)
    );
    
    initial
    begin
       nclk = 0;
       rst = 0;
       enable = 1;
       
       #10 rst = 1;
       #20 rst = 0;
       
    end
    
    always 
    begin
        nclk = 1'b1; 
        #10;
        nclk = 1'b0;
        #10;
    end
    
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/23/2021 11:10:32 PM
// Design Name: 
// Module Name: ff_t_TB
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


module ff_t_TB();

reg clk,rst,t;
wire q;

ff_t UUT(
    .clk(clk),
    .rst(rst),
    .t(t),
    .q(q)
    );
    
 initial
    begin
        clk = 0;
        rst = 0;
        t = 1;
        
        #10 rst = 1;
        #20 rst = 0;
    end

always
    begin
    #10 clk = ~clk;
    end

    
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/06/2021 09:55:42 PM
// Design Name: 
// Module Name: ff_d_TB
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


module ff_d_TB();

reg d;
reg clk;
reg rst;
wire q,not_q;

ff_d UUT( 
    .d(d),
    .clk(clk),
    .rst(rst),
    .q(q),
    .not_q(not_q)
    );
    
initial
    begin
        d = 1'b0;
        clk = 1'b0;
        rst = 1'b1;
        
        #5 rst = 1'b0;
        #500 rst = 1'b1;
        #500 rst = 1'b0;

    end

always
    begin
        #10 clk = ~clk;
    end
    
always
    
    begin
        #20 d = ~d;
    end

endmodule

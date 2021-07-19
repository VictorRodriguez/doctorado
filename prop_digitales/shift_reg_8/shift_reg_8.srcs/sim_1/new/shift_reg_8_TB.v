`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/15/2021 12:57:57 PM
// Design Name: 
// Module Name: shift_reg_8_TB
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


module shift_reg_8_TB();

reg serin;
reg clk;
reg enable;
reg rst;
wire [7:0]Q;

shit_reg_8 UUT(
     .serin(serin),
     .Q(Q),
     .clk(clk),
     .enable(enable),
     .rst(rst)
    );

initial
begin
    serin = 1;
    clk = 0;
    enable = 1;
    rst = 0;
    
    #10 rst = 1;
    #20 rst = 20;
end


always
    begin
        #10 clk = ~clk;
    end

endmodule

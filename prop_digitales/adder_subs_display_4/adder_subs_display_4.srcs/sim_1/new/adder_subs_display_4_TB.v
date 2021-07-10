`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/10/2021 06:38:16 AM
// Design Name: 
// Module Name: adder_subs_display_4_TB
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


module adder_subs_display_4_TB();

reg [3:0] A,B;
reg sum_subs_sel;
reg rst;
reg clk;
reg enable;

wire [3:0] A_abs,B_abs;
wire [4:0] Y_abs;

adder_subs_dsiplay_4 UUT (
    .A(A),
    .B(B),
    .SEL(),
    .sum_subs_sel(sum_subs_sel),
    .enable(enable),
    .rst(rst),
    .clk(clk),
    .seg_a(),
    .seg_b(),
    .seg_c(),
    .seg_d(),
    .seg_e(),
    .seg_f(),
    .seg_g(),
    
    .A_abs(A_abs),
    .B_abs(B_abs),
    .Y_abs(Y_abs)
    );


initial
    begin
    A = 4'b0000;
    B = 4'b0000;
    clk = 1'b0;
    enable = 1'b1;
    rst = 1'b1;
    sum_subs_sel = 1'b0;
 
    #5 rst = 1'b0;
    #7 rst = 1'b0;

    end
    
always
    begin
    #10 clk = ~clk;
    end
always
    begin
    #10 A = A + 1;
    end
 always
    begin
    #160 B = B + 1;
    end
always
    begin
    #256 sum_subs_sel = ~sum_subs_sel;
    end
endmodule

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


module contador_display_TB();
    
    reg nclk,rst,enable;
    wire seg_a;
    wire seg_b;
    wire seg_c;
    wire seg_d;
    wire seg_e;
    wire seg_f;
    wire seg_g;
    wire [3:0]SEL;

    contador_display # (.n(4)) UUT(
    .nclk(nclk),
    .rst(rst),
    .enable(enable),
    .seg_a(seg_a),
    .seg_b(seg_b),
    .seg_c(seg_c),
    .seg_d(seg_d),
    .seg_e(seg_e),
    .seg_f(seg_f),
    .seg_g(seg_g),
    .SEL(SEL)
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

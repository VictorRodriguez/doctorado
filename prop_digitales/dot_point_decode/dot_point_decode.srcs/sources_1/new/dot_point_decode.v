`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/10/2021 09:19:55 AM
// Design Name: 
// Module Name: dot_point_decode
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


module dot_point_decode # (parameter n = 2, parameter width = 18, parameter YY = 250_000)(
    input [3:0] A,
    output [3:0] SEL,
    output dot_point,
    input rst,
    input clk,
    input enable
    );
    
    wire [4:0] wire_A,wire_B,wire_C,wire_D,wire_Y;
    wire [1:0] wire_CNT;
    
    Delayer_Counter # (.n(n), .width(width), .YY(YY)) Delayer_Counter_1 (.clk(clk),.rst(rst),.enable(~enable),.q(wire_CNT));
    
    
    mux_4_1_size_1 mux_4_1_size_1_0(
        .A(A[0]),
        .B(A[1]),
        .C(A[2]),
        .D(A[3]),
        .Y(dot_point),
        .SEL(wire_CNT));
    
    decode_2_4_display decode_2_4_display_0(.a(wire_CNT[1]),.b(wire_CNT[0]),.Y(SEL));
      
endmodule

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
    input dot_input_a,
    input dot_input_b,
    input dot_input_s,
    output dot_point,
    input rst,
    input clk,
    input enable
    );
    
    wire [1:0] wire_CNT;
    
    Delayer_Counter # (.n(n), .width(width), .YY(YY)) Delayer_Counter_1 (.clk(clk),.rst(rst),.enable(~enable),.q(wire_CNT));
    
    
    mux_4_1_size_1 mux_4_1_size_1_0(
        .A(dot_input_a),
        .B(1'b1),
        .C(dot_input_b),
        .D(dot_input_s),
        .Y(dot_point),
        .SEL(wire_CNT));
  
      
endmodule

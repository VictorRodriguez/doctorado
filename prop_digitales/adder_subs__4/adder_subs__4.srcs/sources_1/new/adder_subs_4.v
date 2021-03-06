`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/04/2021 09:10:34 PM
// Design Name: 
// Module Name: adder_subs_4
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


module adder_subs_4 (
    input [3:0]A,
    input [3:0]B,
    input sum_subs_sel,
    output [4:0]Y
    );
    
    
    wire [3:0] wire_A,wire_B_comp2,wire_B;
    wire [1:0] wire_CNT;
    
    // get the compl 2 of B
    comp_2_4 comp_2_4_0 (.A(B),.Y(wire_B_comp2));
    
    //choose btw B or comp 2 of B
    mux_2_1_size_4 mux_2_1_size_4_0(.A(B),.B(wire_B_comp2),.sel(sum_subs_sel),.Y(wire_B));
    
    adder_4 adder_0 (
    .A(A),
    .B(wire_B),
    .cin("0"),
    .S(Y));
        
endmodule

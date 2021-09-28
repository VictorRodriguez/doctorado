`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2021 05:22:32 AM
// Design Name: 
// Module Name: multiplicador
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


module multiplicador(
    input [4:0] A,
    input [4:0] B,
    output [9:0] RESULT,
    input clk,
    input enable,
    input rst
    );
    
    wire [4:0]p_result_0_in;
    wire [4:0]p_result_1_in;
    wire [4:0]p_result_2_in;
    wire [4:0]p_result_3_in;
    wire [4:0]p_result_4_in;
    wire [9:0]p_result_0;
    wire [9:0]p_result_1;
    wire [9:0]p_result_2;
    wire [9:0]p_result_3;
    wire [9:0]p_result_4;
    
    
    wire [4:0]A_abs;
    wire [4:0]B_abs;
    
    assign A_abs = (A[4]== 1'b1)? -A:A;
    assign B_abs = (B[4]== 1'b1)? -B:B;
        
    assign p_result_0_in = (A_abs[0]== 1'b0)? 5'b00000: B_abs;
    assign p_result_1_in = (A_abs[1]== 1'b0)? 5'b00000: B_abs;
    assign p_result_2_in = (A_abs[2]== 1'b0)? 5'b00000: B_abs;
    assign p_result_3_in = (A_abs[3]== 1'b0)? 5'b00000: B_abs;
    assign p_result_4_in = (A_abs[4]== 1'b0)? 5'b00000: B_abs;

    shift_left_n_register # (.N(0)) reg_0(
    .IN(p_result_0_in),
    .OUT(p_result_0),
    .rst(rst),
    .enable(enable),
    .clk(clk)
    );
        
    shift_left_n_register # (.N(1)) reg_1(
    .IN(p_result_1_in),
    .OUT(p_result_1),
    .rst(rst),
    .enable(enable),
    .clk(clk)
    );
    
    shift_left_n_register # (.N(2)) reg_2(
    .IN(p_result_2_in),
    .OUT(p_result_2),
    .rst(rst),
    .enable(enable),
    .clk(clk)
    );
    
    shift_left_n_register # (.N(3)) reg_3(
    .IN(p_result_3_in),
    .OUT(p_result_3),
    .rst(rst),
    .enable(enable),
    .clk(clk)
    );
        
    shift_left_n_register # (.N(4)) reg_4(
    .IN(p_result_4_in),
    .OUT(p_result_4),
    .rst(rst),
    .enable(enable),
    .clk(clk)
    );
    
    assign RESULT = p_result_0 + p_result_1 + p_result_2 + p_result_3 + p_result_4;
    
endmodule

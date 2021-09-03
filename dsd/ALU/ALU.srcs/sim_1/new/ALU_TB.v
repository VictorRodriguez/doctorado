`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/03/2021 12:08:32 AM
// Design Name: 
// Module Name: ALU_TB
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


module ALU_TB();


    reg [3:0]A;
    reg [3:0]B;
    reg [3:0]REG_CONTROL;
    wire [7:0] RESULT;
    
ALU UUT(
    .A(A),
    .B(B),
    .REG_CONTROL(REG_CONTROL),
    .RESULT(RESULT)
    );
    
initial
begin
    A = 4'b0000;
    B = 4'b0000;
    REG_CONTROL = 4'b0000;
end

always
begin
    # 20 REG_CONTROL = REG_CONTROL + 1;
end 

always
begin
    # 320 A = A + 1;
end 

always
begin
    # 320 B = B + 1;
end     
endmodule

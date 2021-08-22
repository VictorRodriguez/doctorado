`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/21/2021 06:11:11 PM
// Design Name: 
// Module Name: contador_unos_TB
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


module contador_unos_TB();

reg [3:0]A;
wire out_0,out_1,out_2;

contador_unos UUT(
    .a(A[0]),
    .b(A[1]),
    .c(A[2]),
    .d(A[3]),
    .out_0(out_0),
    .out_1(out_1),
    .out_2(out_2)
    );
    
    initial
        begin
        A = 3'b0;
        end
    always
        begin
        #10 A = A + 1;
        end
    
endmodule

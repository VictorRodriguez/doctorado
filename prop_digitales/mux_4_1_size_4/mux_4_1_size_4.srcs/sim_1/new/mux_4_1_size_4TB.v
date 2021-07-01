`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/30/2021 09:49:52 PM
// Design Name: 
// Module Name: mux_4_1_size_4_TB
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


module mux_4_1_size_4_TB();

reg [3:0] A,B,C,D;
reg [1:0] SEL;
wire [3:0] Y;

mux_4_1_size_4 UUT(.A(A),.B(B),.C(C),.D(D),.Y(Y),.SEL(SEL));

initial
    begin
    A = 4'hA; 
    B = 4'hB;
    C = 4'hC;
    D = 4'hD; 
    SEL = 2'b00;
end

always
    begin
        #10 SEL = SEL + 1'b1;
    end
    


endmodule

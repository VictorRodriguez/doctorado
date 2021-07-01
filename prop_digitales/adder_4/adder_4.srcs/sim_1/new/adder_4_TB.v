`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/26/2021 09:18:28 AM
// Design Name: 
// Module Name: adder_4_TB
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


module adder_4_TB();

reg [3:0] A;
reg [3:0] B;
reg cin;
wire [4:0] S;

adder_4 UUT(
    .A(A),
    .B(B),
    .S(S),
    .cin(cin)
    );

initial 
begin 
    A = 4'b0;
    B = 4'b0;
    cin = 1'b0;
end

always
begin
    # 10 A = A + 1'b1;
end

always
begin
    # 160 B = B + 1'b1;
end 


always
begin
    # 2560 cin = ~cin;
end 

endmodule
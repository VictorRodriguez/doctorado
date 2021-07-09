`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/08/2021 07:53:27 AM
// Design Name: 
// Module Name: adder_subs_4_TB
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


module adder_subs_4_TB();

reg [3:0] A,B;
reg sum_subs_sel;
wire [4:0] Y;

adder_subs_4 UUT(
    .A(A),
    .B(B),
    .sum_subs_sel(sum_subs_sel),
    .Y(Y)
    );
    
    
initial 
begin 
    A = 4'b0;
    B = 4'b0;
    sum_subs_sel = 1'b0;
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
    # 256 sum_subs_sel = ~sum_subs_sel;
end 
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/26/2021 08:29:55 PM
// Design Name: 
// Module Name: adder_decoder_7seg_TB
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


module adder_decoder_7seg_TB();

reg [3:0] A;
reg [3:0] B;
reg cin;
wire a,b,c,d,e,f,g,co;

adder_decoder_7seg UUT(
    .A(A),
    .B(B),
    .seg_a(a),
    .seg_b(b),
    .seg_c(c),
    .seg_d(d),
    .seg_e(e),
    .seg_f(f),
    .seg_g(g),
    .cin(cin),
    .co(co)
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
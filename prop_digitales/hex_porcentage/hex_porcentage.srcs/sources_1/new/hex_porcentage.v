`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/24/2021 09:46:33 PM
// Design Name: 
// Module Name: hex_porcentage
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


module hex_porcentage(
    input clk,
    input rst,
    input enable,
    input [7:0] INPUT_DATA,
    output [3:0] SEL,
    output seg_a,
    output seg_b,
    output seg_c,
    output seg_d,
    output seg_e,
    output seg_f,
    output seg_g
    );
    
    wire [11:0]BCD;
    reg [8:0]porcentage;
    //always block for converting 255 to 100 %
    always @(INPUT_DATA)
    begin
        case (INPUT_DATA) //case statement
8'b0: porcentage =8'b0;
8'b1: porcentage =8'b0;
8'b10: porcentage =8'b0;
8'b11: porcentage =8'b1;
8'b100: porcentage =8'b1;
8'b101: porcentage =8'b1;
8'b110: porcentage =8'b10;
8'b111: porcentage =8'b10;
8'b1000: porcentage =8'b11;
8'b1001: porcentage =8'b11;
8'b1010: porcentage =8'b11;
8'b1011: porcentage =8'b100;
8'b1100: porcentage =8'b100;
8'b1101: porcentage =8'b101;
8'b1110: porcentage =8'b101;
8'b1111: porcentage =8'b101;
8'b10000: porcentage =8'b110;
8'b10001: porcentage =8'b110;
8'b10010: porcentage =8'b111;
8'b10011: porcentage =8'b111;
8'b10100: porcentage =8'b111;
8'b10101: porcentage =8'b1000;
8'b10110: porcentage =8'b1000;
8'b10111: porcentage =8'b1001;
8'b11000: porcentage =8'b1001;
8'b11001: porcentage =8'b1001;
8'b11010: porcentage =8'b1010;
8'b11011: porcentage =8'b1010;
8'b11100: porcentage =8'b1010;
8'b11101: porcentage =8'b1011;
8'b11110: porcentage =8'b1011;
8'b11111: porcentage =8'b1100;
8'b100000: porcentage =8'b1100;
8'b100001: porcentage =8'b1100;
8'b100010: porcentage =8'b1101;
8'b100011: porcentage =8'b1101;
8'b100100: porcentage =8'b1110;
8'b100101: porcentage =8'b1110;
8'b100110: porcentage =8'b1110;
8'b100111: porcentage =8'b1111;
8'b101000: porcentage =8'b1111;
8'b101001: porcentage =8'b10000;
8'b101010: porcentage =8'b10000;
8'b101011: porcentage =8'b10000;
8'b101100: porcentage =8'b10001;
8'b101101: porcentage =8'b10001;
8'b101110: porcentage =8'b10010;
8'b101111: porcentage =8'b10010;
8'b110000: porcentage =8'b10010;
8'b110001: porcentage =8'b10011;
8'b110010: porcentage =8'b10011;
8'b110011: porcentage =8'b10100;
8'b110100: porcentage =8'b10100;
8'b110101: porcentage =8'b10100;
8'b110110: porcentage =8'b10101;
8'b110111: porcentage =8'b10101;
8'b111000: porcentage =8'b10101;
8'b111001: porcentage =8'b10110;
8'b111010: porcentage =8'b10110;
8'b111011: porcentage =8'b10111;
8'b111100: porcentage =8'b10111;
8'b111101: porcentage =8'b10111;
8'b111110: porcentage =8'b11000;
8'b111111: porcentage =8'b11000;
8'b1000000: porcentage =8'b11001;
8'b1000001: porcentage =8'b11001;
8'b1000010: porcentage =8'b11001;
8'b1000011: porcentage =8'b11010;
8'b1000100: porcentage =8'b11010;
8'b1000101: porcentage =8'b11011;
8'b1000110: porcentage =8'b11011;
8'b1000111: porcentage =8'b11011;
8'b1001000: porcentage =8'b11100;
8'b1001001: porcentage =8'b11100;
8'b1001010: porcentage =8'b11101;
8'b1001011: porcentage =8'b11101;
8'b1001100: porcentage =8'b11101;
8'b1001101: porcentage =8'b11110;
8'b1001110: porcentage =8'b11110;
8'b1001111: porcentage =8'b11110;
8'b1010000: porcentage =8'b11111;
8'b1010001: porcentage =8'b11111;
8'b1010010: porcentage =8'b100000;
8'b1010011: porcentage =8'b100000;
8'b1010100: porcentage =8'b100000;
8'b1010101: porcentage =8'b100001;
8'b1010110: porcentage =8'b100001;
8'b1010111: porcentage =8'b100010;
8'b1011000: porcentage =8'b100010;
8'b1011001: porcentage =8'b100010;
8'b1011010: porcentage =8'b100011;
8'b1011011: porcentage =8'b100011;
8'b1011100: porcentage =8'b100100;
8'b1011101: porcentage =8'b100100;
8'b1011110: porcentage =8'b100100;
8'b1011111: porcentage =8'b100101;
8'b1100000: porcentage =8'b100101;
8'b1100001: porcentage =8'b100110;
8'b1100010: porcentage =8'b100110;
8'b1100011: porcentage =8'b100110;
8'b1100100: porcentage =8'b100111;
8'b1100101: porcentage =8'b100111;
8'b1100110: porcentage =8'b101000;
8'b1100111: porcentage =8'b101000;
8'b1101000: porcentage =8'b101000;
8'b1101001: porcentage =8'b101001;
8'b1101010: porcentage =8'b101001;
8'b1101011: porcentage =8'b101001;
8'b1101100: porcentage =8'b101010;
8'b1101101: porcentage =8'b101010;
8'b1101110: porcentage =8'b101011;
8'b1101111: porcentage =8'b101011;
8'b1110000: porcentage =8'b101011;
8'b1110001: porcentage =8'b101100;
8'b1110010: porcentage =8'b101100;
8'b1110011: porcentage =8'b101101;
8'b1110100: porcentage =8'b101101;
8'b1110101: porcentage =8'b101101;
8'b1110110: porcentage =8'b101110;
8'b1110111: porcentage =8'b101110;
8'b1111000: porcentage =8'b101111;
8'b1111001: porcentage =8'b101111;
8'b1111010: porcentage =8'b101111;
8'b1111011: porcentage =8'b110000;
8'b1111100: porcentage =8'b110000;
8'b1111101: porcentage =8'b110001;
8'b1111110: porcentage =8'b110001;
8'b1111111: porcentage =8'b110001;
8'b10000000: porcentage =8'b110010;
8'b10000001: porcentage =8'b110010;
8'b10000010: porcentage =8'b110010;
8'b10000011: porcentage =8'b110011;
8'b10000100: porcentage =8'b110011;
8'b10000101: porcentage =8'b110100;
8'b10000110: porcentage =8'b110100;
8'b10000111: porcentage =8'b110100;
8'b10001000: porcentage =8'b110101;
8'b10001001: porcentage =8'b110101;
8'b10001010: porcentage =8'b110110;
8'b10001011: porcentage =8'b110110;
8'b10001100: porcentage =8'b110110;
8'b10001101: porcentage =8'b110111;
8'b10001110: porcentage =8'b110111;
8'b10001111: porcentage =8'b111000;
8'b10010000: porcentage =8'b111000;
8'b10010001: porcentage =8'b111000;
8'b10010010: porcentage =8'b111001;
8'b10010011: porcentage =8'b111001;
8'b10010100: porcentage =8'b111010;
8'b10010101: porcentage =8'b111010;
8'b10010110: porcentage =8'b111010;
8'b10010111: porcentage =8'b111011;
8'b10011000: porcentage =8'b111011;
8'b10011001: porcentage =8'b111100;
8'b10011010: porcentage =8'b111100;
8'b10011011: porcentage =8'b111100;
8'b10011100: porcentage =8'b111101;
8'b10011101: porcentage =8'b111101;
8'b10011110: porcentage =8'b111101;
8'b10011111: porcentage =8'b111110;
8'b10100000: porcentage =8'b111110;
8'b10100001: porcentage =8'b111111;
8'b10100010: porcentage =8'b111111;
8'b10100011: porcentage =8'b111111;
8'b10100100: porcentage =8'b1000000;
8'b10100101: porcentage =8'b1000000;
8'b10100110: porcentage =8'b1000001;
8'b10100111: porcentage =8'b1000001;
8'b10101000: porcentage =8'b1000001;
8'b10101001: porcentage =8'b1000010;
8'b10101010: porcentage =8'b1000010;
8'b10101011: porcentage =8'b1000011;
8'b10101100: porcentage =8'b1000011;
8'b10101101: porcentage =8'b1000011;
8'b10101110: porcentage =8'b1000100;
8'b10101111: porcentage =8'b1000100;
8'b10110000: porcentage =8'b1000101;
8'b10110001: porcentage =8'b1000101;
8'b10110010: porcentage =8'b1000101;
8'b10110011: porcentage =8'b1000110;
8'b10110100: porcentage =8'b1000110;
8'b10110101: porcentage =8'b1000110;
8'b10110110: porcentage =8'b1000111;
8'b10110111: porcentage =8'b1000111;
8'b10111000: porcentage =8'b1001000;
8'b10111001: porcentage =8'b1001000;
8'b10111010: porcentage =8'b1001000;
8'b10111011: porcentage =8'b1001001;
8'b10111100: porcentage =8'b1001001;
8'b10111101: porcentage =8'b1001010;
8'b10111110: porcentage =8'b1001010;
8'b10111111: porcentage =8'b1001010;
8'b11000000: porcentage =8'b1001011;
8'b11000001: porcentage =8'b1001011;
8'b11000010: porcentage =8'b1001100;
8'b11000011: porcentage =8'b1001100;
8'b11000100: porcentage =8'b1001100;
8'b11000101: porcentage =8'b1001101;
8'b11000110: porcentage =8'b1001101;
8'b11000111: porcentage =8'b1001110;
8'b11001000: porcentage =8'b1001110;
8'b11001001: porcentage =8'b1001110;
8'b11001010: porcentage =8'b1001111;
8'b11001011: porcentage =8'b1001111;
8'b11001100: porcentage =8'b1010000;
8'b11001101: porcentage =8'b1010000;
8'b11001110: porcentage =8'b1010000;
8'b11001111: porcentage =8'b1010001;
8'b11010000: porcentage =8'b1010001;
8'b11010001: porcentage =8'b1010001;
8'b11010010: porcentage =8'b1010010;
8'b11010011: porcentage =8'b1010010;
8'b11010100: porcentage =8'b1010011;
8'b11010101: porcentage =8'b1010011;
8'b11010110: porcentage =8'b1010011;
8'b11010111: porcentage =8'b1010100;
8'b11011000: porcentage =8'b1010100;
8'b11011001: porcentage =8'b1010101;
8'b11011010: porcentage =8'b1010101;
8'b11011011: porcentage =8'b1010101;
8'b11011100: porcentage =8'b1010110;
8'b11011101: porcentage =8'b1010110;
8'b11011110: porcentage =8'b1010111;
8'b11011111: porcentage =8'b1010111;
8'b11100000: porcentage =8'b1010111;
8'b11100001: porcentage =8'b1011000;
8'b11100010: porcentage =8'b1011000;
8'b11100011: porcentage =8'b1011001;
8'b11100100: porcentage =8'b1011001;
8'b11100101: porcentage =8'b1011001;
8'b11100110: porcentage =8'b1011010;
8'b11100111: porcentage =8'b1011010;
8'b11101000: porcentage =8'b1011010;
8'b11101001: porcentage =8'b1011011;
8'b11101010: porcentage =8'b1011011;
8'b11101011: porcentage =8'b1011100;
8'b11101100: porcentage =8'b1011100;
8'b11101101: porcentage =8'b1011100;
8'b11101110: porcentage =8'b1011101;
8'b11101111: porcentage =8'b1011101;
8'b11110000: porcentage =8'b1011110;
8'b11110001: porcentage =8'b1011110;
8'b11110010: porcentage =8'b1011110;
8'b11110011: porcentage =8'b1011111;
8'b11110100: porcentage =8'b1011111;
8'b11110101: porcentage =8'b1100000;
8'b11110110: porcentage =8'b1100000;
8'b11110111: porcentage =8'b1100000;
8'b11111000: porcentage =8'b1100001;
8'b11111001: porcentage =8'b1100001;
8'b11111010: porcentage =8'b1100010;
8'b11111011: porcentage =8'b1100010;
8'b11111100: porcentage =8'b1100010;
8'b11111101: porcentage =8'b1100011;
8'b11111110: porcentage =8'b1100011;
8'b11111111: porcentage =8'b1100100;
            default : porcentage = 8'b00000000; 
        endcase
    end
    
    
    BCD (
        .bin(porcentage), 
        .bcd(BCD)
    );
    
        
    decode_4_dig_7seg # (.n(2), .width(18), .YY(250_000))(
    .A(BCD[3:0]),
    .B(BCD[7:4]),
    .C(BCD[11:8]),
    .D(),   
    .clk(clk),
    .rst(rst),
    .enable(enable),
    .seg_a(seg_a),
    .seg_b(seg_b),
    .seg_c(seg_c),
    .seg_d(seg_d),
    .seg_e(seg_e),
    .seg_f(seg_f),
    .seg_g(seg_g),
    .SEL(SEL)
    );
    
endmodule

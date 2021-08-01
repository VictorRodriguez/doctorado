`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/01/2021 11:46:40 AM
// Design Name: 
// Module Name: binary_led_bar
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


module binary_led_bar(
    input [7:0] INPUT_BINARY,
    output reg [7:0] leds_bar
    );
    

    always @(INPUT_BINARY)
    begin
        case (INPUT_BINARY) //case statement
8'b0: leds_bar =8'b0;
8'b1: leds_bar =8'b0;
8'b10: leds_bar =8'b0;
8'b11: leds_bar =8'b0;
8'b100: leds_bar =8'b0;
8'b101: leds_bar =8'b0;
8'b110: leds_bar =8'b0;
8'b111: leds_bar =8'b0;
8'b1000: leds_bar =8'b0;
8'b1001: leds_bar =8'b0;
8'b1010: leds_bar =8'b0;
8'b1011: leds_bar =8'b0;
8'b1100: leds_bar =8'b1;
8'b1101: leds_bar =8'b1;
8'b1110: leds_bar =8'b1;
8'b1111: leds_bar =8'b1;
8'b10000: leds_bar =8'b1;
8'b10001: leds_bar =8'b1;
8'b10010: leds_bar =8'b1;
8'b10011: leds_bar =8'b1;
8'b10100: leds_bar =8'b1;
8'b10101: leds_bar =8'b1;
8'b10110: leds_bar =8'b1;
8'b10111: leds_bar =8'b1;
8'b11000: leds_bar =8'b1;
8'b11001: leds_bar =8'b11;
8'b11010: leds_bar =8'b11;
8'b11011: leds_bar =8'b11;
8'b11100: leds_bar =8'b11;
8'b11101: leds_bar =8'b11;
8'b11110: leds_bar =8'b11;
8'b11111: leds_bar =8'b11;
8'b100000: leds_bar =8'b11;
8'b100001: leds_bar =8'b11;
8'b100010: leds_bar =8'b11;
8'b100011: leds_bar =8'b11;
8'b100100: leds_bar =8'b11;
8'b100101: leds_bar =8'b111;
8'b100110: leds_bar =8'b111;
8'b100111: leds_bar =8'b111;
8'b101000: leds_bar =8'b111;
8'b101001: leds_bar =8'b111;
8'b101010: leds_bar =8'b111;
8'b101011: leds_bar =8'b111;
8'b101100: leds_bar =8'b111;
8'b101101: leds_bar =8'b111;
8'b101110: leds_bar =8'b111;
8'b101111: leds_bar =8'b111;
8'b110000: leds_bar =8'b111;
8'b110001: leds_bar =8'b111;
8'b110010: leds_bar =8'b1111;
8'b110011: leds_bar =8'b1111;
8'b110100: leds_bar =8'b1111;
8'b110101: leds_bar =8'b1111;
8'b110110: leds_bar =8'b1111;
8'b110111: leds_bar =8'b1111;
8'b111000: leds_bar =8'b1111;
8'b111001: leds_bar =8'b1111;
8'b111010: leds_bar =8'b1111;
8'b111011: leds_bar =8'b1111;
8'b111100: leds_bar =8'b1111;
8'b111101: leds_bar =8'b1111;
8'b111110: leds_bar =8'b11111;
8'b111111: leds_bar =8'b11111;
8'b1000000: leds_bar =8'b11111;
8'b1000001: leds_bar =8'b11111;
8'b1000010: leds_bar =8'b11111;
8'b1000011: leds_bar =8'b11111;
8'b1000100: leds_bar =8'b11111;
8'b1000101: leds_bar =8'b11111;
8'b1000110: leds_bar =8'b11111;
8'b1000111: leds_bar =8'b11111;
8'b1001000: leds_bar =8'b11111;
8'b1001001: leds_bar =8'b11111;
8'b1001010: leds_bar =8'b11111;
8'b1001011: leds_bar =8'b111111;
8'b1001100: leds_bar =8'b111111;
8'b1001101: leds_bar =8'b111111;
8'b1001110: leds_bar =8'b111111;
8'b1001111: leds_bar =8'b111111;
8'b1010000: leds_bar =8'b111111;
8'b1010001: leds_bar =8'b111111;
8'b1010010: leds_bar =8'b111111;
8'b1010011: leds_bar =8'b111111;
8'b1010100: leds_bar =8'b111111;
8'b1010101: leds_bar =8'b111111;
8'b1010110: leds_bar =8'b111111;
8'b1010111: leds_bar =8'b1111111;
8'b1011000: leds_bar =8'b1111111;
8'b1011001: leds_bar =8'b1111111;
8'b1011010: leds_bar =8'b1111111;
8'b1011011: leds_bar =8'b1111111;
8'b1011100: leds_bar =8'b1111111;
8'b1011101: leds_bar =8'b1111111;
8'b1011110: leds_bar =8'b1111111;
8'b1011111: leds_bar =8'b1111111;
8'b1100000: leds_bar =8'b1111111;
8'b1100001: leds_bar =8'b1111111;
8'b1100010: leds_bar =8'b1111111;
8'b1100011: leds_bar =8'b1111111;
            default : leds_bar = 8'b00000000; 
        endcase
    end

endmodule
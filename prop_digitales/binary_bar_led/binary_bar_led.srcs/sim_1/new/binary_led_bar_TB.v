`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/01/2021 11:51:46 AM
// Design Name: 
// Module Name: binary_led_bar_TB
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


module binary_led_bar_TB();

    reg [7:0] INPUT_BINARY;
    wire [7:0] leds_bar;
 
 binary_led_bar UUT(
    .INPUT_BINARY(INPUT_BINARY),
    .leds_bar(leds_bar)
    );
 
 initial
    begin
        INPUT_BINARY = 0;
    end   
    
  always
    begin
        # 10 INPUT_BINARY = INPUT_BINARY + 1;
    end
endmodule

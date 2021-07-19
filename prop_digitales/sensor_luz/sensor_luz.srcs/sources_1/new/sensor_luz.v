`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/15/2021 09:16:18 PM
// Design Name: 
// Module Name: sensor_luz
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


module sensor_luz(
    input clk,
    input rst,
    input sdo,
    output sclk,
    output cs,
    output seg_a,
    output seg_b,
    output seg_c,
    output seg_d,
    output seg_e,
    output seg_f,
    output seg_g,
    output [3:0]SEL
    );
    
    wire wire_cs;
    wire [7:0]wire_R_OUT;
    wire [7:0]wire_shift_reg;
    
    // Genera un reloj de 1 MHz
    Delayer # (.width(8), .YY(100)) delay_1_mhz (
    .clk(clk),
    .rst(rst),
    .enable(enable),
    .iguales(sclk)
    );

    // Genera un reloj de 1 seg para leer cada segundo el sensor
    Delayer # (.width(27), .YY(100_000_000)) delay_1_seg (
    .clk(clk),
    .rst(rst),
    .enable(enable),
    .iguales(wire_cs)
    );
    
    
    /*
    Master_spi master_spi (.read(clk_read),
    .miso(sdo),
    .clk(clk_spi),
    .cs(cs),
    .sclk(clk_read),
    .R_OUT(wire_R_OUT)
    );
    */
    
    shit_reg_16(
    .serin(sdo),
    .Q(wire_R_OUT),
    .clk(clk),
    .enable(wire_cs),
    .rst(rst)
    );
    
    decode_4_dig_7seg # (.n(2), .width(18), .YY(250_000)) decode_4_dig_7seg_1 (
    .A(wire_R_OUT[3:0]),
    .B(wire_R_OUT[7:4]),
    .C(),
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

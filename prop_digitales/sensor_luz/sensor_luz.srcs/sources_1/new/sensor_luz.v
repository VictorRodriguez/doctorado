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
    input enable,
    output sclk,
    output cs,
    output sclk_led,
    output cs_led,
    output [7:0]led,
    output seg_a,
    output seg_b,
    output seg_c,
    output seg_d,
    output seg_e,
    output seg_f,
    output seg_g,
    output [3:0]SEL
    );
    
    // Genera un reloj de 1 MHz
    delayer_same_duty # (.width(6), .YY(50)) sclk_clock(
    .clk(clk),
    .rst(rst),
    .enable(~enable),
    .out(sclk)
    );
    
    assign sclk_led = sclk;
    
    // Genera un reloj de 1 seg para leer cada segundo el sensor
    delayer_same_duty # (.width(27), .YY(50000000)) cs_clock(
    .clk(clk),
    .rst(rst),
    .enable(~enable),
    .out(cs)
    );
    
    
    
    assign cs_led = cs;

    shit_reg # (.width(15))(
    .serin(sdo),
    .Q(shift_reg_data),
    .clk(sclk),
    .enable(cs),
    .rst(rst)
    );
    
    
    wire [14:0]shift_reg_data;
    wire [7:0]reg_8;
    wire [11:0] wire_BCD;
    
    register_n # (.n(8))(
    .D(shift_reg_data[10:3]),
    .clk(clk),
    .rst(rst),
    .load(~cs),
    .Q(reg_8)
    );
    
    assign led = reg_8;
   /*
    master_spi master_spi_0(
    .read(wire_read),
    .rst(rst),
    .clk(clk_spi),
    .miso(sdo),
    .sclk(sclk),
    .cs(cs),
    .OUT(led)
    );
    */
    
    
    binary_bcd_perc(
    .DATA_IN(reg_8),
    .DATA_OUT(wire_BCD)
    );
    
    decode_4_dig_7seg # (.n(2), .width(18), .YY(250_000)) decode_4_dig_7seg_1 (
    .A(wire_BCD[3:0]),
    .B(wire_BCD[7:4]),
    .C(wire_BCD[11:8]),
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

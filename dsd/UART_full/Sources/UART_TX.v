`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2021 05:03:42 PM
// Design Name: 
// Module Name: UART_TX
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


module UART_TX(
    input [7:0] TX_DATA,
    input clk,
    input rst,
    input start,
    output tx_out,
    output [2:0]state,
    output boudrate_counter_ready,
    output rst_boudrate_counter,
    output load_register,
    output rst_bit_counter,
    output enable_bit_counter,
    output enable_boudrate_counter,
    output [3:0] bit_counter

    );

    wire ans_parity;
    
    // Module to detect parity: 
    // 1 = odd (impar)
    // 0 = even (par)
    parity_checker parity_checker_0(
    .INPUT(TX_DATA),
    .ans(ans_parity)
    );

    wire [10:0]data_full;
	 assign data_full = {{1'b1},{ans_parity},{TX_DATA[7:0]},{1'b0}};
    PISO_register #(.n(11)) PISO_register_0(
    .Parallel_In(data_full),
    .Serial_Out(tx_out),
    .load(load_register),
    .clk(clk),
    .enable(enable_bit_counter),
    .rst(rst)
    );
    
    
    UART_TX_FSM UART_TX_FSM_0(
    .start(start),
    .boudrate_counter_ready(boudrate_counter_ready),
    .bit_counter(bit_counter),
    .rst(rst),
    .clk(clk),
    .load_register(load_register),
    .rst_boudrate_counter(rst_boudrate_counter),
    .rst_bit_counter(rst_bit_counter),
    .enable_bit_counter(enable_bit_counter),
    .enable_boudrate_counter(enable_boudrate_counter),
    .state(state)
    );
    
    // deleyaer that shoudl be adjusted
    // generates clk at 9600 bps -> 5210
    Bit_Rate_Pulse # (.delay_counts(5210) ) BR_pulse (.clk(clk), .rst(rst_boudrate_counter), 
        .enable(1'b1), .end_bit_time(boudrate_counter_ready), .end_half_time ());
				
    Counter_Param  # (.n(4)) Counter_Param_0(
    .clk(clk),
    .rst(rst_bit_counter),
    .enable(enable_bit_counter),
    .Q(bit_counter)
    );

endmodule

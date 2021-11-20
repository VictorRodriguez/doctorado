`timescale 1ns / 1ps
module UART_Rx (
	input clk,
	input n_rst,
	input rx,
	output parity,
	//output [7:0]Rx_Data,
	output [8:0]Rx_SR,
	output heard_bit_out
	);
	


wire rst, rst_sr_w, rst_bit_counter_w, rst_BR_w;
wire sample_bit_w;
wire end_bit_time_w, end_half_time_w;
wire bit_count_enable_w, enable_out_reg_w;
wire [3:0] count_bits_w;
wire [8:0] Q_SR_w;
assign rst = ~n_rst;
assign rst_sr_w = rst;
assign Rx_SR = Q_SR_w;
Shift_Register_R_Param #(.width(9) ) shift_reg
    (.clk(clk), .rst(rst_sr_w), .enable(sample_bit_w),
     .d(rx), .Q(Q_SR_w) );

//Reg_Param  #(.width(8) ) rx_Data_reg (.rst(rst), .D(Q_SR_w[7:0]), .clk(clk),
	//						   .enable(enable_out_reg_w), .Q(Rx_Data)     );	

FF_D_enable ff_par (.clk(clk),.rst(rst_sr_w),.enable(enable_out_reg_w),
				 .d(Q_SR_w[8]), .q(parity)   );    

// For a baud rate of 9600 baudios: bit time 104.2 us, half time 52.1 us
// For a clock frequency of 50 MHz bit time = 5210 T50MHz;

Bit_Rate_Pulse # (.delay_counts(5210) ) BR_pulse (.clk(clk), .rst(rst_BR_w), 
			   .enable(1'b1), .end_bit_time(end_bit_time_w), .end_half_time (end_half_time_w)    );
			   
FSM_UART_Rx FSM_Rx (.rx(rx), .clk(clk), .rst(rst), .end_half_time_i(end_half_time_w),
				.end_bit_time_i(end_bit_time_w), .Rx_bit_Count(count_bits_w), 
				.sample_o(sample_bit_w), .bit_count_enable(bit_count_enable_w), .rst_BR(rst_BR_w),
				.rst_bit_counter(rst_bit_counter_w), .enable_out_reg(enable_out_reg_w) );			   
		
Counter_Param # (.n(4) ) Counter_bits (.clk(clk), .rst(rst_bit_counter_w), .enable(bit_count_enable_w), .Q(count_bits_w)    );

Heard_Bit  # (.Half_Period_Counts(25_000_000) ) // half second for a clk of 50 MHz 
          design_monitor (.clk(clk), .rst(rst), .enable(1'b1), .heard_bit_out(heard_bit_out)    );
endmodule		
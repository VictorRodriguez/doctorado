`timescale 1ns / 1ps


module UART_full(

	input [7:0] TX_DATA,
	input tx_send,
	input rx,
	input clk,
	input n_rst,

	output tx,
	output parity_error,
	output heard_bit_out,
	output [7:0] RX_DATA,
	output [20:0] DISPLAYS
);

wire [7:0] wire_Rx_SR;
wire [11:0] RESULT_WIRE_BCD;
wire [7:0] WIRE_REGISTER;

UART_Rx UART_Rx_1(
	.clk(clk),
	.n_rst(n_rst),
	.rx(rx),
	.parity(),
	.Rx_SR(wire_Rx_SR),
	.heard_bit_out(heard_bit_out)
	);

//wire start_db;
//debouncing debouncing_1(~tx_send,clk,tx_send_db);

wire heard_bit_out_wire;
assign heard_bit_out_wire = heard_bit_out;
UART_TX UART_TX_1(
   .TX_DATA(TX_DATA),
   .clk(clk),
   .rst(~n_rst),
   .start(~tx_send),
   .tx_out(tx),
   .state(),
   .boudrate_counter_ready(),
   .rst_boudrate_counter(),
   .rst_bit_counter(),
   .enable_bit_counter(),
   .enable_boudrate_counter(),
   .bit_counter()
    );
	 
parity_checker parity_checker_0(
    .INPUT(TX_DATA),
    .ans(parity_error)
    );


Reg_Param  #(.width(8)) Reg_Param_1(
    .rst(~n_rst),
    .D(wire_Rx_SR),
    .clk(clk),
    .enable(1'b1),
    .Q(WIRE_REGISTER)
    );

assign RX_DATA = WIRE_REGISTER;

BCD #(8) BCD_1(
     .bin({WIRE_REGISTER}),
     .bcd(RESULT_WIRE_BCD)
    );
	 
decode_7_anode decode_7_anode_1(
    .IN(RESULT_WIRE_BCD[3:0]),
    .a(DISPLAYS[0]),
    .b(DISPLAYS[1]),
    .c(DISPLAYS[2]),
    .d(DISPLAYS[3]),
    .e(DISPLAYS[4]),
    .f(DISPLAYS[5]),
    .g(DISPLAYS[6])
    );
	
decode_7_anode decode_7_anode_2(
    .IN(RESULT_WIRE_BCD[7:4]),
    .a(DISPLAYS[7]),
    .b(DISPLAYS[8]),
    .c(DISPLAYS[9]),
    .d(DISPLAYS[10]),
    .e(DISPLAYS[11]),
    .f(DISPLAYS[12]),
    .g(DISPLAYS[13])
    );
	 
	 
decode_7_anode decode_7_anode_3(
    .IN(RESULT_WIRE_BCD[11:8]),
    .a(DISPLAYS[14]),
    .b(DISPLAYS[15]),
    .c(DISPLAYS[16]),
    .d(DISPLAYS[17]),
    .e(DISPLAYS[18]),
    .f(DISPLAYS[19]),
    .g(DISPLAYS[20])
    );
endmodule
	
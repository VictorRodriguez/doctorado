`timescale 1ns / 1ps
// ITESO
// Cuauhtemoc Aguilera
// Testbench of a UAR
module UART_Rx_TB ( );

reg clk, rst, rx;
wire parity;
wire [7:0 ] Rx_Data;

UART_Rx UUT ( .clk(clk), .rst(rst), .rx(rx), 
		.parity(parity),  .Rx_Data(Rx_Data )	);

initial
	begin
		clk 		= 1'b0;
		rx 		= 1'b1;
		rst 		= 1'b1;
		# 5 rst 	= 1'b0;
	end

always
	begin
		#10 clk = ~ clk;
	end

always
	begin
		#80 rx = 1'b0;
		#10 rx = 1'b1;
		#10 rx = 1'b0;
	end	
endmodule	
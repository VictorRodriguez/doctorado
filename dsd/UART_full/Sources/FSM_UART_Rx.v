`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITESO
// Engineer: Cuauhtemoc Aguilera
// Finite State Machine to control a RS232 Receiver
////////////////////////////////////////////////////////////////////////////////////
module FSM_UART_Rx(
    input rx,
    input clk,
    input rst,
    input end_half_time_i,
    input end_bit_time_i,
    input [3:0] Rx_bit_Count,
    output reg sample_o,
    output reg bit_count_enable,
    output reg rst_BR,
    output reg rst_bit_counter,
    output reg enable_out_reg
    );

localparam INI_S		= 3'b000;
localparam START_S		= 3'b001;
localparam RX_BITS_S	= 3'b010;
localparam SAMPLE_S		= 3'b011;
localparam RX_WAIT_S	= 3'b100;
//localparam PARITY_S		= 3'b101;
//localparam SAMPLE_PAR_S	= 3'b110;
localparam STOP_S			= 3'b101;
localparam SAVE_RX_DATA_S	= 3'b110;

reg [2:0] Rx_state;


always @(posedge rst, posedge clk)
	begin
		if (rst) 
			Rx_state<= INI_S;
		else 
		case (Rx_state)
				INI_S: 		if (~rx)
								Rx_state <= START_S;
				START_S:		if (end_bit_time_i)
								Rx_state <= RX_BITS_S;
				RX_BITS_S:	if (Rx_bit_Count == 4'b1001)
								Rx_state <= STOP_S;
							else
								if (end_half_time_i)
									Rx_state <= SAMPLE_S;
				SAMPLE_S:		Rx_state <= RX_WAIT_S;
				RX_WAIT_S:	if (end_bit_time_i)	
								Rx_state <= RX_BITS_S;
				STOP_S:		if (end_bit_time_i)	
								Rx_state <= SAVE_RX_DATA_S;
				SAVE_RX_DATA_S:Rx_state <= INI_S;
				default:		Rx_state <= INI_S;
		endcase
	end
// OUTPUT DEFINITION
always @(Rx_state)
	begin
				case(Rx_state)
				INI_S: 	
					begin
						sample_o = 1'b0;
						bit_count_enable = 1'b0;
						rst_BR = 1'b1;
						rst_bit_counter = 1'b1;
						enable_out_reg = 1'b0;
						
					end
				START_S: 	
					begin
						sample_o = 1'b0;
						bit_count_enable = 1'b0;
						rst_BR = 1'b0;
						rst_bit_counter = 1'b1;
						enable_out_reg = 1'b0;
						
					end
				RX_BITS_S: 	
					begin
						sample_o = 1'b0;
						bit_count_enable = 1'b0;
						rst_BR = 1'b0;
						rst_bit_counter = 1'b0;
						enable_out_reg = 1'b0;
					end
				SAMPLE_S: 	
					begin
						sample_o 		= 1'b1;
						bit_count_enable = 1'b1;
						rst_BR = 1'b0;
						rst_bit_counter = 1'b0;
						enable_out_reg = 1'b0;
					end
				RX_WAIT_S:
					begin
						sample_o 		= 1'b0;
						bit_count_enable = 1'b0;
						rst_BR = 1'b0;
						rst_bit_counter = 1'b0;
						enable_out_reg = 1'b0;
					end
				STOP_S: 	
					begin
						sample_o = 1'b0;
						bit_count_enable = 1'b0;
						rst_BR = 1'b0;
						rst_bit_counter = 1'b0;
						enable_out_reg = 1'b0;
					end
				SAVE_RX_DATA_S: 	
					begin
						sample_o = 1'b0;
						bit_count_enable = 1'b0;
						rst_BR = 1'b0;
						rst_bit_counter = 1'b0;
						enable_out_reg = 1'b1;
					end						
				default:
					begin
						sample_o = 1'b0;
						bit_count_enable = 1'b0;
						rst_BR = 1'b0;
						rst_bit_counter = 1'b0;
						enable_out_reg = 1'b0;
					end
			endcase
	end
endmodule

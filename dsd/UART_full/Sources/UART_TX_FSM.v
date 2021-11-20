`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
//////////////////////////////////////////////////////////////////////////////////


module UART_TX_FSM(
    input start,
    input boudrate_counter_ready,
    input [3:0] bit_counter,
    input rst,
    input clk,
    output reg load_register,
    output reg rst_boudrate_counter,
    output reg rst_bit_counter,
    output reg enable_bit_counter,
    output reg enable_boudrate_counter,
    output reg [2:0] state
    );
    
	parameter S0 = 3'b000;
	parameter S1 = 3'b001;
	parameter S2 = 3'b010;
	parameter S3 = 3'b011;
	parameter S4 = 3'b100;
	parameter S5 = 3'b101;
	parameter S6 = 3'b110;
	
	always @ (state) begin
    case (state)
    S0: 
        begin
        rst_boudrate_counter = 1'b1;
        rst_bit_counter = 1'b1;
        load_register = 1'b0;
        enable_bit_counter = 1'b0;
        end    
    S1:
        begin
        load_register = 1'b1;
        enable_bit_counter = 1'b0;
        end
    S2:
        begin
        load_register = 1'b0;
        rst_boudrate_counter = 1'b0;
        rst_bit_counter = 1'b0;
        enable_bit_counter = 1'b1;
        enable_boudrate_counter = 1'b1;
        end
    S3:
        begin
        enable_bit_counter = 1'b0;
        end
    S4:
        begin
        rst_boudrate_counter = 1'b1;
        enable_boudrate_counter = 1'b0;
        enable_bit_counter = 1'b0;
        end
    S5:
        begin
        rst_boudrate_counter = 1'b0;
        enable_bit_counter = 1'b0;
        end
    S6:
        begin
        rst_boudrate_counter = 1'b1;
        rst_bit_counter = 1'b1;
        enable_bit_counter = 1'b0;
        end
    default:
        begin
        enable_bit_counter = 1'b0;
        enable_boudrate_counter = 1'b0;
        end
    endcase
    end
always @ (posedge clk or posedge rst) begin
    if (rst)
        state <= S0;
    else
        case (state)
        S0:
            if (start)
                state <= S1;
            else
                state <= S0;        
        S1:
            state <= S2;
        S2:
            state <=S3;

        S3:
            if (boudrate_counter_ready)
                state <= S4;
            else
                state <= S3;
        S4:
            state <= S5;
        S5:
            if (bit_counter == 4'b1011)
                state <= S6;
            else
                state <= S2;
        S6:
            state <= S6; 
    endcase
    end
endmodule
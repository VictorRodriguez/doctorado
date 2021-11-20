`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
//////////////////////////////////////////////////////////////////////////////////


module UART_full_TB();

reg [7:0]DATA;
reg start;
reg clk;
reg rst;

wire out;

UART_full UUT(
	.TX_DATA(DATA),
	.tx_send(start),
	.rx(),
	.clk(clk),
	.n_rst(rst),
	.tx(out),
	.parity_error(),
	.heard_bit_out(),
	.RX_DATA(),
	.DISPLAYS()
);

    
initial
begin
    DATA = 8'b10101110;
    start = 1;
    clk = 0;
    rst =1;
    #10 rst = 0;
    #10 rst = 1;
    #10 start = 0;
    #100 start = 1;
end

always
begin
    #10 clk = ~clk;
end

always
begin
    #3000 rst = 0;
    #10 DATA = DATA +1;
    #10 rst = 1;
    #30 start = 0;
    #100 start = 1;
end

endmodule

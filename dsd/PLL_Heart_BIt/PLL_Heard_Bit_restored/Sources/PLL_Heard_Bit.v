module PLL_Heard_Bit (
input n_rst,
input clk,
input enable,
output heard_bit_out,
output locked
);

wire clk_100M_w;
wire rst_w;

assign rst_w = ~n_rst;

PLL_DE10S PLL_ins (.refclk(clk), .rst(rst_w), .outclk_0(clk_100M_w), .locked(locked) );

Heard_Bit # (.Half_Period_Counts(50_000_000) ) // half second for a clk of 100 MHz 
		HB_ins(	.clk(clk_100M_w), .rst(rst_w), .enable(enable),
				.heard_bit_out(heard_bit_out) );
			
endmodule

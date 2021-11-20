
module Instr_Data_Memory #(parameter DATA_WIDTH= 32, parameter ADDR_WIDTH= 16 )(

	input 	[15:0]Addr,
	input 	clk,
	input 	WE,
	input 	[31:0]WD,
	output 	[31:0]RD

);

ROM_single_port #(.DATA_WIDTH(DATA_WIDTH), .ADDR_WIDTH(ADDR_WIDTH))(
	.addr(Adr),
	.clk(clk),
	.q(instruction));
	
single_port_ram #(.DATA_WIDTH(DATA_WIDTH), .ADDR_WIDTH(ADDR_WIDTH))(	
	.data(WD),
	.addr(Adr),
	.we(WE),
	.clk(clk),
	.q(data));

mux_2_1 # (.N (32))(.A(instruction), .B(data), .sel(Addr[15]), .Y(RD));

endmodule

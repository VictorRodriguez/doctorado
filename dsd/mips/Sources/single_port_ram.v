// Quartus II Verilog Template
// Single port RAM with single read/write address 
module single_port_ram 
#(parameter DATA_WIDTH = 8, parameter ADDR_WIDTH = 6)
(	input [(DATA_WIDTH-1):0] data,
	input [(ADDR_WIDTH-1):0] addr,
	input we, clk,
	output [(DATA_WIDTH-1):0] q );
// Declare the RAM array
reg [DATA_WIDTH-1:0] ram[2**ADDR_WIDTH-1:0];
always @ (posedge clk)
	begin
		// Write
		if (we)
			ram[addr] <= data;
	end
// Reading continuously
assign q = ram[addr];
endmodule

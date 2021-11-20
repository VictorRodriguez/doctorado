// Single Port ROM
module ROM_single_port #(parameter DATA_WIDTH=8, parameter ADDR_WIDTH=7)(
	input [(ADDR_WIDTH-1):0] addr,
	input clk, 
	output reg [(DATA_WIDTH-1):0] q );
	reg [DATA_WIDTH-1:0] rom[2**ADDR_WIDTH-1:0];
initial
  begin
    $readmemh("/home/vmrod/ROM_init.txt", rom);
  end
always@ (posedge clk)
  begin
    q <= rom[addr];
  end
endmodule

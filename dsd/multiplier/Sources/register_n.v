`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Company: ITESO
// Engineer: Victor Rodriguez
// Register parametrized to store data
////////////////////////////////////////////////////////////////////////////////

module register_n # (parameter n = 4)(
    input [n-1:0]D,
    input clk,
    input rst,
    input load,
    output reg [n-1:0]Q
    );
    
    always @(posedge clk or posedge rst )
	 begin
        if (rst == 1'b1)
			Q <= {n-1{1'b0}};
        else if (load == 1'b1 )
			Q <= D;
	end
endmodule

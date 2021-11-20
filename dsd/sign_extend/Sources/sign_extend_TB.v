`timescale 1ns / 1ps
module sign_extend_TB;

    // Inputs
    reg [15:0] extend;
    // Outputs
    wire [31:0] extended;

    // Instantiate the Unit Under Test (UUT)
    sign_extend #(.width(16)) uut (
        .extend(extend), 
        .extended(extended)
    );

    initial begin
			// Initialize Inputs
        extend = 0;
    end
	 
	always
	begin
		#10 extend = extend + 1;
	end
endmodule


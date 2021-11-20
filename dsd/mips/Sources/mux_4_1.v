`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
//////////////////////////////////////////////////////////////////////////////////


module mux_4_1 # (parameter N = 4)(

    input [N-1:0] A,
    input [N-1:0] B, 
	 input [N-1:0] C,
    input [N-1:0] D, 
    input [1:0]SEL,
    output [N-1:0]Y
    );
        
    assign Y = (SEL == 2'b00)? A:
               (SEL == 2'b01)? B:
               (SEL == 2'b10)? C:
               (SEL == 2'b11)? D:4'b00000;    
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
//////////////////////////////////////////////////////////////////////////////////


module decode_7_anode(
    input [3:0] IN,
    output reg a,
    output reg b,
    output reg c,
    output reg d,
    output reg e,
    output reg f,
    output reg g
    );
    
    always @(IN)		
	begin
		case ({IN}) 
			4'b0000: {a,b,c,d,e,f,g}= 'b0000001; //0
			4'b0001: {a,b,c,d,e,f,g}= 'b1001111; //1
			4'b0010: {a,b,c,d,e,f,g}= 'b0010010; //2
			4'b0011: {a,b,c,d,e,f,g}= 'b0000110; //3
			4'b0100: {a,b,c,d,e,f,g}= 'b1001100; //4
			4'b0101: {a,b,c,d,e,f,g}= 'b0100100; //5
			4'b0110: {a,b,c,d,e,f,g}= 'b0100000; //6
			4'b0111: {a,b,c,d,e,f,g}= 'b0001111; //7
			4'b1000: {a,b,c,d,e,f,g}= 'b0000000; //8
			4'b1001: {a,b,c,d,e,f,g}= 'b0000100; //9
			4'b1010: {a,b,c,d,e,f,g}= 'b0001000; //A
			4'b1011: {a,b,c,d,e,f,g}= 'b1100000; //b
			4'b1100: {a,b,c,d,e,f,g}= 'b0110001; //C
			4'b1101: {a,b,c,d,e,f,g}= 'b1000010; //d
			4'b1110: {a,b,c,d,e,f,g}= 'b0110000; //E
			4'b1111: {a,b,c,d,e,f,g}= 'b0111000; //F
		endcase			
	end
endmodule

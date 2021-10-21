`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/02/2021 10:52:49 PM
// Design Name: 
// Module Name: tabla_ejemplo
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tabla_control(
    input a,
    input b,
    input c,
    input d,
    output [3:0] OUT_REG,
    output reg rst,
    output reg enable,
    output reg arithmetic
    );
    
    assign OUT_REG = {d,c,b,a};
    
	always @(a or b or c or d)		
	begin
		case ({d,c,b,a})  
			4'b0000: 
                begin 
                rst= 1'b0;
                enable = 1'b0;
                arithmetic = 1'b1; 
                end
            4'b0001:
            begin 
                rst= 1'b0;
                enable = 1'b0;
                arithmetic = 1'b1; 
            end  
			4'b0010:
			begin 
                rst= 1'b0;
                enable = 1'b0;
                arithmetic = 1'b0; 
            end
			4'b0011:
			begin 
                rst= 1'b0;
                enable = 1'b0;
                arithmetic = 1'b1; 
            end
			4'b0100:
			begin 
                rst= 1'b0;
                enable = 1'b0;
                arithmetic = 1'b0; 
            end
			4'b0101:
			begin 
                rst= 1'b0;
                enable = 1'b0;
                arithmetic = 1'b0; 
            end
			4'b0110:
			begin 
                rst= 1'b0;
                enable = 1'b0;
                arithmetic = 1'b0; 
            end
			4'b0111:
			begin 
                rst= 1'b0;
                enable = 1'b0;
                arithmetic = 1'b0; 
            end
			4'b1000:
			begin 
                rst= 1'b0;
                enable = 1'b0;
                arithmetic = 1'b0; 
            end
			4'b1001: 
			begin 
                rst= 1'b0;
                enable = 1'b0;
                arithmetic = 1'b0; 
            end
			4'b1010:
			begin 
                rst= 1'b0;
                enable = 1'b1;
                arithmetic = 1'b0; 
            end
			4'b1011:
			begin 
                rst= 1'b0;
                enable = 1'b0;
                arithmetic = 1'b0; 
            end
			4'b1100:
			begin 
                rst= 1'b0;
                enable = 1'b0;
                arithmetic = 1'b0; 
            end
			4'b1101:
			begin 
                rst= 1'b0;
                enable = 1'b0;
                arithmetic = 1'b0; 
            end
			4'b1110:
			begin 
                rst= 1'b0;
                enable = 1'b0;
                arithmetic = 1'b0; 
            end
			4'b1111:
		    begin 
                rst= 1'b1;
                enable = 1'b0;
                arithmetic = 1'b0; 
            end
		endcase			
	end
endmodule
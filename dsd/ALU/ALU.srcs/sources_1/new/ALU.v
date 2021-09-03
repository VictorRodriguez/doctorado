`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/02/2021 11:51:03 PM
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [3:0] A,
    input [3:0] B,
    input [3:0] REG_CONTROL,
    output reg [7:0] RESULT
    );
    
	always @(REG_CONTROL)		
	begin
		case (REG_CONTROL) 
		4'b0000: 
            begin // suma
                RESULT <= A + B;
            end
        4'b0001: // resta
            begin
                RESULT <= A - B;
            end  
		4'b0010:// not B
			begin
			    RESULT <= ~(B);
            end
		4'b0011: // Mul
			begin
			    RESULT <= A * B;
            end
		4'b0100:
			begin // AND 
			    RESULT <= A & B; 
            end
		4'b0101: //OR
			begin 
			    RESULT <= A | B;
            end
		4'b0110: // XOR
			begin
			    RESULT <= A ^ B;
            end
		4'b0111: // shift <<
			begin 
			    RESULT <= A << B[3:0];
            end
		4'b1000: //shift >>
			begin 
			    RESULT <= A >> B[3:0];
            end
		4'b1001: 
			begin 
			     RESULT = 4'b0000;
            end
		4'b1010:
			begin
			     RESULT = 4'b0000;
            end
		4'b1011:
			begin
			     RESULT = 4'b0000;
            end
		4'b1100:
			begin
			     RESULT = 4'b0000;
            end
		4'b1101:
			begin
			     RESULT = 4'b0000;
            end
		4'b1110:
			begin
			     RESULT = 4'b0000;
            end
		4'b1111:
		    begin
		        RESULT = 4'b0000; 
            end
        
		endcase			
	end
endmodule
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
//////////////////////////////////////////////////////////////////////////////////


module ALU # (parameter WIDTH = 4)(
    input signed [WIDTH:0] A,
    input signed [WIDTH:0] B,
    input [3:0] REG_CONTROL,
    output reg [WIDTH+1:0] RESULT,
	 output zero,
	 output reg carry_out,
	 output reg overflow
    );
   
	localparam ALU_WIDHT = WIDTH + 1;
	assign zero = (RESULT == 0)? 1'b1:1'b0;
	
	always @(REG_CONTROL)	
	begin
		case (REG_CONTROL) 
		4'b0000: 
            begin // suma
                RESULT <= A + B;
					 carry_out <= (RESULT[ALU_WIDHT] == 1'b1)? 1'b1:1'b0;
					 overflow <= ((~A[WIDTH] & ~B[WIDTH] & RESULT[ALU_WIDHT]) | (A[WIDTH] & B[WIDTH] & ~RESULT[ALU_WIDHT]))? 1'b1:1'b0;
            end
      4'b0001: // resta
            begin
                RESULT <= A - B;
					 carry_out <= (RESULT[ALU_WIDHT] == 1'b1)? 1'b1:1'b0;
            end  
		4'b0010:// NEG B
			begin
			    RESULT <= -(B);
            end
		4'b0011: // Mul
			begin
			    RESULT <= A * B;
				 carry_out = (RESULT[ALU_WIDHT] == 1'b1)? 1'b1:1'b0;
				 overflow <= ((~A[WIDTH] & ~B[WIDTH] & RESULT[ALU_WIDHT]) | (A[WIDTH] & B[WIDTH] & ~RESULT[ALU_WIDHT]))? 1'b1:1'b0;
         end
		4'b0100:
			begin // AND 
			    RESULT <= A & B; 
            end
		4'b0101: //OR
			begin 
			    RESULT <= A | B;
            end
		4'b0110: // NOT A
			begin 
			    RESULT <= ~(A);
            end
		4'b0111: // XOR
			begin
			    RESULT <= A ^ B;
            end
		4'b1000: // shift <<
			begin 
			    RESULT <= A << B[4:0];
            end
		4'b1001: //shift >>
			begin 
			    RESULT <= (A >> B[4:0]) & 5'b01111;
            end
		4'b1010: 
			begin 
			     RESULT <= WIDTH+1'b0;
            end
		4'b1011:
			begin
			     RESULT <= WIDTH+1'b0;
            end
		4'b1100:
			begin
			     RESULT <= WIDTH+1'b0;
            end
		4'b1101:
			begin
			     RESULT <= WIDTH+1'b0;
            end
		4'b1110:
			begin
			     RESULT <= WIDTH+1'b0;
            end
		4'b1111:
			begin
			     RESULT <= WIDTH+1'b0;
         end   
		endcase			
	end
endmodule
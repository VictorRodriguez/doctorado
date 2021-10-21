`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/19/2021 06:14:24 PM
// Design Name: 
// Module Name: seq_mul_FSM
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


module seq_mul_FSM  #(parameter N = 4)(

    input clk,
    input rst,
    input start,
    input [2:0] count_value,
    input [N-1:0] multiplier,
    output reg ready,
    output reg [3:0] state,
    output reg count_start,
    output reg add_multiplicant,
    output reg shift_multiplier_rigth
    );


	 
	parameter S0 = 3'b000;
	parameter S1 = 3'b001;
	parameter S2 = 3'b010;
	parameter S3 = 3'b011;
	parameter S4 = 3'b100;
	parameter S5 = 3'b101;
	parameter S6 = 3'b110;
	parameter S7 = 3'b111;

always @ (state) begin
    case (state)
    S0:
        begin
        count_start <= 1'b0;
        ready <= 1'b0;
        add_multiplicant <= 1'b0;
        shift_multiplier_rigth <= 1'b0;
        end
    S1:
       begin
       ready <= 1'b0;
       add_multiplicant <= 1'b0;
       shift_multiplier_rigth <= 1'b0;
       end
    S2:
       begin
       //add multiplicant
       add_multiplicant <= 1'b1;
       end
    S3:
       begin
       // add zeros
       add_multiplicant <= 1'b0;
       end
    S4:
       begin
       count_start <=1'b1;
       add_multiplicant <= 1'b0;
       end
    S5:
       begin
       count_start <=1'b0;
       end
    S6:
       begin
       ready <= 1'b1;
       end
    S7:
       begin
       shift_multiplier_rigth <=1'b1;
       end    
    default:
        begin
        count_start <= 1'b0;
        ready <= 1'b0;
        add_multiplicant <= 1'b0;
        shift_multiplier_rigth <= 1'b0;
        end
    endcase
end

always @ (posedge clk or posedge rst) begin
if (rst == 1'b1)
    state <= S0;
else
case (state)
   S0:
      if (start == 1'b1)
        state <= S1;
      else
        state <= S0;
   S1:
      if (multiplier[0] == 1'b1)
         state <= S2; // Add A
      else
         state <= S3; // Add 0
   S2:
      state <= S4;
   S3:
      state <= S4;
   S4:
      state <= S5;
   S5:
      if(count_value == 3'b100)
        state <= S6; //final state
      else
        state <= S7;
   S6:
       state <= S6;
   S7:
      state <= S1;      
endcase
end
endmodule

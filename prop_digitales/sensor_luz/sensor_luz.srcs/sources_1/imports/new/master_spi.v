`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/18/2021 09:16:40 PM
// Design Name: 
// Module Name: master_spi
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


module master_spi(
    input read,
    input rst,
    input clk,
    input miso,
    output sclk,
    output reg cs,
    output [14:0] OUT
    );

parameter S0 = 1'b0, S1 = 1'b1;

reg     state;
reg     enable_sclk_delay;
wire    count;
wire    [14:0]wire_output;

Delayer # (.width(5), .YY(14) ) delayer_16 (
    .clk(clk),
    .rst(rst),
    .enable(enable_sclk_delay),
    .iguales(count)
    );

shit_reg # (.width(15))(
    .serin(miso),
    .Q(wire_output),
    .clk(clk),
    .enable(~cs),
    .rst(rst)
    );

register_n # (.n(15)) register_n_15(
    .D(wire_output),
    .clk(clk),
    .rst(rst),
    .load(count),
    .Q(OUT)
    );
    
assign sclk = enable_sclk_delay & clk;

always @ (state) begin
    case (state)
    S0:begin
        cs <= 1'b1; 
        enable_sclk_delay <= 1'b0;
        end
    S1:begin
        cs <= 1'b0;
        enable_sclk_delay <=  1'b1;
        end
    default:begin
        cs <= 1'b1;
        enable_sclk_delay <= 1'b0;
        end

    endcase

    end
always @ (posedge clk or posedge rst) begin
if (rst)
    state <= S0;
else
case (state)
   S0:
      if(read)
        state <=S1;
   S1:
      if (count)
         state <= S0;
      else
         state <= S1;
   default:
         state <=S1;

   endcase
end



endmodule

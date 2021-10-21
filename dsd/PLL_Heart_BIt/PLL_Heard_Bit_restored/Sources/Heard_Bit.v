`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITESO 
// Engineer:  Cuauhtemoc Aguilera
// Heard Bit to see a signal after synthesis for new design in a new board.
//////////////////////////////////////////////////////////////////////////////////

module Heard_Bit
 # (parameter Half_Period_Counts = 50_000_000 ) // half second for a clk of 100 MHz 
   (
    input clk,
    input rst,
    input enable,
    output reg heard_bit_out
    );
localparam Delay_Bits = $clog2(Half_Period_Counts);
    
reg [Delay_Bits-1:0] Delay_Count;
  
wire end_half_delay;    
    // Comparator
assign end_half_delay = (Delay_Count == Half_Period_Counts-1)? 1'b1 : 1'b0;


// Contador

always @(posedge rst, posedge clk)
    begin
        if (rst)
       
            Delay_Count <= {Delay_Bits{1'b0}};
        else 
            if (enable)
                if (end_half_delay)
                         Delay_Count <= {Delay_Bits{1'b0}};
                else 
                        Delay_Count <= Delay_Count + 1'b1;
             else
                Delay_Count <= Delay_Count;
     end
    
// Flip Flop T
always @(posedge rst, posedge clk)
    begin
        if (rst)
       
            heard_bit_out <= 1'b0;
        else 
            if (enable) 
                if (end_half_delay)
                    heard_bit_out <= ~heard_bit_out;
                else 
                    heard_bit_out <= heard_bit_out;
            else 
                heard_bit_out <= heard_bit_out;
     end
endmodule

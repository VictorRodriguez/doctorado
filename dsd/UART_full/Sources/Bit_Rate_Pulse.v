`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITESO 
// Engineer:  Cuauhtemoc Aguilera
// Bit rate pulse generator for a Serial RS-232 Receiver
//////////////////////////////////////////////////////////////////////////////////
module Bit_Rate_Pulse
 # (parameter delay_counts = 11 ) 
    (input clk,
    input rst,
    input enable,
    output end_bit_time,
    output end_half_time
    );
    
 localparam delay_bits = $clog2 (delay_counts);
 
 reg [delay_bits-1:0]count ;  
    // Comparador
assign end_bit_time = (delay_counts - 1'b1 ==count)?1'b1:1'b0;
assign end_half_time = ( (delay_counts - 1'b1)/2 == count)?1'b1:1'b0;
// Contador
always @(posedge rst, posedge clk)
    begin
        if (rst)
            count <= {delay_bits{1'b0}};
        else 
            if (enable)
                if (end_bit_time)
                         count <= {delay_bits{1'b0}};
                else 
                        count <= count + 1'b1;
             else
                count <= count;
     end
endmodule

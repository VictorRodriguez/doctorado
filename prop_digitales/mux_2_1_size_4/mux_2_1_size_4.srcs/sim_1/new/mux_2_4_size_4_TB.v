`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/29/2021 09:25:37 PM
// Design Name: 
// Module Name: mux_2_4_size_4_TB
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


module mux_2_4_size_4_TB();

reg [3:0] A, B;
reg sel;
wire [3:0] Y;

mux_2_1_size_4 UUT(.A(A),.B(B),.sel(sel),.Y(Y));

initial
    begin
    A = 4'b1010; 
    B = 4'hB; 
    sel = 1'b0;
end

always
    begin
        #10 sel = ~sel;
    end
    
endmodule




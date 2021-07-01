`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/30/2021 10:07:51 PM
// Design Name: 
// Module Name: decode_2_4_display_TB
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


module decode_2_4_display_TB();

reg a,b;
wire [3:0]Y;

decode_2_4_display UUT(.a(a),.b(b),.Y(Y));


initial
    begin
    a = 1'b0; 
    b = 1'b0;
end

always
    begin
        #10 a = ~a;
    end
always
    begin
        #20 b = ~b;
    end    


endmodule

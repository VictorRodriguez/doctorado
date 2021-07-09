`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/08/2021 08:20:16 AM
// Design Name: 
// Module Name: comp_2_4_TB
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


module comp_2_4_TB();

reg [3:0]A;
wire [3:0]Y;

comp_2_4 UUT(.A(A),.Y(Y));

initial
    begin
        A = 4'b0;
    end

always
begin
    # 10 A = A + 1'b1;
end

endmodule

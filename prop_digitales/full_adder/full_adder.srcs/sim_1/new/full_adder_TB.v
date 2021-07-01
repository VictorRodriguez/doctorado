`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/26/2021 08:39:36 AM
// Design Name: 
// Module Name: full_adder_TB
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


module full_adder_TB();

reg a,b,c;
wire s,co;

full_adder UUT(.a(a),.b(b),.c(c),.s(s),.co(co));

initial 
begin 
    a = 1'b0;
    b = 1'b0;
    c = 1'b0;

end

always
begin
    # 10 a = ~a;        
end

always
begin
    # 20 b = ~b;        
end 

always
begin
    # 40 c = ~c;
end 

endmodule
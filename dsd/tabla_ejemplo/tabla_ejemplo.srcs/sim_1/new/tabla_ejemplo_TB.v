`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/02/2021 10:58:12 PM
// Design Name: 
// Module Name: tabla_ejemplo_TB
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


module tabla_ejemplo_TB();

reg a,b,c,d;
wire [3:0]OUT_REG;
wire rst;
wire enable;
wire arithmetic;

tabla_ejemplo UUT(
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .OUT_REG(OUT_REG),
    .rst(rst),
    .enable(enable),
    .arithmetic(arithmetic)
    );

initial
begin
    a=1'b0;
    b=1'b0;
    c=1'b0;
    d=1'b0;
end

always
begin
   #10 a = a + 1;
end

always
begin
   #20 b = b + 1;
end

always
begin
   #40 c = c + 1;
end

always
begin
   #80 d = d + 1;
end

endmodule

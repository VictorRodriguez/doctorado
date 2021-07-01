`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/26/2021 01:09:41 PM
// Design Name: 
// Module Name: decoder_bin_hex_7seg_TB
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


module decoder_bin_hex_7seg_TB();

reg w,x,y,z;
wire a,b,c,d,e,f,g;

decoder_bin_hex_7seg UUT(
    .w(w),
    .x(x),
    .y(y),
    .z(z),
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .e(e),
    .f(f),
    .g(g)
    );

initial 
begin 
    w = 1'b0;
    x = 1'b0;
    y = 1'b0;
    z = 1'b0;
end

always
begin
    # 10 z = ~z;
end

always
begin
    # 20 y = ~y;
        
end 

always
begin
    # 40 x = ~x;
        
end

always
begin
    # 80 w = ~w;
        
end 
endmodule
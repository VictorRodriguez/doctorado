`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/21/2021 05:45:41 PM
// Design Name: 
// Module Name: contador_unos
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


module contador_unos(
    input a,
    input b,
    input c,
    input d,
    output out_0,
    output out_1,
    output out_2
    );
       
       assign out_0 = ~d&~c&~b&a | ~d&~c&b&~a | ~d&c&~b&~a | ~d&c&b&a | d&c&~b&a | d&c&b&~a | d&~c&~b&~a | d&~c&b&a;
       assign out_1 = ~b&d&c | a&~d&c | d&~c&a | ~d&b&a | c&b&~a | b&~a&d;
       assign out_2 = d & c & b & a ;
       
endmodule

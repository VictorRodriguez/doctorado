`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: HOME
// Engineer: VIctor Rodriguez
// 
// Create Date: 06/22/2021 08:02:00 PM
// Design Name: 
// Module Name: alarm_cage
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


module alarm_cage(
    input masa,
    input ta,
    input tb,
    output alarm
    );
 
assign alarm = tb | (masa&ta&~tb);
    
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Victor Rodriguez
// 
// Create Date: 06/22/2021 08:27:48 PM
// Design Name: 
// Module Name: alarm_cage_tb
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


module alarm_cage_tb();

reg masa, ta, tb;
wire alarm;

alarm_cage UUT(.masa(masa),.ta(ta),.tb(tb),.alarm(alarm));

initial 
begin 
    masa = 1'b0; // 4'ha
    ta = 1'b0; // 4'ha
    tb = 1'b0; // 4'ha

end

always
begin
    # 10 tb = ~tb;
        
end

always
begin
    # 20 ta = ~ta;
        
end 

always
begin
    # 40 masa = ~masa;
        
end 

endmodule

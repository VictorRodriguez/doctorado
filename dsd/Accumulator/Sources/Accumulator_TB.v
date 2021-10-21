/******************************************************************
* Description
*	This is the verifaction envioroment for testeting the basic MIPS
*	procesor.
* Version:
*	1.0
* Author:
*	Dr. José Luis Pizano Escalante
* email:
*	luispizano@iteso.mx
* Date:
*	12/06/2015
* Revised and adapted by Dr. Cuauhtemoc Aguilera
******************************************************************/
`timescale 1ns / 10 ps 
module Accumulator_TB;

parameter Word_Length = 8;

reg clk_tb;
reg reset_tb;
reg enable_tb;
reg Read_tb;
reg [Word_Length-1:0] Data_Input_tb;
	
wire clk_out_tb;
wire [Word_Length-1:0] Data_Output_tb;
	
	
Accumulator #(.Word_Length(Word_Length) )
	    UUT (.clk(clk_tb), .n_rst(reset_tb), .enable(enable_tb),
		    .read(Read_tb), .Data_Input(Data_Input_tb), .clk_out(clk_out_tb),
		    .Data_Output(Data_Output_tb) );

initial
  begin
	clk_tb = 0;
     forever
		 #1 clk_tb = ~clk_tb;
  end
/*********************************************************/
initial begin // reset generator
	#0 reset_tb = 0;
	#5 reset_tb = 1;
	#200 $stop;
end
/*********************************************************/
initial begin // reset generator
	#0 enable_tb = 0;
	#10 enable_tb = 1;
	#5 enable_tb = 0;
	#10 enable_tb = 1;
	#5 enable_tb = 0;
	#10 enable_tb = 1;
	#5 enable_tb = 0;
	#10 enable_tb = 1;
	#5 enable_tb = 0;
	#10 enable_tb = 1;
	#5 enable_tb = 0;
	#10 enable_tb = 1;
	#5 enable_tb = 0;
end
/*********************************************************/
initial begin // reset generator
	#0 Read_tb = 0;
	#100 Read_tb = 1;
end
/*********************************************************/
initial begin // reset generator
	#4 Data_Input_tb = 3;
end
/*********************************************************/

endmodule

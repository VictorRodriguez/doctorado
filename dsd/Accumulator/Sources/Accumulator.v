 ///*synthesis keep*/
module Accumulator
#(parameter Word_Length = 8)
(	input clk,
	input n_rst,
	input n_enable,
	input read,
	input [Word_Length-1:0] Data_Input,
	output clk_out,
	output [Word_Length-1:0] Data_Output );

wire [Word_Length-1:0] Adder_w;
wire [Word_Length-1:0] ACC_w; /*synthesis keep*/ 
wire one_shot_w, n_enable_w; /*synthesis keep*/ 
wire clkInter; /*synthesis keep*/ 
wire n_rst_w = ~n_rst;
 
assign  clkInter = clk;
assign clk_out = clkInter;
assign n_enable_w = ~n_enable;
 
Debouncer debouncer_ins(.clk(clkInter), .rst(n_rst_w), .sw(n_enable_w), .one_shot(one_shot_w)    );				

assign Adder_w =  ACC_w + Data_Input;

 Register #(.Word_Length(Word_Length) ) Acc_Reg_ins
		 ( .clk(clkInter), .reset(n_rst_w), .enable(one_shot_w),
		   .Data_Input(Adder_w), .Data_Output(ACC_w) );

 Register #(.Word_Length(Word_Length) ) Out_Reg_ins
		 (.clk(clkInter),
	       .reset(n_rst_w), .enable(read), .Data_Input(ACC_w),
		  .Data_Output(Data_Output) );
endmodule







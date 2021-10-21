// ITESO
// Cuauhtemoc Aguilera
module Register 
#( parameter Word_Length = 8)
(	input clk,
	input reset,
	input enable,
	input [Word_Length-1:0] Data_Input,
	output reg [Word_Length-1:0] Data_Output
);
always@(posedge clk or posedge reset) begin
	if(reset == 1'b1) 
		Data_Output <= {Word_Length{1'b0}};
	else 
	 if(enable)
		Data_Output <= Data_Input;
end
endmodule

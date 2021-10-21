`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
// Machine state for sequencial multiplier 
//////////////////////////////////////////////////////////////////////////////////


module seq_mul #(parameter N = 4)(
    input clk,
    input rst,
    //input enable,
    input start,
    input [N-1:0] A, //multiplicant
    input [N-1:0] B,// multiplier
    output [2*N:0] RESULT,
    output ready,
    output [3:0] state,
    output [N-1:0] multiplier,
    output [2*N-1:0] multiplicant,
    output count_start,
    output shift_multiplier_rigth,
    output add_multiplicant,
    output [2:0]Q
    );
    
   
    wire count_start_wire;
    

    Counter_Param  # (.n(3)) Counter_Param_1(.clk(clk),.rst(rst),.enable(count_start_wire),.Q(Q));
    
    seq_mul_FSM  #(.N(N)) seq_mul_FSM_1(
    .clk(clk),
    .rst(rst),
    .start(start),
    .count_value(Q),
    .multiplier(multiplier),
    .ready(ready),
    .state(state),
    .count_start(count_start_wire),
    .add_multiplicant(add_multiplicant),
    .shift_multiplier_rigth(shift_multiplier_rigth)
    );
  
    shift_right_pipo_reg #(.N(N))shift_right_pipo_reg_1(
    .IN(B),
    .Q(multiplier),
    .clk(clk),
    .enable(shift_multiplier_rigth),
    .rst(rst)
    );

    adder_shifter_reg #(.n(4))adder_shifter_reg_1(
    .A(A),
    .count(Q),
    .Q(RESULT),
    .rst(rst),
    .enable(add_multiplicant),
    .clk(clk)
    );
    
    assign count_start = count_start_wire;
endmodule

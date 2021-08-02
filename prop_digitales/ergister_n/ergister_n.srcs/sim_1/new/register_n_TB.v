`timescale 1ns / 1ps



module register_n_TB();

reg clk,rst,load;
reg [3:0]D;
wire [3:0]Q;

register_n # (.n(4)) UUT(
    .D(D),
    .clk(clk),
    .rst(rst),
    .load(load),
    .Q(Q)
    );

initial
    begin
    clk = 1'b0;
    rst = 1'b0;
    load = 1'b1;
    
    D = 4'b0101;

    #20 rst = 1'b1;
    #30 rst = 1'b0;
    end
    
    
always
    begin
    #10 clk = ~clk;
    end
    
always
    begin
    #50 D = D + 1;
    end
    
always
    begin
    #100 load = ~load;
    end  
    
endmodule

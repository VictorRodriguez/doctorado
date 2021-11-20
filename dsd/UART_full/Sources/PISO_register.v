`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITESO
// Engineer: Victor Rodriguez
// Module to convert Parallel Input Serial Output
//////////////////////////////////////////////////////////////////////////////////


module PISO_register #(parameter n = 4)(
    input [n-1:0]Parallel_In,
    output reg Serial_Out,
    input clk,
    input load,
    input enable,
    input rst
    );

    reg [n-1:0]tmp;
    always @(posedge clk or posedge rst)
    begin
        if(rst)
            begin
				tmp <= {n{1'b0}};
            Serial_Out <= 1'b1;
		  end
        else if (load)
        begin          
				tmp <= Parallel_In;
            Serial_Out <= 1'b1;
        end
        else if (enable)
        begin
            Serial_Out <= tmp[0];
            //tmp <= {tmp[n-2:0],1'b0};
            tmp <= {1'b1,tmp[n-1:1]};
            //tmp <= tmp>>1;
        end
        else
            begin
                tmp <=tmp;
                Serial_Out <= Serial_Out ;
            end
    end
endmodule
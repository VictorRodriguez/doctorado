`timescale 1ns / 1ps


module sign_extend #( parameter width = 8)(extend, extended);
input[width -1:0] extend;
output[2*width -1:0] extended;

assign extended[2*width -1:0] = { {width{extend[width-1]}}, extend[width-1:0] };

endmodule

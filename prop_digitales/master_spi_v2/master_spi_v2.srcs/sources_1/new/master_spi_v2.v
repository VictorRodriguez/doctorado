module master_spi_v2 (clk, read, rst, count_limit,out, cs, load,start_count,reset_counter);

input   clk, read, rst,count_limit;
output  reg [1:0]out;
output reg cs;
output reg load;
output reg start_count;
output reg reset_counter;

reg     [1:0]state;
parameter S0 = 0, S1 = 1, S2 = 2;

Delayer # (.width(5), .YY(14) ) delayer_15 (
    .clk(clk),
    .rst(reset_counter),
    .enable(start_count),
    .iguales(count_limit)
    );

always @ (state) begin
case (state)
S0:begin
   out = 2'b01;
   cs <= 1'b1; // disable sensor to send data
   start_count <= 1'b0; // stop counter 
   reset_counter <= 1'b1; // reset counter
   load <= 1'b0;  // don't load into register   
   end
S1:begin
   out = 2'b10;
   cs <= 1'b0; // enable sensor to send data
   start_count <= 1'b1; // start counter 
   reset_counter <= 1'b0; // dont reset counter
   load <= 1'b0;  // don't load into register
   end
S2:begin
   out = 2'b11;
   cs <= 1'b1; // disable sensor to send data
   start_count <= 1'b0; // stop counter 
   reset_counter <= 1'b1; // reset counter
   load <= 1'b1;  // load into register
   end
default:
    begin
   out = 2'b00;
   cs <= 1'b1; // disable sensor to send data
   start_count <= 1'b0; // stop counter 
   reset_counter <= 1'b1; // reset counter
   load <= 1'b0;  // don't load into register
   end
endcase
end
always @ (posedge clk or posedge rst) begin
if (rst)
state <= S0;
else
case (state)
   S0:
      if(read)
        state <=S1;
      else
        state <=S0;
   S1:
      if (count_limit)
         state <= S2;
      else
         state <= S1;
   S2:
         state <= S0;
endcase
end
endmodule
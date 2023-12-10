`timescale 1ns / 1ps

module bin_counter_nbits #(parameter x = 5, n = 20)(input clk, reset, en, output reg [x-1:0]count);
//reg [x-1:0] count;
initial begin
count = 0;
end 
always @(posedge clk, posedge reset) begin
 if (reset == 1)
 count <= 0; //<=0
 else if (en == 1)
      if(count == n-1)
            count <= 0;
       else
        count <= count + 1; // non-blocking assignment
 // normal operation
end
endmodule


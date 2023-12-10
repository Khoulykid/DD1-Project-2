`timescale 1ns / 1ps

module clkdiv #(parameter n = 500000) (input clk, rst, output reg clk_out);

wire [31:0] count;
initial begin clk_out = 0; end
bin_counter_nbits  #(.x(32), .n(n)) counterMod (.en(1'b1),.clk(clk), .reset(rst), .count(count));

always @ (posedge clk, posedge rst) begin
if (rst) 
clk_out <= 0;
else if (count == n-1)
clk_out <= ~ clk_out;
end
  
endmodule


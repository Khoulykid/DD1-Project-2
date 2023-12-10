`timescale 1ns / 1ps

module synchronizer(clk,SIG,SIG1);
input clk;
input SIG;
output reg SIG1;
reg META;
//initial begin META = 0; SIG1 = 0; end
always @(posedge clk)begin
    META<=SIG;
    SIG1<=META;
end     
endmodule
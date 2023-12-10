`timescale 1ns / 1ps



module DigSel(clk, rst, en, dig);
    input clk;
    input rst;
    input en;
    output [1:0] dig;
    wire clk_out;
    clkdiv #(250000) divider(.clk(clk), .rst(rst), .clk_out(clk_out));
    bin_counter_nbits #(2, 4) digout( .clk(clk_out), .reset(rst), .en(en), .count(dig));
endmodule

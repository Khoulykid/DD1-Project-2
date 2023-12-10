`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2023 04:45:10 PM
// Design Name: 
// Module Name: push_button_detector
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module push_button_detector(clk,rst,x,z);
input clk;
input rst;
input x;
output z;
wire out;
wire SIG1 ;
wire clk_out ;
clkdiv #(250000)divider(.clk(clk), .rst(rst), .clk_out(clk_out));
debouncer debounce(.clk(clk_out), .rst(rst), .x(x), .z(out));
synchronizer synch(.clk(clk_out), .SIG(out), .SIG1(SIG1));
rising_edge_detector det(.clk(clk_out),.rst(rst), .x(SIG1), .z(z));

endmodule
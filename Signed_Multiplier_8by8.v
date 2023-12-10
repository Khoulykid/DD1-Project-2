`timescale 1ns / 1ps



module Signed_Multiplier_8by8(clk, multiplier, multiplicand, start, scrollR, scrollL, done, segments, anode);

input clk;
input [0:7] multiplier;
input [0:7] multiplicand;
input start;
input scrollL;
input scrollR;

output done;
output [6:0] segments;
output [3:0] anode;

wire [14:0] product;
wire sign;
wire [1:0] sel, dig;
wire [4:0] dig1, dig2, dig3, dig4, dig5;
assign dig1 = bcd[3:0];
assign dig2 = bcd[7:4];
assign dig3 = bcd[11:8];
assign dig4 = bcd[15:12];
assign dig5 = bcd[19:16];

wire [19:0] bcd;
wire [3:0] num;
wire btncz, btnrz, btnlz;
wire clk_out;


push_button_detector btnc(.clk(clk),.rst(0),.x(start),.z(btncz));
push_button_detector btnr(.clk(clk),.rst(0),.x(scrollR),.z(btnrz));
push_button_detector btnl(.clk(clk),.rst(0),.x(scrollL),.z(btnlz));
clkdiv #(250000)divider(.clk(clk), .rst(rst), .clk_out(clk_out));
buttons_control_unit BCU(.clk(clk_out), .btncZ(btncz), .btnlZ(btnlz), .btnrZ(btnrz), .state(sel));


signmult mult(.multiplicand(multiplicand), .multiplier(multiplier), .start(btncz), .clk(clk), .done(done), .product(product), .sign(sign), .state(sel));
bin2bcd b2bcd(.bin(product), .bcd(bcd));
numsel numselector( .dig1(dig1), .dig2(dig2), .dig3(dig3), .dig4(dig4), .dig5(dig5), .sign(sign), .seldig(dig), .out(num), .state(sel));
DigSel digitselector(.clk(clk), .rst(0), .en(done), .dig(dig));
SevenSegDecWithEn Sevensegdec(.en(done), .num(num), .digit(dig), .segments(segments), .anode(anode));


endmodule

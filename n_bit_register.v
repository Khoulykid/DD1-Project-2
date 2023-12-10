`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2023 07:00:40 PM
// Design Name: 
// Module Name: n_bit_register
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


module n_bit_register #(parameter n = 16)(data, clk, quanta, reset);

input reset;
input [n-1:0] data;
input clk;
output reg [n-1:0] quanta;

always @ (posedge clk or posedge reset) begin

    if(reset)
        quanta <= 1'b0 ;
    else 
        quanta <= data;
end

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2023 06:55:37 PM
// Design Name: 
// Module Name: right_shift_reg
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
module right_shift_reg #(parameter n = 8)(load, en , clk, multiplier, shifted_multiplier);

input load;
input en;
input clk;
input [n-1:0] multiplier;
output reg [n-1:0] shifted_multiplier;


always @ (posedge clk) begin
    
    if (load)
        shifted_multiplier = multiplier ;
    else if(en)
         shifted_multiplier = {0, shifted_multiplier[n-1:1]};
    
end

endmodule

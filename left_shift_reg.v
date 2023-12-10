`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2023 06:40:10 PM
// Design Name: 
// Module Name: left_shift_reg
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


module left_shift_reg #(parameter n = 8)(load, en , clk, multiplicand, shifted_multiplicand);

input load;
input en;
input clk;
input [n-1: 0] multiplicand;
output reg [(2*n)-1: 0] shifted_multiplicand;

always @ (posedge clk) begin
    
    if (load)
        shifted_multiplicand = multiplicand;
    else if(en)
         shifted_multiplicand = {shifted_multiplicand[(2*n)-2:0], 1'b0};
    
end

endmodule

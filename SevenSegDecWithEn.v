`timescale 1ns / 1ps

module SevenSegDecWithEn( en,num,digit, segments, anode);
input en;
input [3:0] num;
input [1:0] digit;
output reg [6:0] segments;
output reg [3:0] anode;
always @ (*) begin

if (en) begin
    case(digit)
        2'b00: anode = 4'b1110;
        2'b01: anode = 4'b1101;
        2'b10: anode = 4'b1011;
        2'b11: anode = 4'b0111;
    endcase

end else begin
    anode = 4'b1111;
end

case(num)
    4'b0000: segments = 7'b0000001;
    4'b0001: segments = 7'b1001111;
    4'b0010: segments = 7'b0010010;
    4'b0011: segments = 7'b0000110; 
    4'b0100: segments = 7'b1001100; 
    4'b0101: segments = 7'b0100100;
    4'b0110: segments = 7'b0100000;  
    4'b0111: segments = 7'b0001111; 
    4'b1000: segments = 7'b0000000; 
    4'b1001: segments = 7'b0000100;
    4'b1010: segments = 7'b1111111;
    4'b1111: segments = 7'b1111110;

    //default : segments = 7'b1111111;
endcase
end

endmodule

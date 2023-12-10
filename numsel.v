`timescale 1ns / 1ps

module numsel(dig1, dig2, dig3, dig4, dig5, sign, seldig, out, state);

input [3:0] dig1;
input [3:0] dig2;
input [3:0] dig3;
input [3:0] dig4;
input [3:0] dig5;
input sign;
input [1:0] seldig;
output reg [3:0] out;
input [1:0] state;
reg [3:0] mux0;
reg [3:0] mux1;
reg [3:0] mux2;


always @ (*) begin
case(state)
2'b00: begin mux0 = dig1; mux1 = dig2; mux2 = dig3; end
2'b01: begin mux0 = dig1; mux1 = dig2; mux2 = dig3; end
2'b10: begin mux0 = dig2; mux1 = dig3; mux2 = dig4; end
2'b11: begin mux0 = dig3; mux1 = dig4; mux2 = dig5; end
endcase

case(seldig)
2'b00: out = mux0;
2'b01: out = mux1;
2'b10: out = mux2;
2'b11: out = sign ? 4'b1111 : 4'b1010;
endcase
end
endmodule

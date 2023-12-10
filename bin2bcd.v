`timescale 1ns / 1ps



module bin2bcd
(
    bin,
    bcd   
);
input [14:0] bin;
output reg [19:0] bcd = 20'd0;
  integer i,j;

  always @(bin) begin
    for(i = 0; i <= 18; i = i+1) bcd[i] = 0;
    bcd[14:0] = bin;
    for(i = 0; i <= 11; i = i+1)
      for(j = 0; j <= i/3; j = j+1)
        if (bcd[15-i+4*j -: 4] > 4)
          bcd[15-i+4*j -: 4] = bcd[15-i+4*j -: 4] + 4'd3;
  end

endmodule

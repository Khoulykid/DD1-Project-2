

module signmult(multiplicand, multiplier, start, clk, done, product, sign);
input [7:0] multiplicand;
input [7:0] multiplier;
input start;
input clk;
output done;
output sign;
output [14:0] product;          // 15 bits missing one for sign

wire [7:0] selmultiplicand;       // wire out of mux selecting +/- multiplicamd 
wire [7:0] selmultiplier;         // wire out of mux selecting +/- multiplier
wire [15:0] A;    // result of mux before adder
wire [15:0] C;   // wire after addition
wire [15:0] B;  // accumlated sum 
wire [15:0] lshifted;      // result of left reg
wire [7:0] rshifted;      // result of right reg

assign selmultiplicand = (multiplicand[7]) ? (~(multiplicand) + 1) : multiplicand ;

assign selmultiplier = (multiplier[7]) ? (~(multiplier) + 1) : multiplier ;

assign done = (rshifted == 0) ? 1 : 0 ;        // or rshifted[0]?

left_shift_reg ls(.load(start), .en(~done) , .clk(clk), .multiplicand(multiplicand), .shifted_multiplicand(lshifted));

right_shift_reg rs(.load(start), .en(~done) , .clk(clk), .multipler(multipler), .shifted_multipler(rshifted));

//assign done = (rshifted[0] == 0)? 1: 0;
assign A = (rshifted[0])? lshifted : 16'b0;

assign C = A + B;           // adder

n_bit_register rgst( .data(C), .clk(clk), .quanta(B), .reset(start));

assign product = (rshifted[0])? C[14:0] : 15'b0;

assign sign = multiplier[7] ^ multiplicand[7];

endmodule

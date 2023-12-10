`timescale 1ns / 1ps

module buttons_control_unit(clk, btncZ, btnlZ, btnrZ, state);
input clk;
input btncZ;
input btnlZ;
input btnrZ;

output reg [1:0] state; 
reg [1:0] next_state;
parameter [1:0]  R = 2'b00, A = 2'b01 , B = 2'b10, C = 2'b11;
initial begin state = R; next_state = R; end

always @(*) begin
    case(state)
    R:begin if(btncZ) next_state = A;
    else next_state = R;
    end
    A:begin if(btnlZ & ~btnrZ)
        next_state=B;
      else
        next_state=A;
      end  
    B:begin if(btnlZ & ~btnrZ)
        next_state=C;
      else if(~btnlZ & btnrZ)
         next_state=A;
      else
         next_state=B;   
      end
    C:begin if(btnrZ & ~btnlZ)
          next_state=B;
      else
          next_state=C;  
      end  
    default: next_state = R;  
    endcase 
end 
always @(posedge clk or posedge btncZ)begin
    if(btncZ)
        state <=A;
    else
        state<= next_state;
end   
endmodule
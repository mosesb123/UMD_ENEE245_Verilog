`timescale 1ns / 1ns

  module n_bit_count
   
   #(parameter N =8)
   (input wire clr ,
    input wire clk ,
    output reg [N-1:0] q

   );
  
// N-bit counter
  always @(posedge clk, posedge clr)
    begin
      if (clr == 1)
        q <= 0;
      else
        q <= q + 1;
    end
  
  endmodule

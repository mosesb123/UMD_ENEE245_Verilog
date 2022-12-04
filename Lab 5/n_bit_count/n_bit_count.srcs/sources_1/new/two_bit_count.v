`timescale 1ns / 1ns
module two_bit_count(input clk,
                     input clr,
                     output [1:0] q);
    n_bit_count #(.N(2)) two_bit(.clk(clk),.clr(clr), .q(q));
endmodule

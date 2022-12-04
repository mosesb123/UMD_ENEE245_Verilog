`timescale 1ns / 1ns
module three_bit_count(input clk,
                       input clr,
                       output [2:0] q);
    n_bit_count #(.N(3)) two_bit(.clk(clk),.clr(clr), .q(q));
endmodule

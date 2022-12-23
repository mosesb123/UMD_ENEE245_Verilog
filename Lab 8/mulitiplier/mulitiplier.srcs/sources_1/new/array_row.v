`timescale 1ns / 1ps


module array_row #(parameter N = 4)
                  (input A,
                   input [N-1:0] B,
                   input [N-2:0] sum_in,
                   input [N-1:0] c_in,
                   output [N-1:0] sum_out,
                   output [N-1:0] c_out);
wire [N-1:0] SIN = {sum_in,1'b0};



genvar i;
generate
for(i = 0; i<N; i = i+1)
begin
    array_block adder(
    .A   (A),
    .B   (B[i]),
    .S_in   (SIN[i]),
    .C_in   (c_in[i]),
    .S_out   (sum_out[i]),
    .C_out   (c_out[i])
    );
end
endgenerate
endmodule

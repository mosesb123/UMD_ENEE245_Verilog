`timescale 1ns / 1ps


module lookahead_4bit_addermodule (input [3:0] A,
                                   input [3:0] B,
                                   output [4:0] S);
wire [3:0]     w_G;
wire [3:0]     w_P;
wire [4:0]     w_C;
wire [3:0]     w_SUM;

genvar             jj;
generate
for (jj = 0; jj<4; jj = jj+1)
begin
    assign w_G[jj]   = A[jj] & B[jj]; //G[i]   = A[i] * B[i]
    assign w_P[jj]   = A[jj] ^ B[jj]; //P[i]   = A[i] ^ B[i]
    assign w_C[jj+1] = w_G[jj] | (w_P[jj] & w_C[jj]); //C[i+1] = G[i] + P[i]*C[i]
    assign w_SUM[jj] = w_P[jj] ^ w_C[jj]; //S[i] = P[i] ^ C[i]
end
endgenerate
assign w_C[0] = 1'b0;

assign S = {w_C[4], w_SUM};   // Verilog Concatenation

endmodule // carry_lookahead_adder_4_bit


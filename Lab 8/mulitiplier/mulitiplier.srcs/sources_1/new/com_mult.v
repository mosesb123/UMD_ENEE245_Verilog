`timescale 1ns / 1ps


module com_mult #(parameter N = 4)
                 (input [N-1:0] A,
                  input [N-1:0] B,
                  output [(2*N)-1:0] P);
    
    wire [(2*N)-1:0] S [N-1:0]; // partial-products
    
    assign S[0][N:0] = { 1'b0 , { A & {N{B[0]}} } };
    assign P         = S[N-1];
    
    genvar i;
    generate
    for (i = 1; i < N; i = i+1)
    begin
        nbit_ripple_add #(.N(N+i)) adder(
        .A   (S[i-1][N+i-1:0]),
        .B   ({ A & {N{B[i]}} , {i{1'b0}} }),
        .S   (S[i][N+i:0]));
    end
    endgenerate
endmodule

`timescale 1ns / 1ns


module nbit_ripple_add #(parameter N = 4)
                        (input [N-1:0] A,
                         input [N-1:0] B,
                         output [N:0] S);
    wire [N:0]     w_CARRY;
    wire [N-1:0]   w_SUM;
    
    // No carry input on first full adder
    assign w_CARRY[0] = 1'b0;
    
    genvar             ii;
    generate
    for (ii = 0; ii<N; ii = ii+1)
    begin
        full_add N_full_adds
        (
        .A(A[ii]),
        .B(B[ii]),
        .C_in(w_CARRY[ii]),
        .S(w_SUM[ii]),
        .C_out(w_CARRY[ii+1])
        );
    end
    endgenerate
    
    assign S = {w_CARRY[N], w_SUM};   // Cn+1 is the value of Sn
    
endmodule
    

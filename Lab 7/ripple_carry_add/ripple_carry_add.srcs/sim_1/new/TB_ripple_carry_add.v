`timescale 1ns / 1ps
module TB_ripple_carry_add ();
    
    parameter N = 4;
    
    reg [N-1:0] a = 0;
    reg [N-1:0] b = 0;
    wire [N:0]  s;
    
    nbit_ripple_add #(.N(N)) nbit_ripple_add
    (
    .A(a),
    .B(b),
    .S(s)
    );

    integer ii,jj;
    initial begin
        for (ii = 0; ii< 2**N; ii = ii+1) begin
            for (jj = 0; jj< 2**N; jj = jj+1) begin
                a = ii;
                b = jj;
                #2;
            end
        end
    end
    
endmodule

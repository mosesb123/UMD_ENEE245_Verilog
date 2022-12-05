module TB_lookahead ();
    
    parameter N = 4;
    
    reg [N-1:0] a = 0;
    reg [N-1:0] b = 0;
    wire [N:0]  s;
    
    lookahead_4bit_addermodule lookahead
    (
    .A(a),
    .B(b),
    .S(s)
    );
    integer ii,jj;
    initial begin
        for (ii = 0; ii< N+1; ii = ii+1) begin
            for (jj = 0; jj< N+1; jj = jj+1) begin
                a = ii;
                b = jj;
                #10;
            end
        end
    end
    
endmodule

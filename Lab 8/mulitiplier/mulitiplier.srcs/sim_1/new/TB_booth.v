`timescale 1ns / 1ps
module TB_booth ();
    
    
    reg [3:0] A = 0;
    reg [3:0] B = 0;
    wire [7:0]  p;
    wire [2:0] add;
    wire [5:0] contrib;
    booth_mult booth
    (
    .A(A),
    .B(B),
    .P(p),
    .add(add),
    .contrib(contrib)
    );
    integer ii,jj;
    initial begin
        
        for (ii = 0; ii< 16; ii = ii+1) begin
            for (jj = 0; jj< 16; jj = jj+1) begin
                A = ii;
                B = jj;
                #2;
            end
        end
    end
    
endmodule

`timescale 1ns / 1ps
module TB_com_arr_mult ();
    
    
    reg [3:0] a = 0;
    reg [3:0] b = 0;
    wire [7:0]  p;
    
    array_com_mult arr
    (
    .A(a),
    .B(b),
    .P(p)
    );
    integer ii,jj;
    initial begin
        
        for (ii = 0; ii< 16; ii = ii+1) begin
            for (jj = 0; jj< 16; jj = jj+1) begin
                a = ii;
                b = jj;
                #2;
            end
        end
    end
    
endmodule

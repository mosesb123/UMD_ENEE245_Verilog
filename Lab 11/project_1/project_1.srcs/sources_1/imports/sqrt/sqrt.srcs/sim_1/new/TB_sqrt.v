`timescale 1ns / 1ps
module TB_sqrt ();
    
    
    reg [7:0] in = 0;
    wire [7:0] out;
    sqrt sq
    (
    .int(in),
    .sqrt(out)
    );
    integer ii;
    initial begin
        
        for (ii = 0; ii< 2**8; ii = ii+1) begin
                in = ii;
                #2;
            
        end
    end
    
endmodule

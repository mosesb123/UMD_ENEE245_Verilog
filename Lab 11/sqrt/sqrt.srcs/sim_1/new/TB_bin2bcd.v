`timescale 1ns / 1ps
module TB_bin2bcd ();
    
    
    reg [7:0] bin = 0;
    wire [11:0] bcd;
    bin_to_BCD bin2bcd
    (
    .bin(bin),
    .bcd(bcd)
    );
    integer ii;
    initial begin
        
        for (ii = 0; ii< 2**8; ii = ii+1) begin
                bin = ii;
                #2;
            
        end
    end
    
endmodule

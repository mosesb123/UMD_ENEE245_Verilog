`timescale 1ns / 1ns


module array_block (input A,
                    input B,
                    input S_in,
                    input C_in,
                    output C_out,
                    output S_out);
    
    full_add block(.A(S_in), .B(A&B), .C_in(C_in), .S(S_out), .C_out(C_out));
    
endmodule
    

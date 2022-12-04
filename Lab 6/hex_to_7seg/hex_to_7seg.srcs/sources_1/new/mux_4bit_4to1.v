`timescale 1ns / 1ns



module mux_4bit_4to1(input [3:0] a,     // 4-bit input called a
                     input [3:0] b,     // 4-bit input called b
                     input [3:0] c,     // 4-bit input called c
                     input [3:0] d,     // 4-bit input called d
                     input [1:0] sel,   // input sel used to select between a, b, c, d
                     output [3:0] out); // 4-bit output based on input sel
    
    assign out = sel[1] ? (sel[0] ? d : c) : (sel[0] ? b : a);
    
    
endmodule

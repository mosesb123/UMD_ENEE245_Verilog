`timescale 1ns / 1ns

module hex_to_7seg #(parameter R = 63)
                    (input clk,
                     input [15:0] num,
                     input clr,
                     output [3:0]encodedAn,   //all 4 anodes
                     output [6:0]encodedNum); //the 7 segments
    
    
    wire [31:0] count;
    wire [1:0] currentAn; //anode number
    wire [3:0] currentNum; //number to be displayed
    wire c_clk; // changed frequency clock
    
    
    clock_converter #(.RATIO(R)) c_c(.clk(clk), .clr(clr), .clk_en(c_clk),.count(count));
    n_bit_count #(.N(2)) current_anode(.clk(c_clk),.clr(clr), .q(currentAn));
    
    mux_4bit_4to1 mux(.a(num[15:12]),.b(num[11:8]),.c(num[7:4]),.d(num[3:0]),.sel(currentAn),.out(currentNum));
    
    decoder_7seg dec(.x(currentNum), .z(encodedNum));
    anode_driver an_d(.sel(currentAn),.an(encodedAn));
endmodule

`timescale 1ns / 1ps

module board_decoder_7seg(input [3:0] sw,
                          output [6:0] seg,
                          output an);
    
    assign an = 1'b0;
    decoder_7seg b_decoder_7seg(
    .x(sw),
    .z(seg)
    );
endmodule

`timescale 1ns / 1ps

module board_hex_to_7seg (input clk,
                          input [15:0] sw,
                          input btnC,
                          output[6:0]JA,
                          output [3:0] JB); //uncomment and comment above line when it's PMOD time
    
    
    hex_to_7seg   b_hex_to_7seg (
    .clk(clk),
    .clr(btnC),
    .num(sw),
    //    .encodedAn(an),.encodedNum(seg)
    .encodedAn(JB),.encodedNum(JA) //uncomment and comment above line when it's PMOD time
    );
endmodule

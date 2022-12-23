`timescale 1ns / 1ps

module board_com_mult #(parameter N = 4)
                       (input clk,
                        input [8:15] sw,
                        input btnC,
                        output[6:0]seg,
                        output [3:0]an);
    //,output[6:0]JA, output [3:0] JB
    //uncomment and comment above line when it's PMOD time
    wire [7:0] product;
    
    //    com_mult #(.N(N)) b_cm(
    //    array_com_mult #(.N(N)) b_acm(
    booth_mult b_booth(
    .A(sw[8:11]),.B(sw[12:15]), .P(product)
    );
    hex_to_7seg  b_hex_to_7seg (
    .clk(clk),
    .clr(btnC),
    .num({product,sw[8:11],sw[12:15]}),
    .encodedAn(an),.encodedNum(seg)
    //.encodedAn(JB),.encodedNum(JA) //uncomment and comment above line when it's PMOD time
    );
endmodule

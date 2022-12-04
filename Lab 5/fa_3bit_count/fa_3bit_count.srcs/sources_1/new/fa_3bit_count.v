`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2022 01:53:33 PM
// Design Name: 
// Module Name: fa_3bit_count
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module fa_3bit_count(
    //full adder vars
    output S,
    output C_out,

    //3 bit counter vars
    input clk,
    input clr,
    output [2:0] abc
    );
    wire[2:0] q;
    assign abc = q; //so that we can see the inputs
    
    n_bit_count #(.N(3)) two_bit_count(.clk(clk),.clr(clr), .q(q));
    full_add ha(.A(q[0]),.B(q[1]),.C_in(q[2]),.C_out(C_out),.S(S));


endmodule

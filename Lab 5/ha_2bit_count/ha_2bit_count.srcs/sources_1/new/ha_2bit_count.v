`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2022 01:37:36 PM
// Design Name: 
// Module Name: ha_2bit_count
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


module ha_2bit_count(
    //half adder vars
    output S,
    output C,

    //2 bit counter vars
    input clk,
    input clr,
    output [1:0] ab
    );
    wire[1:0] q;
    assign ab = q; //so that we can see the inputs
    
    n_bit_count #(.N(2)) two_bit_count(.clk(clk),.clr(clr), .q(q));
    half_add ha(.A(q[0]),.B(q[1]),.C(C),.S(S));


endmodule

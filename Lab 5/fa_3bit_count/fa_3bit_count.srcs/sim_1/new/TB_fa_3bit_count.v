`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2022 01:55:39 PM
// Design Name: 
// Module Name: TB_fa_3bit_count
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


module TB_fa_3bit_count(

    );    
    //full adder vars
    wire S;
    wire C_out;

    //3 bit counter vars
    reg clk;
    reg clr;
    wire [2:0] abc;
    
    fa_3bit_count DUT_fa_3bit_count(.abc(abc), .clr(clr), .clk(clk),.C_out(C_out),.S(S));
    
    initial begin
        clk = 0;
        clr = 1;
        #10 clr = 0;
        forever #10 clk = ~clk;
     end
    
endmodule

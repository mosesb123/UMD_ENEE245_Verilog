`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2022 01:42:39 PM
// Design Name: 
// Module Name: TB_ha_2bit_count
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


module TB_ha_2bit_count(

    );    
    //half adder vars
    wire S;
    wire C;

    //2 bit counter vars
    reg clk;
    reg clr;
    wire [1:0] ab;
    
    ha_2bit_count DUT_ha_2bit_count(.ab(ab), .clr(clr), .clk(clk),.C(C),.S(S));
    
    initial begin
        clk = 0;
        clr = 1;
        #10 clr = 0;
        forever #10 clk = ~clk;
     end
    
endmodule

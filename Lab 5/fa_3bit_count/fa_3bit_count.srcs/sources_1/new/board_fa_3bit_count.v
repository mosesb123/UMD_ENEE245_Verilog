`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2022 03:38:09 PM
// Design Name: 
// Module Name: board_fa_3bit_count
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


module board_fa_3bit_count(
    input clk,
    input btnC,
//    output [4:0] led,
    output [4:0] JA, //uncomment and comment above line when it's PMOD time
    output [3:0] an //just to make sure the display doesn't light up 
    );
  
  assign an=4'b1111;
  
  fa_3bit_count b_fa_3bit_count(
    .clk(clk),
    .clr(btnC),
//    .S(led[4]),.C_out(led[3]),.abc(led[2:0])
    .S(JA[4]),.C_out(JA[3]),.abc(JA[2:0]) //uncomment and comment above line when it's PMOD time
  );
endmodule

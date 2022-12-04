`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2022 03:07:55 PM
// Design Name: 
// Module Name: board_ha_2bit_count
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


module board_ha_2bit_count(
    input clk,
    input btnC,
//    output [3:0] led,
    output [3:0] JA, //uncomment and comment above line when it's PMOD time
    output [3:0] an //just to make sure the display doesn't light up 
    );
  
  assign an=4'b1111;
  
  ha_2bit_count b_ha_2bit_count(
    .clk(clk),
    .clr(btnC),
//    .S(led[3]),.C(led[2]),.ab(led[1:0])
    .S(JA[3]),.C(JA[2]),.ab(JA[1:0]) //uncomment and comment above line when it's PMOD time
  );
endmodule

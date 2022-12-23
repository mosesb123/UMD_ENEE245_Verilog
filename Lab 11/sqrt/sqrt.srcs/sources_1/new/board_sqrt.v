`timescale 1ns / 1ps

module board_sqrt 
                       (input clk,
                        input [8:15] sw,
                        input btnL,
                        input btnR,
                        output[6:0]seg,
                        output [3:0]an);
    //,output[6:0]JA, output [3:0] JB
    //uncomment and comment above line when it's PMOD time
    wire [7:0] product;
    wire [7:0] bin;
    wire [11:0] bcd;
    wire [11:0] disp; 
    
    
    //    com_mult #(.N(N)) b_cm(
    //    array_com_mult #(.N(N)) b_acm(
//    sqrt b_sqrt(
//    .sqrt(bin), .int(sw[8:15])
//    );
   
//   selector b_s(.bl(btnL), .br(btnR), .int(sw[8:15]), .sqrt(8'b00001011), .disp(disp));
  
    bin_to_BCD b_b2bcd(.bin(bin), .bcd(bcd));
    hex_to_7seg  b_hex_to_7seg (
    .clk(clk),
    .clr(btnC),
    .num(btnL ? 8'b00001000 : 8'b00000010),
    .encodedAn(an),.encodedNum(seg)
    //.encodedAn(JB),.encodedNum(JA) //uncomment and comment above line when it's PMOD time
    );
    
    
endmodule

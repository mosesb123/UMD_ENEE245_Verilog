`timescale 1ns / 1ps

module multipliers_delays(input x,        //function generator input
                          output[7:0]JA);
    wire [3:0] a = { x, ~x ,1'b1 ,1'b0}; //firgure out the values of a and b using only 1'b0, 1'b1, x and ~x
    wire [3:0] b = {x,~x,1'b1,1'b0};
    
//       wire [3:0] a  = { x, ~x ,x ,~x}; //firgure out the values of a and b using only 1'b0, 1'b1, x and ~x
//        wire [3:0] b = { x, ~x ,x ,~x}; //firgure out the values of a and b using only 1'b0, 1'b1, x and ~x
    
    
    com_mult  b_cm(
    //    array_com_mult  b_acm(
//        booth_mult b_booth(
    .A(a),.B(b),.P(JA)
    );
endmodule

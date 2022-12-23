`timescale 1ns / 1ps

module add_delays(input x,        //function generator input
                  output[4:0]JA);
    wire [3:0] a = { x, x ,x ,x}; //firgure out the values of a and b using only 1'b0, 1'b1, x and ~x
    wire [3:0] b = {x,x,x,x};
    nbit_ripple_add(.A(a),.B(b),.S(JA));
    //lookahead_4bit_adder(.A(a),.B(b),.S(JA));
endmodule

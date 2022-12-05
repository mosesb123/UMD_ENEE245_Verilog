`timescale 1ns / 1ns



module decoder_7seg (input wire [3:0] x,
                     output reg [6:0] z);
    
    always @*
    case (x)
        4'b0000 : z = 7'b1000000; //hex 0
        4'b0001 : z = 7'b1111001; //hex 1
        4'b0010 : z = 7'b0100100; //hex 2
        4'b0011 : z = 7'b0110000; //hex 3
        4'b0100 : z = 7'b0011001; //hex 4
        4'b0101 : z = 7'b0010010; //hex 5
        4'b0110 : z = 7'b0000010; //hex 6
        4'b0111 : z = 7'b1111000; //hex 7
        4'b1000 : z = 7'b0000000; //hex 8
        4'b1001 : z = 7'b0010000; //hex 9
        4'b1010 : z = 7'b0001000; //hex a
        4'b1011 : z = 7'b0000011; //hex b
        4'b1100 : z = 7'b1000110; //hex c
        4'b1101 : z = 7'b0100001; //hex d
        4'b1110 : z = 7'b0000110; //hex e
        4'b1111 : z = 7'b0001110; //hex f
        default : z = 7'b0111111; //Default Case '-'
    endcase
    
endmodule

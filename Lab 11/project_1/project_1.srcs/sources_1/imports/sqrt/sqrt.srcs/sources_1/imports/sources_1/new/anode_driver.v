`timescale 1ns / 1ps
module anode_driver (input wire [1:0] sel,
                     output reg [3:0] an);
    
    always @*
    case (sel)
        2'b00 : an = 4'b1110; //first anode
        2'b01 : an = 4'b1101; //second anode
        2'b10 : an = 4'b1011; //third anode
        2'b11 : an = 4'b0111; //fourth anode
        default:an = 4'b1111; //all off
    endcase
    
endmodule

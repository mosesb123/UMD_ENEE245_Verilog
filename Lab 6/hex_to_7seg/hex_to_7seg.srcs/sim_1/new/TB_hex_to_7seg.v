`timescale 1ns / 1ps
module TB_hex_to_7seg();
    
    reg clk;
    reg [15:0] num;
    reg clr;
    
    wire [3:0]encodedAn;
    wire [6:0]encodedNum;
    
    
    hex_to_7seg DUT_hex_to_7seg(
    .clk(clk),
    .clr(clr),
    .num(num),
    .encodedAn(encodedAn),
    .encodedNum(encodedNum)
    );
    
    initial begin
        
        num = 16'b1110110010000000;
        //    $display("Anode %i is displaying %i", encodedAnode, encodedNum);
        clk    = 0;
        clr    = 1;
        #1 clr = 0;
        forever #1 begin
        clk = ~clk;
    end
    end
endmodule

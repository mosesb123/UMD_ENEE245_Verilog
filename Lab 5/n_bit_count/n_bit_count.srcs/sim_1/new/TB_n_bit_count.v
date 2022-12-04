`timescale 1ns / 1ns


module TB_n_bit_count();
    reg CLK;
    reg CLR;
    
    //Output
    
    wire [7:0] NBIT;
    wire [1:0] tBIT;
    wire [2:0] thBIT;
    
    n_bit_count DUT_n_bit(.clk(CLK), .clr(CLR), .q(NBIT));
    two_bit_count DUT_two_bit(.clk(CLK), .clr(CLR), .q(tBIT));
    three_bit_count DUT_three_bit(.clk(CLK), .clr(CLR), .q(thBIT));
    
    initial begin
        CLK             = 0;
        CLR             = 1;
        #10 CLR         = 0;
        forever #10 CLK = ~CLK;
    end
endmodule

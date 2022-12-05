`timescale 1ns / 1ps

module TB_anode_decoder();
    
    reg clk;
    reg clr;
    
    wire clk_en;
    wire [31:0] count;
    wire [1:0] currentAn;
    
    wire [3:0] encodedAn;
    
    
    
    clock_converter DUT_clock_converter(.clk(clk),.clr(clr),.clk_en(clk_en),.count(count));
    
    n_bit_count #(.N(2)) DUT_current_anode(.clk(clk_en),.clr(clr),.q(currentAn));
    
    anode_driver DUT_anode_decoder(.sel(currentAn),.an(encodedAn));
    
    initial begin
        $display("Count = %d", count);
        clk             = 0;
        clr             = 1;
        #1 clr          = 0;
        forever #1 clk  = ~clk;
    end
    
endmodule

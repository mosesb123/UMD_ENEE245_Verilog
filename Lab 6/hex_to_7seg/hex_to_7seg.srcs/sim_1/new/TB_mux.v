`timescale 1ns / 1ps

module TB_mux();
    
    reg clk;
    reg clr;
    
    wire clk_en;
    wire [31:0] count;
    wire [1:0] currentAn;
    
    wire [3:0] encodedAn;
    
    reg [15:0]num;
    
    wire [3:0] currentNum;
    
    
    
    clock_converter DUT_clock_converter(.clk(clk),.clr(clr),.clk_en(clk_en),.count(count));
    
    n_bit_count #(.N(2)) DUT_current_anode(.clk(clk_en),.clr(clr),.q(currentAn));
    
    anode_driver DUT_anode_decoder(.sel(currentAn),.an(encodedAn));
    
    
    mux_4bit_4to1 DUT_mux(.a(num[15:12]),.b(num[11:8]),.c(num[7:4]),.d(num[3:0]),.sel(currentAn),.out(currentNum));
    
    initial begin
        num <= 16'b1110110010000000;
        $display("Count = %d", count);
        clk             = 0;
        clr             = 1;
        #1 clr          = 0;
        forever begin
            #1 clk = ~clk;
        end
    end
    
endmodule

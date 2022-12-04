`timescale 1ps / 1ps
module TB_clock_converter();
    
    reg clk;
    reg clr;
    wire clk_en;
    wire [31:0] count;
    
    clock_converter DUT_clock_converter(
    .clk(clk),
    .clr(clr),
    .clk_en(clk_en),
    .count(count)
    );
    
    initial begin
        $display("Count = %d", count);
        clk             = 0;
        clr             = 1;
        #1 clr          = 0;
        forever #1 clk  = ~clk;
    end
    
endmodule
    

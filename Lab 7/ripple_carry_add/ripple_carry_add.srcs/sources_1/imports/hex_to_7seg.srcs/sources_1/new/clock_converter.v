`timescale 1ns / 1ns
//converts the 100MHZ clock down slower
module clock_converter #(parameter RATIO = 63)
                        (input wire clk,
                         input wire clr,
                         output reg clk_en,
                         output reg [31:0] count);
    always @(posedge clk,posedge clr)
        if (clr == 1)
            count <= 0;
        else begin
            if (count == RATIO) begin
                count  <= 0;
                clk_en <= 1;
                end else begin
                count  <= count + 1;
                clk_en <= 0;
            end
        end
    
endmodule
    

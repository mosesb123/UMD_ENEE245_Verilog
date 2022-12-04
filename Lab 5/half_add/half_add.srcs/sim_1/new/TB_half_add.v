`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2022 09:26:58 PM
// Design Name: 
// Module Name: TB_half_add
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module TB_half_add(

    );
    //Input
    reg a;
    reg b;
    
    //Output
    wire s;
    wire c;
    
    half_add DUT_h(.A(a),.B(b),.C(c),.S(s)); //instance of Device Under Test
    
    //The Simulation
    //initilizations: regs outside initial, wires inside
    reg [1:0] real_sum;
    integer i = 0;
    initial begin
         a=1'b0;
         b=1'b0;
 
         #10 $display("Start Test");   
            
         #10 
         for (i=0; i<8; i = i+1) begin
         {a,b} = i;
         real_sum = a+b;
         #10
         $display("%b + %b = %b%b = %d",a,b,c,s,real_sum);
         end
    end
endmodule

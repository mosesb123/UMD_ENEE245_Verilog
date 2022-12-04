`timescale 1ns / 1ps

module TB_full_add(

    );
    //input
    
    reg cin;
    reg a;
    reg b;
    
    //Output
    
    wire s;
    wire cout;
    
    full_add DUT_fa(.A(a), .B(b), .C_in(cin),.C_out(cout),.S(s));
 
 
    reg [1:0] real_sum;
    integer i = 0;
    initial begin
        cin = 0;
        a = 0;
        b = 0;
        #10 $display("Start Test");
        for (i=0; i<8; i = i+1) begin
            {cin,a,b} = i;
            real_sum = a+b+cin;
            #10 $display("%b+%b+%b = %b%b = %d",cin,a,b,cout,s,real_sum); 
        end  
    end
   
endmodule


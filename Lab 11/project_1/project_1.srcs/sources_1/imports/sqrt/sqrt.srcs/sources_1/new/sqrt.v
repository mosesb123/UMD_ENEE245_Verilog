/*
output: sqrt(x1^2 + x2^2)
zubarev.e.v@gmail.com
*/

/*
sqrt #(16) instance_name(clock_input, first_signed_input, second_signed_input, unsigned_output);
*/
module sqrt
    #(parameter N = 8)
    (
    
    input   wire    signed  [ N-1:  0 ] int,
    output  wire            [ N-1:  0 ] sqrt
    );


assign sqrt[N-1] = int[(2*N-1)-:2] == 2'b00 ? 1'b0 : 1'b1;
genvar k;
generate
    for(k = N-2; k >= 0; k = k - 1)
    begin
        assign sqrt[k] = int[(2*N-1)-:(2*(N-k))] < 
        {sqrt[N-1:k+1],1'b1}*{sqrt[N-1:k+1],1'b1} ? 1'b0 : 1'b1;
    end
endgenerate

endmodule
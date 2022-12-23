`timescale 1ns / 1ps


module array_com_mult #(parameter N = 4)
                       (input [N-1:0] A,
                        input [N-1:0] B,
                        output [(2*N)-1:0] P);
    
    wire [N-1:0] sum_out [0:N-1];
    wire [N-1:0] c_out [0:N-1];
    wire [N:0] c_internal = {(N+1){1'b0}};
  
    
    
      
////    assign sum_out[0] = 4'b0;
////    assign c_out[0]   = 4'b0;
    
    genvar j;
    generate
    for (j = 0; j < N; j = j+1)
    
    begin
    if (j == 0 ) begin
array_row #(.N(N)) rows (
    .A   (A[j]), //A[0] A[1] A[2] A[3]
    .B   (B), //B
    .sum_in   (3'b0), //4'b0 sum_out[0][3:1] sum_out[1][3:1] sum_out[2][3:1] 
    .c_in   (4'b0), //4'b0 c_out[0]  c_out[1]  c_out[2] 
   .sum_out   (sum_out[j]), //sum_out[0] sum_out[1] sum_out[2] sum_out[3]
    .c_out   (c_out[j]) //c_out[0] c_out[1] c_out[2] c_out[3]
    );      
    end
    else begin 
  array_row #(.N(N)) rows (
    .A   (A[j]), //A[0] A[1] A[2] A[3]
    .B   (B), //B
    .sum_in   (sum_out[j-1][N-1:1]), //4'b0 sum_out[0][3:1] sum_out[1][3:1] sum_out[2][3:1] 
    .c_in   (c_out[j-1]), //4'b0 c_out[0]  c_out[1]  c_out[2] 
   .sum_out   (sum_out[j]), //sum_out[0] sum_out[1] sum_out[2] sum_out[3]
    .c_out   (c_out[j]) //c_out[0] c_out[1] c_out[2] c_out[3]
    );     
    
    end
    
    assign P[N+j] = sum_out[j][0];
    
    
//    if (j <N-1) begin
//        full_add faEn(.A(c_out[N-1][j-1]),.B(sum_out[N-1][j]),.C_in(c_internal[j-1]), .S(P[N+j]),.C_out(c_internal[j]));
//    end
//    else begin
//        full_add faFinal(.A(c_out[N-1][j-1]),.B(c_internal[j-1]),.C_in(c_internal[j-1]), .S(P[N+j]),.C_out(c_internal[j]));
//    end
    
//            full_add faEnd (
//            .A(c_out[N-1][j]),
//            .B(sum_out[N-1][j]),
//              .C_in(c_out[N-1][j-1]),
//               .S(P[N+j]),
//               .C_out(c_internal[j-1]));
    end
    endgenerate
    
        half_add ha1(.A(c_out[3][0]),.B(sum_out[3][1]), .S(P[0]),.C(c_internal[1]));
        full_add fa1(.A(c_out[3][1]),.B(sum_out[3][2]),.C_in(c_internal[1]), .S(P[1]),.C_out(c_internal[2]));
        full_add fa2(.A(c_out[3][2]),.B(sum_out[3][3]),.C_in(c_internal[2]), .S(P[2]),.C_out(c_internal[3]));
        half_add ha2(.A(c_out[3][3]),.B(c_internal[3]), .S(P[3]));
    
endmodule


    

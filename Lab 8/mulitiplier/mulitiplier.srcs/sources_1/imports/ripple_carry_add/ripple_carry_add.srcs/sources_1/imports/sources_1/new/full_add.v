`timescale 1ns / 1ps

module full_add(
    input A,
    input B,
    input C_in,
    output S,
    output C_out
    );

     //Internal variables
     wire ha1_sum;
     wire ha2_sum;
     wire ha1_carry;
     wire ha2_carry;
     wire Data_out_Sum;
     wire Data_out_Carry;

     //half adder 1
    half_add  ha1(
        .A(A),
        .B(B),
        .S(ha1_sum),
        .C(ha1_carry)
    );
    
    //half adder 2
    half_add  ha2(
        .A(C_in),
        .B(ha1_sum),
        .S(ha2_sum),
        .C(ha2_carry)
    );
    //final assignments
    assign S = ha2_sum;  
    assign C_out = ha1_carry | ha2_carry;
    
endmodule

`timescale 1ns / 1ps

module booth_mult #(parameter N = 4,
                    parameter R = 2)
                   (input [N-1:0] A,
                    input [N-1:0] B,
                    output [(2*N)-1:0] P);
    
    reg [N+1:0] contrib;
    reg signed [N+R-1:0] add;
    reg signed [2*N +1:0] p;
    integer i;
    assign P = p[2*N-1:0];
    always @(A or B) begin
        contrib = {B,1'b0};
        p       = 0;
        for (i = 0; i < N-1; i = i+ 1) begin
            p = p >>> R;
            case(contrib[R:0])
                3'b000:  add = 2'b00;
                3'b001:  add = {2'b0,A};
                3'b010:  add = {2'b0,A};
                3'b011:  add = {1'b0,A} <<1;
                3'b100:  add = ~({1'b0,A}<<1)+1;
                3'b101:  add = ~{2'b0,A} + 1;
                3'b110:  add = ~{2'b0,A} +1;
                3'b111:  add = 2'b00;
            endcase
            p       = p + {add, {N{1'b0}}};
            contrib = contrib >>R;
        end
    end
endmodule

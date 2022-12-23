module selector(input bl, input br, input [7:0] int, input [7:0] sqrt, output reg [7:0] disp);

// use the control signal to select the output value
always @(bl, br) begin
  if (bl) begin
    disp = sqrt;
  end else begin
    disp = int;
  end
end

endmodule

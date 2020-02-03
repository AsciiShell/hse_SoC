module jk_latch
(
	input j,
   input k,
	input ck,
   output reg q,
   output q_n
);
  assign q_n = ~q;
  always @(ck) begin
    case({j,k})
      2'b0_1 : q <= 1'b0;
      2'b1_0 : q <= 1'b1;
      2'b1_1 : q <= ~q  ;
    endcase
  end
endmodule

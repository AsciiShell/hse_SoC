module jk_latch
(
       j,
       k,
	 	ck,
      q,
      q_n
);
	input j,k,ck;
	output q, q_n;
	reg q;
//	wire top = ~ (j & ck & q_n);
//	wire bottom = ~ (k & ck & q);
//	assign q = ~ (top & q_n);
//	assign q_n = ~ (bottom & q);
	assign q_n = ~q;
  always @(posedge ck) begin
    case({j,k})
      2'b0_0 : q <= q   ;
      2'b0_1 : q <= 1'b0;
      2'b1_0 : q <= 1'b1;
      2'b1_1 : q <= ~q  ;
    endcase
  end
//	assign q = _q;
//	assign q_n = ~_q;
endmodule

module t_latch
(
	input t,
	input ck,
   output q,
   output q_n
);

jk_latch jk_latch(t, t, ck, q, q_n);

endmodule

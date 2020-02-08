module de10_lite_jk_flip_flop
(
	input	ADC_CLK_10,
	input MAX10_cLK1_50,
	input MAX10_cLK2_50,

	input [ 1:0] KEY,
   input [ 2:0] SW,
   output [ 9:0] LEDR
);
	assign LEDR[9:1] =  9'b0;
  
  jk_flip_flop jk_flip_flop(
  .j ( SW [0]),
  .k ( SW [1]),
  .clk ( ~ KEY [0]),
  .q (LEDR[0])
  );
endmodule

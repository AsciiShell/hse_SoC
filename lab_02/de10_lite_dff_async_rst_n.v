module de10_lite_dff_async_rst_n
(
	input	ADC_CLK_10,
	input MAX10_cLK1_50,
	input MAX10_cLK2_50,

	input [ 1:0] KEY,
   input [ 2:0] SW,
   output [ 9:0] LEDR
);
	assign LEDR[9:1] =  9'b0;
  
  dff_async_rst_n dff_async_rst_n(
  .clk ( ~ KEY [1]),
  .rst_n ( SW [1]),
  .d ( ~ KEY [0]),
  .q (LEDR[0])
  );
endmodule

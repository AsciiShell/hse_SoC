module de10_lite_dff_with_en
(
	input	ADC_CLK_10,
	input MAX10_cLK1_50,
	input MAX10_cLK2_50,

	input [ 1:0] KEY,
   input [ 2:0] SW,
   output [ 9:0] LEDR
);
	assign LEDR[9:1] =  9'b0;
  
  dff_with_en dff_with_en(
  .clk ( ~ KEY [1]),
  .en ( SW [0]),
  .d ( ~ KEY [0]),
  .q (LEDR[0])
  );
endmodule

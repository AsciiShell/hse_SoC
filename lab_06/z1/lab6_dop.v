module lab6_dop
(
    input   [ 1:0]  KEY,
    input   [ 9:0]  SW,
    output  [ 9:0]  LEDR
);

	try_dop #(8) try_dop (.clk(~KEY[0]),.rst_n(SW[9]),.enable(SW[8]),.bin(LEDR[7:0]));
	//sel(SW[9:8]), .y(LEDR[9:6]));

endmodule
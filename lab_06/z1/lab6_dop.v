module lab6_dop
(
    input   [ 1:0]  KEY,
    input   [ 9:0]  SW,
    output  [ 9:0]  LEDR
);
	
	assign LEDR[9:8] = 2'b00
	
	try_dop #(8) try_dop(.data(~KEY[0]),.rst_n(SW[0]),.enable(SW[1]),.bin_inc(LEDR[7:0]));


endmodule
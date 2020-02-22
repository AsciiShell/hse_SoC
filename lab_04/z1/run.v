module run
(
    input   [ 1:0]  KEY,
    input   [ 9:0]  SW,
    output  [ 9:0]  LEDR
);

	//z2

//    b2_mux_2_1_sel b2_mux_2_1_sel(.d0(SW[1:0]),.d1(SW[3:2]),.sel(KEY[0]),.y(LEDR[1:0]));
//    b2_mux_2_1_if b2_mux_2_1_if(.d0(SW[1:0]),.d1(SW[3:2]),.sel(KEY[0]),.y(LEDR[3:2]));
//	 b2_mux_2_1_case b2_mux_2_1_case(.d0(SW[1:0]),.d1(SW[3:2]),.sel(KEY[0]),.y(LEDR[3:2]));
//    b2_mux_2_1_comb_correct1 b2_mux_2_1_comb_correct1(.d0(SW[1:0]),.d1(SW[3:2]),.sel(KEY[0]),.y(LEDR[5:4]));
//    b2_mux_2_1_comb_correct2 b2_mux_2_1_comb_correct2(.d0(SW[1:0]),.d1(SW[3:2]),.sel(KEY[0]),.y(LEDR[7:6]));
//    b2_mux_2_1_comb_incorrect b2_mux_2_1_comb_incorrect(.d0(SW[1:0]),.d1(SW[3:2]),.sel(KEY[0]),.y(LEDR[9:8]));
//    
	//z3
	
//	 b2_mux_4_1_case b2_mux_4_1_case(.d0(SW[1:0]),.d1(SW[3:2]),.d2(SW[5:4]),.d3(SW[7:6]),.sel(KEY[1:0]),.y(LEDR[1:0]));
//    b2_mux_4_1_sel b2_mux_4_1_sel(.d0(SW[1:0]),.d1(SW[3:2]),.d2(SW[5:4]),.d3(SW[7:6]),.sel(KEY[1:0]),.y(LEDR[3:2]));
//    b2_mux_4_1_block b2_mux_4_1_block(.d0(SW[1:0]),.d1(SW[3:2]),.d2(SW[5:4]),.d3(SW[7:6]),.sel(KEY[1:0]),.y(LEDR[5:4]));
    b2_mux_4_1_block_alt b2_mux_4_1_block_alt(.d0(SW[1:0]),.d1(SW[3:2]),.d2(SW[5:4]),.d3(SW[7:6]),.sel(KEY[1:0]),.y(LEDR[7:6]));

endmodule
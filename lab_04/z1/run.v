module run
(
    input   [ 1:0]  KEY,
    input   [ 9:0]  SW,
    output  [ 9:0]  LEDR
);

	//z2

//    b2_mux_2_1_sel b2_mux_2_1_sel(.d0(SW[1:0]),.d1(SW[3:2]),.sel(KEY[0]),.y(LEDR[1:0]));
//    b2_mux_2_1_if b2_mux_2_1_if(.d0(SW[1:0]),.d1(SW[3:2]),.sel(KEY[0]),.y(LEDR[3:2]));
//	 	b2_mux_2_1_case b2_mux_2_1_case(.d0(SW[1:0]),.d1(SW[3:2]),.sel(KEY[0]),.y(LEDR[3:2]));
//    b2_mux_2_1_comb_correct1 b2_mux_2_1_comb_correct1(.d0(SW[1:0]),.d1(SW[3:2]),.sel(KEY[0]),.y(LEDR[5:4]));
//    b2_mux_2_1_comb_correct2 b2_mux_2_1_comb_correct2(.d0(SW[1:0]),.d1(SW[3:2]),.sel(KEY[0]),.y(LEDR[7:6]));
//    b2_mux_2_1_comb_incorrect b2_mux_2_1_comb_incorrect(.d0(SW[1:0]),.d1(SW[3:2]),.sel(KEY[0]),.y(LEDR[9:8]));
//    
	//z3
	
//		b2_mux_4_1_case b2_mux_4_1_case(.d0(SW[1:0]),.d1(SW[3:2]),.d2(SW[5:4]),.d3(SW[7:6]),.sel(KEY[1:0]),.y(LEDR[1:0]));
//    b2_mux_4_1_sel b2_mux_4_1_sel(.d0(SW[1:0]),.d1(SW[3:2]),.d2(SW[5:4]),.d3(SW[7:6]),.sel(KEY[1:0]),.y(LEDR[3:2]));
//    b2_mux_4_1_block b2_mux_4_1_block(.d0(SW[1:0]),.d1(SW[3:2]),.d2(SW[5:4]),.d3(SW[7:6]),.sel(KEY[1:0]),.y(LEDR[5:4]));
//    b2_mux_4_1_block_alt b2_mux_4_1_block_alt(.d0(SW[1:0]),.d1(SW[3:2]),.d2(SW[5:4]),.d3(SW[7:6]),.sel(KEY[1:0]),.y(LEDR[7:6]));


	//z4
	
//		b2_mux_3_1_case_latch b2_mux_3_1_case_latch(.d0(SW[1:0]),.d1(SW[3:2]),.d2(SW[5:4]),.sel(KEY[1:0]),.y(LEDR[1:0]));
//		b2_mux_3_1_case_correct b2_mux_3_1_case_correct(.d0(SW[1:0]),.d1(SW[3:2]),.d2(SW[5:4]),.sel(KEY[1:0]),.y(LEDR[3:2]));
//		b2_mux_3_1_casex_correct b2_mux_3_1_casex_correct(.d0(SW[1:0]),.d1(SW[3:2]),.d2(SW[5:4]),.sel(KEY[1:0]),.y(LEDR[5:4]));
//		b2_mux_3_1_if_latch b2_mux_3_1_if_latch(.d0(SW[1:0]),.d1(SW[3:2]),.d2(SW[5:4]),.sel(KEY[1:0]),.y(LEDR[1:0]));
//		b2_mux_3_1_if_correct b2_mux_3_1_if_correct(.d0(SW[1:0]),.d1(SW[3:2]),.d2(SW[5:4]),.sel(KEY[1:0]),.y(LEDR[1:0]));
//		b2_mux_3_1_ifx_correct b2_mux_3_1_ifx_correct(.d0(SW[1:0]),.d1(SW[3:2]),.d2(SW[5:4]),.sel(KEY[1:0]),.y(LEDR[1:0]));

	//z5
	
//		b1_func_8_1_case b1_func_8_1_case(.sel(SW[2:0]),.y(LEDR[0]));
		
	//z7
//	
//		bn_select_8_1_case #(3) bn_select_8_1_case (.d0(SW[2:0]), .d1(SW[3:1]), .d2(SW[4:2]), 
//                                                .d3(SW[5:3]), .d4(SW[6:4]), .d5(SW[7:5]), 
//                                                .d6(SW[8:6]), .d7(SW[9:7]), .sel(SW[7:0]), .y(LEDR[2:0]));
		
	//dop1
	
//		b2_mux_8_1_block b2_mux_8_1_block(.d0(SW[1:0]), .d1(SW[2:1]), .d2(SW[3:2]), 
//                                                .d3(SW[4:3]), .d4(SW[5:4]), .d5(SW[6:5]), 
//                                                .d6(SW[7:6]), .d7(SW[8:7]), .sel(SW[2:0]), .y(LEDR[1:0]));
																
	//dop2
//		b1_mux_4_1_case_nili b1_mux_4_1_case_nili(.sel(SW[1:0]), .y(LEDR[0]));
		
	//dop3
	
		b1_func_8_1_case_dop b1_func_8_1_case_dop (.sel(SW[2:0]),.y(LEDR[0]));
endmodule


module b2_mux_8_1_block
(
    input  [1:0] d0, d1, d2, d3, d4, d5, d6, d7,
    input  [2:0] sel,
    output [1:0] y
);

    wire [1:0] w01, w23;
	 
	 b2_mux_4_1_case mux0(.d0(d0), .d1(d1),.d2(d2),.d3(d3),.sel({sel[1], sel[0]}),.y(w01));
	 b2_mux_4_1_case mux1(.d0(d4), .d1(d5),.d2(d6),.d3(d7),.sel({sel[1], sel[0]}),.y(w23));
	 b2_mux_2_1_case mux2(.d0(w01), .d1(w23),.sel(sel[2]), .y(y));


endmodule
module b2_mux_4_1_block_alt
(
    input  [1:0] d0, d1, d2, d3,
    input  [1:0] sel,
    output [1:0] y
);
    b1_mux_4_1_case hi(.d0(d0[1]), .d1(d1[1]), .d2(d2[1]), .d3(d3[1]), .sel(sel), .y(y[1]));
    b1_mux_4_1_case lo(.d0(d0[0]), .d1(d1[0]), .d2(d2[0]), .d3(d3[0]), .sel(sel), .y(y[0]));
endmodule
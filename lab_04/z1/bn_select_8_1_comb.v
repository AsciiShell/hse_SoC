module bn_select_8_1_comb
#(parameter DATA_WIDTH=8)
(
    input       [DATA_WIDTH-1:0] d0, 
    input       [DATA_WIDTH-1:0] d1,
    input       [DATA_WIDTH-1:0] d2,
    input       [DATA_WIDTH-1:0] d3,
    input       [DATA_WIDTH-1:0] d4, 
    input       [DATA_WIDTH-1:0] d5,
    input       [DATA_WIDTH-1:0] d6,
    input       [DATA_WIDTH-1:0] d7,
    input       [7:0] sel,
    output   [DATA_WIDTH-1:0] y
);
	 wire [DATA_WIDTH-1:0] w0;
	 wire [DATA_WIDTH-1:0] w1;
	 wire [DATA_WIDTH-1:0] w2;
	 wire [DATA_WIDTH-1:0] w3;
	 wire [DATA_WIDTH-1:0] w4;
	 wire [DATA_WIDTH-1:0] w5;
	 wire [DATA_WIDTH-1:0] w6;
	 wire [DATA_WIDTH-1:0] w7;
	 bn_mn #(DATA_WIDTH) bn_mn0(.w(d0), .sel(sel[0]), .y1(w0));
	 bn_mn #(DATA_WIDTH) bn_mn1(.w(d1), .sel(sel[1]), .y1(w1));
	 bn_mn #(DATA_WIDTH) bn_mn2(.w(d2), .sel(sel[2]), .y1(w2));
	 bn_mn #(DATA_WIDTH) bn_mn3(.w(d3), .sel(sel[3]), .y1(w3));
	 bn_mn #(DATA_WIDTH) bn_mn4(.w(d4), .sel(sel[4]), .y1(w4));
	 bn_mn #(DATA_WIDTH) bn_mn5(.w(d5), .sel(sel[5]), .y1(w5));
	 bn_mn #(DATA_WIDTH) bn_mn6(.w(d6), .sel(sel[6]), .y1(w6));
	 bn_mn #(DATA_WIDTH) bn_mn7(.w(d7), .sel(sel[7]), .y1(w7));
	 assign y = w0 | w1 | w2| w3 | w4 | w5 | w6 | w7;
endmodule

module bn_mn
#(parameter DATA_WIDTH=8)
(
    input        [DATA_WIDTH-1:0] w, 
    input        sel,
    output   [DATA_WIDTH-1:0] y1
);
    wire [DATA_WIDTH - 1:0] select;
    assign select = {DATA_WIDTH {sel}};
    assign y1 = (select & w);
endmodule
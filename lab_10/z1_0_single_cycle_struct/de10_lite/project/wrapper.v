module wrapper
# (
    parameter w = 8
) 
(
    input            clk,
	 input rst_n,
    output [w - 1:0]ledr
);
	wire clk2;
	clk_divider #(3) ww (.clk(clk), .rst_n(rst_n), .divided_clk(clk2));

	reg [w - 1:0]number;
	reg [w - 1: 0]number2;
	always @(posedge clk2)
	begin
		number = number + 1;
		case(number) 
			8'h00: number2 = 8'h00;
			8'h01: number2 = 8'h0a;
			8'h02: number2 = 8'h14;
			8'h03: number2 = 8'h1e;
			8'h04: number2 = 8'h28;
			8'h05: number2 = 8'h32;
			8'h06: number2 = 8'h3c;
			8'h07: number2 = 8'h46;
			8'h08: number2 = 8'h50;
			8'h09: number2 = 8'h5a;
			default: 
			begin
				number = 8'h00;
				number2 = 8'h00;
			end
		endcase
	end

	pow_5_single_cycle_struct #(w) www
	(
        .clk     ( clk2    ),
        .rst_n   ( rst_n       ),
        .arg     ( number2          ),
        .res     ( ledr  )
    );

endmodule

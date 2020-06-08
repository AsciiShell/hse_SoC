module pow_5_single_cycle_struct
# (
    parameter w = 8
)
(
    input            clk,
    input            rst_n,
    input  [w - 1:0] arg,
    output [w - 1:0] res
);

    wire   [w - 1:0] arg_x;
    reg_no_rst # (w) i_arg     (clk, arg, arg_x);

	 reg   [w - 1:0] y;
	 reg   [w - 1:0] b;
	 reg   [w - 1:0] x;
	 always @ (posedge clk)
	 begin
	     x = arg_x;
	     y = 8'b00000000;
		  
        b = y | 8'b00000000;
        y = y >> 1;
        if (x >= b)
        begin
            x = x - b;
            y = y | 8'b00000000;
        end
        b = y | 8'b00000000;
        y = y >> 1;
        if (x >= b)
        begin
            x = x - b;
            y = y | 8'b00000000;
        end
        b = y | 8'b00000000;
        y = y >> 1;
        if (x >= b)
        begin
            x = x - b;
            y = y | 8'b00000000;
        end
        b = y | 8'b00000000;
        y = y >> 1;
        if (x >= b)
        begin
            x = x - b;
            y = y | 8'b00000000;
        end
        b = y | 8'b01000000;
        y = y >> 1;
        if (x >= b)
        begin
            x = x - b;
            y = y | 8'b01000000;
        end
        b = y | 8'b00010000;
        y = y >> 1;
        if (x >= b)
        begin
            x = x - b;
            y = y | 8'b00010000;
        end
        b = y | 8'b00000100;
        y = y >> 1;
        if (x >= b)
        begin
            x = x - b;
            y = y | 8'b00000100;
        end
        b = y | 8'b00000001;
        y = y >> 1;
        if (x >= b)
        begin
            x = x - b;
            y = y | 8'b00000001;
        end
	 end

    reg_no_rst # (w) i_res     (clk, y, res);

endmodule

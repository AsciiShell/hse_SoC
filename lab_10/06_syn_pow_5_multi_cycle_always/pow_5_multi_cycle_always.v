module pow_5_multi_cycle_always
# (
    parameter w = 8
)
(
    input            clk,
    input            rst_n,
    input            arg_vld,
    input  [w - 1:0] arg,
    output           res_vld,
    output [w - 1:0] res
);

    reg           arg_vld_q;
    reg [w - 1:0] arg_q;

    always @ (posedge clk or negedge rst_n)
        if (! rst_n)
            arg_vld_q <= 1'b0;
        else
            arg_vld_q <= arg_vld;
    
    always @ (posedge clk)
        if (arg_vld)
            arg_q <= arg;

    reg [3:0] shift;

    always @ (posedge clk or negedge rst_n)
        if (! rst_n)
            shift <= 4'b0;
        else if (arg_vld_q)
            shift <= 4'b1000;
        else
            shift <= shift >> 1;

    assign res_vld = shift [0];

    reg  [w - 1:0] mul_q;
	 reg [w - 1:0] mul_d;
	 
    always @ (posedge clk)
        if (arg_vld_q)
            mul_d <= arg_vld_q * arg_q;
        else
			   mul_d <= arg_q * arg_q;
    
    always @(posedge clk)
        if (arg_vld_q || shift [3:1] != 3'b0)
            mul_q <= mul_d;

    assign res = mul_q;

endmodule

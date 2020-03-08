module register
#(
    parameter SIZE = 4
)
(
    input                          ena, 
    input                          clk,
    input      [SIZE - 1 : 0]      d,
    output reg [SIZE - 1 : 0]      q
);
    always @ (posedge clk)
	if (ena) 
            q <= d;
endmodule   
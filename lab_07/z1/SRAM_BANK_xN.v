module SRAM_BANK_xN
#(parameter NUM_BLOCK=4)
(
	input we, clk,
	input [NUM_BLOCK - 1:0] page,
	input [NUM_BLOCK - 1:0] addr,
	input [5:0] data_in,
	output reg [5:0] data_out
);

	reg [NUM_BLOCK - 1:0] en;
	wire [NUM_BLOCK - 1:0] dout[5:0];
	
	always @(*)
	begin: decode
		en = {NUM_BLOCK {1'b0}};
		en[page] = 1'b1;
	end
	
	for (i=0 i<NUM_BLOCK; i=i+1) {
		SRAM_16x6 M(.data_in(data_in),.addr(addr),.clk(clk),.data_out(dout[i]),.we(en[i]));
	}
	
	data_out = dout[page]
	
endmodule
	
	
module SRAM_BANK_x4
(
	input we, clk,
	input [1:0] page,
	input [3:0] addr,
	input [5:0] data_in,
	output reg [5:0] data_out
);

	reg [3:0] en;
	wire [5:0] dout0, dout1, dout2, dout3;
	
	always @*
	begin: decode
	en = 4'b0000;
	en[page] = 1'b1;
	end
	
	SRAM_16x6 #(16,6) M0(.data_in(data_in),.addr(addr),.clk(clk),.data_out(dout0),.we(en[0]));
	SRAM_16x6 #(16,6) M1(.data_in(data_in),.addr(addr),.clk(clk),.data_out(dout1),.we(en[1]));
	SRAM_16x6 #(16,6) M2(.data_in(data_in),.addr(addr),.clk(clk),.data_out(dout2),.we(en[2]));
	SRAM_16x6 #(16,6) M3(.data_in(data_in),.addr(addr),.clk(clk),.data_out(dout3),.we(en[3]));
	
	always @*
	case(page)
		0:data_out = dout0;
		1:data_out = dout1;
		2:data_out = dout2;
		3:data_out = dout3;
	endcase
	
endmodule
	
	
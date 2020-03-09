module lab7_rom
#(parameter DATA_WIDTH=4, parameter ADDR_WIDTH=6)
(   input                           clk,
    input     [(ADDR_WIDTH-1):0]    addr,
    output    [(DATA_WIDTH-1):0]    data_out,
    output    [(ADDR_WIDTH-1):0]    addr_out
);
	
    wire w_clk = ~ clk;
    reg [16:0] addr_reg;
	 reg [31:0] data_reg;
    altera_flash altera_flash(.clock(clk), 
		.avmm_data_read(1),
		.avmm_data_addr(addr_reg),
		.avmm_data_readdata(data_reg));
	 
	 
    
    always @ (posedge w_clk)
    begin
       addr_reg <= addr;
    end
     
    assign data_out = data_reg[5:0];
    assign addr_out = addr_reg;
endmodule


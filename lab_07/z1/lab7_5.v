module lab7_5
#(
	parameter DATA_WIDTH=8, 
	parameter ADDR_WIDTH=12
)
(
    input                          clk,
	input                          rst_n, 
    input      [9:0]               SW,
    output     [7:0]               HEX0,
    output     [7:0]               HEX1,
    output     [7:0]               HEX2,
    output     [7:0]               HEX3,
    output     [7:0]               HEX4,
    output     [7:0]               HEX5
);

	wire       [3:0]               w_we;          //DC output for write enable
	wire	   [(DATA_WIDTH-1):0]  data_in_reg;   //data_in register output
	wire	   [(ADDR_WIDTH-1):0]  read_addr_reg; //read_addr register output
	wire	   [(ADDR_WIDTH-1):0]  write_addr_reg;//write_addr register output
	wire	   [(DATA_WIDTH-1):0]  data_out;      //memory output
	
	dc2 dc2in4 (.a(SW[9:8]), .dc_out(w_we[3:0]));
	assign HEX0[7] = ~w_we[0];
	assign HEX1[7] = ~w_we[0];
	assign HEX2[7] = ~w_we[3];
	assign HEX3[7] = ~w_we[3];
	assign HEX4[7] = ~w_we[1];
	assign HEX5[7] = ~w_we[2];
	
	
	register #(8) register_data_in (.ena(w_we[0]), .clk(clk), .rst_n(rst_n), .d(SW[7:0]), .q(data_in_reg));
	register #(4) register_read_addr (.ena(w_we[1]), .clk(clk), .rst_n(rst_n), .d(SW[3:0]), .q(read_addr_reg));
	register #(4) register_write_addr (.ena(w_we[2]), .clk(clk), .rst_n(rst_n), .d(SW[3:0]), .q(write_addr_reg));
	
	hexto7segment hexto7segment_data_in0 (.in_hex(data_in_reg[3:0]), .out_7seg(HEX0[6:0]));
	hexto7segment hexto7segment_data_in1 (.in_hex(data_in_reg[7:4]), .out_7seg(HEX1[6:0]));
	hexto7segment hexto7segment_data_out0 (.in_hex(data_out[3:0]), .out_7seg(HEX2[6:0]));
	hexto7segment hexto7segment_data_out1 (.in_hex(data_out[7:4]), .out_7seg(HEX3[6:0]));
	hexto7segment hexto7segment_read_addr (.in_hex(read_addr_reg), .out_7seg(HEX4[6:0]));
	hexto7segment hexto7segment_write_addr (.in_hex(write_addr_reg), .out_7seg(HEX5[6:0]));
	
	dual_port_RAM #(DATA_WIDTH,ADDR_WIDTH) dual_port_RAM 
	(
		.we(w_we[3]), 
		.clk(clk), 
		.data_in(data_in_reg), 
		.read_addr(read_addr_reg),
		.write_addr(write_addr_reg),
		.data_out(data_out)
	);
	
endmodule


module bn_mux_n_1_generate 
#( parameter  DATA_WIDTH = 2,
   parameter  SEL_WIDTH   = 2) 
(
    input   [((2**SEL_WIDTH)*DATA_WIDTH)-1:0] data,
    input   [SEL_WIDTH-1:0]                   sel,   
    output  [DATA_WIDTH-1:0]                  y
);

wire    [DATA_WIDTH-1:0] tmp_array [0:(2**SEL_WIDTH)-1];

genvar i;
generate
    for(i=0; i<2**SEL_WIDTH; i=i+1) 
    begin: gen_array
        assign  tmp_array[i] = data[((i+1)*DATA_WIDTH)-1:(i*DATA_WIDTH)];
    end
endgenerate

    assign  y =  tmp_array[sel];

endmodule

module lab5
(
	input        MAX10_CLK1_50,
    input  [1:0] KEY,
    input  [9:0] SW,
    output [9:0] LEDR
);
    parameter GROUP_COUNT = 2;
    parameter GROUP_WIDTH = 2;
    parameter WIDTH = GROUP_COUNT * GROUP_WIDTH;
    //WIDTH should be no more than 8

    wire [WIDTH - 1:0] x_bus, y_bus, z_bus_0, z_bus_1, z_bus;   
    wire carry_in_wire, carry_out_wire_0, carry_out_wire_1, carry_out_wire;
    
    assign reset = KEY[1];
    assign clock = MAX10_CLK1_50;

    //argument selector
    assign load_x =  SW[9] & ~KEY[0] ? 1'b1 : 1'b0;
    assign load_y = ~SW[9] & ~KEY[0] ? 1'b1 : 1'b0;
    
    //x synchronization
    register #(.WIDTH(WIDTH)) x_register
    (
        .clock   (clock      ),
        .reset   (reset      ),
        .load    (load_x     ),
        .data_in (SW[WIDTH:1]),
        .data_out(x_bus      )
    );
    
    //y synchronization
    register #(.WIDTH(WIDTH)) y_register
    (
        .clock   (clock      ),
        .reset   (reset      ),
        .load    (load_y     ),
        .data_in (SW[WIDTH:1]),
        .data_out(y_bus      )
    );
    
    //carry in synchronization
    unit_delay #(.WIDTH(1)) carry_in_register
    (
        .clock   (clock        ),
        .data_in (SW[ 0 ]      ),
        .data_out(carry_in_wire)
    );
    
    //adder
    group_ripple_carry_adder
    #(
        .GROUP_COUNT(GROUP_COUNT),
        .WIDTH      (GROUP_WIDTH)
    )
    i_RCA_0
    (
        .carry_in (0 ),
        .x        (x_bus         ),
        .y        (y_bus         ),
        .z        (z_bus_0       ),
        .carry_out(carry_out_wire_0)
    );
    
	 group_ripple_carry_adder
    #(
        .GROUP_COUNT(GROUP_COUNT),
        .WIDTH      (GROUP_WIDTH)
    )
    i_RCA_1
    (
        .carry_in (1 ),
        .x        (x_bus         ),
        .y        (y_bus         ),
        .z        (z_bus_1       ),
        .carry_out(carry_out_wire_1)
    );
	 
	 bn_mux_n_1_generate
	 #(
		.DATA_WIDTH(WIDTH),
		.SEL_WIDTH(1)
	 )
	 out_z_mux
	 (
		.data({z_bus_0, z_bus_1}),
		.sel(carry_in_wire),
		.y(z_bus)
	 );
 	 bn_mux_n_1_generate
	 #(
		.DATA_WIDTH(WIDTH),
		.SEL_WIDTH(1)
	 )
	 out_carry_mux
	 (
		.data({carry_out_wire_0, carry_out_wire_1}),
		.sel(carry_in_wire),
		.y(carry_out_wire)
	 );
	 
    //adder result synchronization
    unit_delay #(.WIDTH(WIDTH)) z_register
    (
        .clock   (clock    ),
        .data_in (z_bus    ),
        .data_out(LEDR[WIDTH - 1:0])
    );
    
    //carry out synchronization
    unit_delay #(.WIDTH(1)) carry_out_register
    (
        .clock   (clock         ),
        .data_in (carry_out_wire),
        .data_out(LEDR[9]       )
    ); 
        
    assign LEDR[8] = 0;
    
endmodule

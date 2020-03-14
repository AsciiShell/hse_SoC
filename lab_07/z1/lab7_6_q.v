module lab7_6_q

#(parameter DATA_WIDTH=8, parameter STACK_SIZE=256)

(
    input  clock,
    input  reset,
    input  push,
    input  pop,

    input  [DATA_WIDTH - 1:0] write_data,
    output reg [DATA_WIDTH - 1:0] read_data
);

    reg [DATA_WIDTH - 1:0] stack [0:STACK_SIZE - 1];
	
	// invert clk button
    wire w_clk = ~ clock;

    integer i;
	 reg [DATA_WIDTH - 1:0] pointerin;

    always @(posedge w_clk)
    begin
        if (reset)
        begin
				pointerin <= {DATA_WIDTH {1'b0}};
            for (i = 0; i < STACK_SIZE; i = i + 1)
                stack [i] <= 0;
        end
        else if (push)
        begin
            if (pointerin < 2**DATA_WIDTH - 1) begin
						stack[pointerin] <= write_data;
						pointerin <= pointerin + 1;
				end
				else
					stack[pointerin] <= write_data;
        end
        else if (pop)
        begin
            for (i = 0; i < STACK_SIZE - 1; i = i + 1)
                stack [i] <= stack [i + 1];

            stack [STACK_SIZE - 1] <= 0;
				read_data = stack [0];
        end
    end

endmodule
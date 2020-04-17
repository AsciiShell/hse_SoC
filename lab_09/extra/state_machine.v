module state_machine
#(
    parameter CNTSIZE = 5
)
(
	input clk,
	input rst_n,
	input enable,
	output result,
	output sck,
	output reg shape
);

wire [ CNTSIZE - 1:0] cnt;
wire [ CNTSIZE - 1:0] cntNext = cnt + 1;
register #(.SIZE(CNTSIZE)) r_counter(clk, rst_n, cntNext, cnt);
assign sck = cnt [CNTSIZE-1];

parameter [2:0] S0 = 0, A1 = 1, A2 = 2, A3 = 3, END = 4;

reg [2:0] state, next_state, next_out;

//reg 	;	
pisk pisk(clk,rst_n, shape, result);

// State register

always @ (posedge sck or negedge rst_n)
	if (! rst_n)
		state <= S0;
	else if (enable)
		state <= next_state;
		
reg [3:0] counter;

// Next state logic

always @ (posedge sck)
	case (state)
	S0:
		begin
			
			shape = 0;
			if (counter == 3) begin
				counter = 0;
				next_state = A1;
			end else 
			begin
				counter = counter + 1;
				next_state = S0;
			end
		end
		
	A1:
		begin
			shape = 1;
			if (counter == 3) begin
				counter = 0;
				next_state = A2;
			end else 
			begin
				counter = counter + 1;
				next_state = A1;
			end
		end
	A2:
		begin
			shape = 0;
			counter = 0;
			next_state = A3;
		end
		
	A3:
		begin
			shape = 1;
			if (counter == 5) begin
				counter = 0;
				next_state = S0;
			end else 
			begin
				counter = counter + 1;
				next_state = A3;
			end
		end
	
	default: begin
		next_state = S0;
		shape = 0;
		counter = 0;
		end
endcase

//always @ (posedge clock)
//begin
//	y <= next_out;
//end
endmodule
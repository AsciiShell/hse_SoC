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
	output reg shape,
	output reg [3:0] counter
);

wire [ CNTSIZE - 1:0] cnt;
wire [ CNTSIZE - 1:0] cntNext = cnt + 1;
register #(.SIZE(CNTSIZE)) r_counter(clk, rst_n, cntNext, cnt);
assign sck = cnt [CNTSIZE-1];

parameter [4:0] S0 = 0, A1 = 1, A2 = 2, A3 = 3, A4 = 4, A5 = 5,
					A6 = 6, A7 = 7, A8 = 8, A9 = 9, A10 = 10, A11 = 11,
					A12 =12, A13 = 13, A14 = 14, A15 = 15, A16 = 16, A17 = 17,
					A18 = 18, A19 = 19;

reg [4:0] state, next_state, next_out;

//reg 	;	
pisk pisk(clk,rst_n, shape, result);

// State register

always @ (posedge sck or negedge rst_n)
	if (! rst_n)
		state <= S0;
	else if (enable)
		state <= next_state;
		
parameter [3:0] dot = 4'b0001,
					 tire = 4'b0111,
					 delay = 4'b0001,
					 period = 4'b0111;
		
//reg [3:0] counter;

// Next state logic

always @ (posedge sck)
	case (state)
	S0:
		begin
			
			shape = 0;
			if (counter >= period) begin
				counter = 0;
				next_state = A1;
			end else 
			begin
				counter = counter + 1;
//				next_state = S0;
			end
		end
		
	A1:
		begin
			shape = 1;
			if (counter >= dot) begin
				counter = 0;
				next_state = A2;
			end else 
			begin
				counter = counter + 1;
//				next_state = A1;
			end
		end
	A2:
		begin
			shape = 0;
			if (counter >= delay) begin
				counter = 0;
				next_state = A3;
			end else 
			begin
				counter = counter + 1;
//				next_state = A3;
			end
		end
		
	A3:
		begin
			shape = 1;
			if (counter >= dot) begin
				counter = 0;
				next_state = A4;
			end else 
			begin
				counter = counter + 1;
//				next_state = A3;
			end
		end
		
	A4:
		begin
			shape = 0;
			if (counter >= delay) begin
				counter = 0;
				next_state = A5;
			end else 
			begin
				counter = counter + 1;
//				next_state = A3;
			end
		end
		
	A5:
		begin
			shape = 1;
			if (counter >= dot) begin
				counter = 0;
				next_state = A6;
			end else 
			begin
				counter = counter + 1;
//				next_state = A3;
			end
		end
	A6:
		begin
			shape = 0;
			if (counter >= period) begin
				counter = 0;
				next_state = A7;
			end else 
			begin
				counter = counter + 1;
//				next_state = A3;
			end
		end
		
	A7:
		begin
			shape = 1;
			if (counter >= tire) begin
				counter = 0;
				next_state = A8;
			end else 
			begin
				counter = counter + 1;
//				next_state = A3;
			end
		end
		
	A8:
		begin
			shape = 0;
			if (counter >= delay) begin
				counter = 0;
				next_state = A9;
			end else 
			begin
				counter = counter + 1;
//				next_state = A3;
			end
		end
		
	A9:
		begin
			shape = 1;
			if (counter >= tire) begin
				counter = 0;
				next_state = A10;
			end else 
			begin
				counter = counter + 1;
//				next_state = A3;
			end
		end
		
	A10:
		begin
			shape = 0;
			if (counter >= delay) begin
				counter = 0;
				next_state = A11;
			end else 
			begin
				counter = counter + 1;
//				next_state = A3;
			end
		end
		
	A11:
		begin
			shape = 1;
			if (counter >= tire) begin
				counter = 0;
				next_state = A12;
			end else 
			begin
				counter = counter + 1;
//				next_state = A3;
			end
		end
		
	A12:
		begin
			
			shape = 0;
			if (counter >= period) begin
				counter = 0;
				next_state = A13;
			end else 
			begin
				counter = counter + 1;
//				next_state = S0;
			end
		end
		
	A13:
		begin
			shape = 1;
			if (counter >= dot) begin
				counter = 0;
				next_state = A14;
			end else 
			begin
				counter = counter + 1;
//				next_state = A1;
			end
		end
	A14:
		begin
			shape = 0;
			if (counter >= delay) begin
				counter = 0;
				next_state = A15;
			end else 
			begin
				counter = counter + 1;
//				next_state = A3;
			end
		end
		
	A15:
		begin
			shape = 1;
			if (counter >= dot) begin
				counter = 0;
				next_state = A16;
			end else 
			begin
				counter = counter + 1;
//				next_state = A3;
			end
		end
		
	A16:
		begin
			shape = 0;
			if (counter >= delay) begin
				counter = 0;
				next_state = A17;
			end else 
			begin
				counter = counter + 1;
//				next_state = A3;
			end
		end
		
	A17:
		begin
			shape = 1;
			if (counter >= dot) begin
				counter = 0;
				next_state = A18;
			end else 
			begin
				counter = counter + 1;
//				next_state = A3;
			end
		end
	A18:
		begin
			
			shape = 0;
			if (counter >= period) begin
				counter = 0;
				next_state = A19;
			end else 
			begin
				counter = counter + 1;
//				next_state = S0;
			end
		end
	A19:
		begin
			
			shape = 0;
			if (counter >= period) begin
				counter = 0;
				next_state = S0;
			end else 
			begin
				counter = counter + 1;
//				next_state = S0;
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
module extra
(
	input clock,
	input reset_n,
	input enable,
	input [1:0] a,
	output reg [1:0] y
);

parameter [1:0] S0 = 0, S1 = 1, S2 = 2, S3 = 3;
parameter [1:0] A0 = 0, A1 = 1, A2 = 2, A3 = 3;
parameter [1:0] Y0 = 0, Y1 = 1, Y2 = 2, Y3 = 3;

reg [1:0] state, next_state, next_out;

// State register

always @ (posedge clock or negedge reset_n)
	if (! reset_n)
		state <= S0;
	else if (enable)
		state <= next_state;

// Next state logic

always @*
	case (state)
	S0:
		case(a)
		A0: begin
			next_state = S0;
			next_out = Y0;
		end
		A1: begin
			next_state = S1;
			next_out = Y0;
		end
		A2: begin
			next_state = S0;
			next_out = Y1;
		end
		A3: begin
			next_state = S2;
			next_out = Y3;
		end
		default: begin
			next_state = S0;
			next_out = Y0;
			end
		endcase
	S1:
		case(a)
		A0: begin
			next_state = S1;
			next_out = Y1;
		end
		A1: begin
			next_state = S1;
			next_out = Y2;
		end
		A2: begin
			next_state = S1;
			next_out = Y3;
		end
		A3: begin
			next_state = S2;
			next_out = Y1;
		end
		default: begin
			next_state = S0;
			next_out = Y0;
		end
		endcase
	S2:
		case(a)
		A0: begin
			next_state = S0;
			next_out = Y1;
		end
		A1: begin
			next_state = S2;
			next_out = Y2;
		end 
		A2: begin
			next_state = S0;
			next_out = Y0;
		end
		A3: begin
			next_state = S3;
			next_out = Y0;
		end 
		default: begin
			next_state = S0;
			next_out = Y0;
		end
		endcase
	S3:
		case(a)
		A0: begin
			next_state = S2;
			next_out = Y1;
		end
		A1: begin
			next_state = S0;
			next_out = Y2;
		end 
		A2: begin
			next_state = S0;
			next_out = Y3;
		end
		A3: begin
			next_state = S3;
			next_out = Y1;
		end
		default: begin
			next_state = S0;
			next_out = Y0;
		end
		endcase
	default: begin
		next_state = S0;
		next_out = Y0;
		end
endcase

always @ (posedge clock)
begin
	y <= next_out;
end
endmodule
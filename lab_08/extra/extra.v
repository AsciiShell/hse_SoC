module extra
(
input clock,
input reset_n,
input enable,
input a0,
input a1,
input a2,
input a3,
output reg [3:0] y
);

parameter [1:0] S0 = 0, S1 = 1, S2 = 2, S3 = 3;

reg [1:0] state, next_state;

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
		if (a0 | a3)
			next_state = S3;
		else
			next_state = S2;
	S1:
		if (a0 | a2)
			next_state = S2;
		else if (a1)
			next_state = S3;
		else
			next_state = S1;
	S2:
		if (a0 | a3)
			next_state = S1;
		else if (a1)
			next_state = S0;

		else
			next_state = S2;
	S3:
		if (a0 | a1)
			next_state = S1;
		else if (a2 | a3)
			next_state = S2;
	default:
		next_state = S0;

endcase

always @ (posedge clock)
	case (state)
		S0: y[0] <= 1;
		S1: y[1] <= 1;
		S2: y[2] <= 1;
		S3: y[3] <= 1;
		default:
			y <= 4'b0000;
	endcase
endmodule
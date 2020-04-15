case(State) 
	S_IDLE    : begin 
					if(cnt == IDLE_SIZE) begin
						State <= S_PREFIX;
						cs <= 1'b0;
					end
					cnt <= (cnt == IDLE_SIZE) ? 0 : cnt + 1;
				end
	S_PREFIX  : begin 
					if(cnt == PREFIX_SIZE) State <= S_DATA;
					cnt <= (cnt == PREFIX_SIZE) ? 0 : cnt + 1;
				end
	S_DATA    : begin 
					if(cnt == DATA_SIZE) State <= S_POSTFIX;
					cnt <= (cnt == DATA_SIZE) ? 0 : cnt + 1;
					buffer <= { buffer[6:0], sdo };
				end
	S_POSTFIX : begin 
					if(cnt == POSTFIX_SIZE) begin
						State <= S_IDLE;
						cs <= 1'b1;
					end
					cnt <= (cnt == POSTFIX_SIZE) ? 0 : cnt + 1;
					value <= buffer;
				end
endcase
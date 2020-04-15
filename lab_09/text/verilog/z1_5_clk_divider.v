case(State) 
	S_DOWN : begin 
				if(cnt == DOWN_SIZE) begin
					State <= S_EDGE;
					sck_edge <= 1'b1;
					sck <= 1'b1;
				end
				cnt <= (cnt == DOWN_SIZE) ? 0 : cnt + 1;
			 end
	S_EDGE : begin 
				State <= S_UP; 
				cnt <= 0;
				sck_edge <= 1'b0;
			 end
	S_UP   : begin 
				if(cnt == UP_SIZE) begin
					State <= S_DOWN;
					sck <= 1'b0;
				end
				cnt <= (cnt == UP_SIZE) ? 0 : cnt + 1;
			 end
endcase
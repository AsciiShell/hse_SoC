module lab7_7_q

#(
	parameter DATA_WIDTH=8, 
	parameter PTR_WIDTH=256
)

(
    input  clock,
    input  rst_n,
    input  push,
    input  pop,

    input  [DATA_WIDTH - 1:0] write_data,
    output reg [DATA_WIDTH - 1:0] read_data
);

    reg [DATA_WIDTH - 1:0] stack [0:2**PTR_WIDTH - 1];
	reg [PTR_WIDTH - 1:0] pointerin;
	reg [PTR_WIDTH - 1:0] pointerout;

 
	always @(posedge clock or negedge rst_n) 
	  begin
		if (!rst_n) begin
			pointerin <= {PTR_WIDTH {1'b0}};
			pointerout <= {PTR_WIDTH {1'b0}};
		end
		else case ( {push, pop} )
			2'b10:  begin
				if (pointerout - pointerin != 1) begin
						stack[pointerin] <= write_data;
						pointerin <= pointerin + 1;
						if (pointerin == 2**PTR_WIDTH) begin
							pointerin <= {PTR_WIDTH {1'b0}};
						end
					end
				else
					stack[pointerin] <= write_data;
				end
			2'b01: begin 
				if (pointerout - pointerin != 0) begin
					read_data <= stack [pointerout+1];
					pointerout <= pointerout + 1;
					if (pointerout == 2**PTR_WIDTH) begin
						pointerout <= {PTR_WIDTH {1'b0}};
					end
				end
				else
					read_data <= 0;
				end
			default: read_data <= stack [pointerout];
			endcase
		end
	
endmodule




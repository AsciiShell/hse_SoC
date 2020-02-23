module b2_mux_3_1_ifx_correct
(
   input      [1:0] d0, d1, d2, 
   input      [1:0] sel,
   output reg [1:0] y
);
   always @(*)
	begin
		if(sel == 2'b00)
			y = d0;
		else
		begin
			if(sel == 2'b01)
				y = d1;
			else 
			begin
				if(sel == 2'b10)
					y = d2;
				else
					y = 2'bxx;
			end
		end
	end
endmodule

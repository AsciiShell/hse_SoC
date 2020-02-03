module dff_with_en_sync
(
	input clk,
	input en,
	input n_rst,
	input rst_n,
   input d,
   output reg q
);
	
	wire a = en & n_rst;
  
	always @(posedge clk or posedge a)
	begin
		if (a)
		begin
			q <= 1'b0;
		end
		else begin
			if(rst_n & en)begin
				q <= 1'b0;
			end
			else if (en)
				q <= d;
		end
	end


endmodule

module dff_with_en_sync
(
	input clk,
	input en,
	input n_rst,
	input rst_n,
   input d,
   output reg q
);
	
	assign a = en & (rst_n | n_rst);
  
	always @(posedge clk or posedge n_rst)
begin
	// The reset signal overrides the hold signal; reset the value to 0
	if (a)
	begin
		q <= 1'b0;
	end
	// Otherwise, change the variable only when updates are enabled
	else if (en)
	begin
		q <= d;
	end
end

//  always @() 
//  begin
//
//		a = 
//		if (a)
//			q = 0;
//		else
//			if (en)
//				
//end
endmodule

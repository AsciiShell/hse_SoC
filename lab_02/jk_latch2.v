module jk_latch2
(
	input j,
	input k,
	input clk,
   output reg q
);

  always @(clk or j or k) 
  if(clk)
	begin
	if (j && k) q <=  ~ q;
	else if (j && ~k) q <= 1;
	else if (~j && k) q <= 0;
	end
endmodule
	
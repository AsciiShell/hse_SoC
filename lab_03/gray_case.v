module gray_case(
   input [15:0] encoder_in,
   output reg [3:0] binary_out,
   input enable
);


	always @ (*)
	begin
		binary_out = 0;
		if (enable) begin
			case (encoder_in)
				16'h1    : binary_out = 4'b0000;
				16'h2    : binary_out = 4'b0001;
				16'h4    : binary_out = 4'b0011;
				16'h8    : binary_out = 4'b0010;
				16'h10   : binary_out = 4'b0110;
				16'h20   : binary_out = 4'b0111;
				16'h40   : binary_out = 4'b0101;
				16'h80   : binary_out = 4'b0100;
				16'h100  : binary_out = 4'b1100;
				16'h200  : binary_out = 4'b1101;
				16'h400  : binary_out = 4'b1111;
				16'h800  : binary_out = 4'b1110;
				16'h1000 : binary_out = 4'b1010;
				16'h2000 : binary_out = 4'b1011;
				16'h4000 : binary_out = 4'b1001;
				16'h8000 : binary_out = 4'b1000;
			endcase
	end
 end

 endmodule
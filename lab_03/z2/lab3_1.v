
module lab3_1
(
    input   [ 1:0]  KEY,
    input   [ 9:0]  SW,
    output  [ 9:0]  LEDR
);

	timeQuest_wrapper(KEY[1],SW,LEDR,KEY[0]);

//	b1_enc_assign (SW,LEDR,KEY[0]);
//	b2_enc_if (SW,LEDR,KEY[0]);
//	b3_enc_case (SW,LEDR,KEY[0]);
//	b4_pri_enc_if (SW,LEDR,KEY[0]);
//	b5_pri_enc_assign (SW,LEDR,KEY[0]);
//	b12_anybit_enc (SW,LEDR,KEY[0]);
	
endmodule

module timeQuest_wrapper(clock,SW,LED,enable);
	input clock,enable;
	input [9:0] SW;
	output [3:0] LED;
 
	reg [9:0] SW_reg;
	reg [3:0] LED_reg; // registers for 'catching' time
 
	wire [3:0] LED_wire;
	wire [9:0] SW_wire;
	assign SW_wire = SW_reg;
	
//	b1_enc_assign (SW_reg,LED_wire,enable);
//	b2_enc_if (SW_reg,LED_wire,enable);
	b3_enc_case (SW_reg,LED_wire,enable);
//	b4_pri_enc_if (SW_reg,LED_wire,enable);
//	b5_pri_enc_assign (SW_reg,LED_wire,enable);
//	b12_anybit_enc (SW_reg,LED_wire,enable);

	always @(posedge clock)
		begin
			SW_reg <= SW; // avoiding race and latch by setting '<=' instead of '='
			LED_reg<=LED_wire;
		end
	assign LED = LED_reg;
endmodule
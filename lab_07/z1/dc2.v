module dc2
(
   input      [1:0]               a,
   output reg [3:0]               dc_out
);

always @a
    case (a)
        2'b00	:	dc_out = 4'b0001;
        2'b01	:	dc_out = 4'b0010;
        2'b10	:	dc_out = 4'b0100;
        2'b11	:	dc_out = 4'b1000;
    endcase
endmodule

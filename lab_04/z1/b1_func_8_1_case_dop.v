module b1_func_8_1_case_dop
(
    input  [2:0] sel,
    output reg y
);
    always @(*)
        case (sel)
        3'b000: y = 1'b0;
        3'b001: y = 1'b1;
        3'b010: y = 1'b1;
        3'b011: y = 1'b0;
		  3'b100: y = 1'b1;
        3'b101: y = 1'b1;
        3'b110: y = 1'b1;
        3'b111: y = 1'b0;
        endcase
endmodule
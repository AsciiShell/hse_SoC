module b1_mux_4_1_case_nili
(
    input      [1:0] sel,
    output reg y
);
    always @(*)
        case (sel)
        2'b00: y = 1'b1;
        2'b01: y = 1'b0;
        2'b10: y = 1'b0;
        2'b11: y = 1'b0;
        endcase
endmodule
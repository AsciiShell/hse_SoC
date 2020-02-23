module b1_mux_2_1_case
(
    input      d0, d1,
    input      sel,
    output reg y
);
    always @(*)
        case (sel)
        2'b0: y = d0;
        2'b1: y = d1;
        endcase
endmodule
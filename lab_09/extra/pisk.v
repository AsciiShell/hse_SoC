//Переводит форму сигнала в частоту для пьезоизлучателя

module pisk
#(
    parameter CNTSIZE = 3
)
(
    input             clk,
    input             rst_n,
    input            enabled,
	 output 				sck
);
    wire [ CNTSIZE - 1:0] cnt;
    wire [ CNTSIZE - 1:0] cntNext = cnt + 1;
    register #(.SIZE(CNTSIZE)) r_counter(clk, rst_n, cntNext, cnt);

    assign sck = cnt [CNTSIZE-1] & enabled;
endmodule

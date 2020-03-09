//module register
//#(
//    parameter SIZE = 4
//)
//(
//    input                          ena, 
//    input                          clk,
//    input      [SIZE - 1 : 0]      d,
//    output reg [SIZE - 1 : 0]      q
//);
//    always @ (posedge clk)
//	if (ena) 
//            q <= d;
//endmodule   

module register
#(
    parameter SIZE = 4
)
(
    input                          ena, 
    input                          clk,
	input                          rst_n,
    input      [SIZE - 1 : 0]      d,
    output reg [SIZE - 1 : 0]      q
);
    always @ (posedge clk or negedge rst_n)
        if (! rst_n)
            q <= {SIZE {1'b0}};
        else if (ena)
            q <= d;
endmodule
//ALU commands
`define ALU_AND 3'b000
`define ALU_OR  3'b001

`define ALU_ADD 3'b010
`define ALU_SUB 3'b011

`define ALU_SLL 3'b100
`define ALU_SRL 3'b101

`define ALU_LE  3'b110
`define ALU_GT  3'b111

module alu
#(
    parameter WIDTH = 4,
    parameter SHIFT = 2
)
(
    input      [WIDTH - 1:0] x, y,
    input      [SHIFT - 1:0] shamt,
    input      [ 2:0]        operation,
    output                   zero,
	 output reg               overflow,
    output reg [WIDTH - 1:0] result
);

    always @ (*) begin
        case (operation)
            `ALU_AND : result = x & y; 
				`ALU_OR  : result = x | y;
            `ALU_ADD : {overflow, result} = x + y;
				`ALU_SUB : {overflow, result} = x - y;
            `ALU_SLL : result = y << shamt;
				`ALU_SRL : result = y >> shamt;
            `ALU_LE  : result = (x < y) ? 1 : 0;
				`ALU_GT  : result = (x > y) ? 1 : 0;
				default: result = {WIDTH{1'bx}};
        endcase
    end

    //Flags
    assign zero      = (result == 0);

endmodule
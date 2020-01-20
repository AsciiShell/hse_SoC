
module lab1
(
    input  [3:0] SW,  
    output LED 
);

    wire a = SW [0];
    wire b = SW [1];
    wire c = SW [2];
	 wire d = SW [3];

	 assign LED = ~ ((~ (a | b)) | (a & c)) | ((~a) & (~b) & (~c) & (~d));
    
endmodule

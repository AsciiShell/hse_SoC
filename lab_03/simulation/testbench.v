`timescale 1 ns / 100 ps
module testbench;
    reg  enable;
    reg [15:0] binary;
    wire [3:0] binary_out; 
    gray_case gray_case(binary,binary_out,enable);

	initial 
    begin
        enable = 1;
        binary = 0;
		
        #1;  binary=16'b0000000000000001;
        #1;  binary=16'b0000000000000010;
        #1;  binary=16'b0000000000000100;
        #1;  binary=16'b0000000000001000;
        #1;  binary=16'b0000000000010000;
        #1;  binary=16'b0000000000100000;
        #1;  binary=16'b0000000001000000;
        #1;  binary=16'b0000000010000000;
        #1;  binary=16'b0000000100000000;
		#1;  binary=16'b0000001000000000;
        #1;  binary=16'b0000010000000000;
        #1;  binary=16'b0000100000000000;
		#1;  binary=16'b0001000000000000;
        #1;  binary=16'b0010000000000000;
        #1;  binary=16'b0100000000000000;
        #1;  binary=16'b1000000000000000;
        #1;  binary=16'b0100000000000000;
           enable = 0;


    end
    initial 
         $monitor("enable=%b, binary=%b, binary_out=%b",
            enable, binary, binary_out);
    initial 
        $dumpvars;  
endmodule

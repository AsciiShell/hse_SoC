module testbench;

    reg  [3:0] sw;
    wire led;

    lab1 dut ( sw, led );

    initial 
        begin
			sw = 4'b0000;
			#10;
			sw = 4'b0001;
			#10;
			sw = 4'b0010;
			#10;
			sw = 4'b0011;
			#10;
			sw = 4'b0100;
			#10;
			sw = 4'b0101;
			#10;
			sw = 4'b0110;
			#10;
			sw = 4'b0111;
			#10;
			sw = 4'b1000;
			#10;
			sw = 4'b1001;
			#10;
			sw = 4'b1010;
			#10;
			sw = 4'b1011;
			#10;
			sw = 4'b1100;
			#10;
			sw = 4'b1101;
			#10;
			sw = 4'b1110;
			#10;
			sw = 4'b1111;
			#10;
        end
    initial 
        $monitor("sw=%b led=%b", sw, led);

    initial 
        $dumpvars;  //iverilog dump init

endmodule

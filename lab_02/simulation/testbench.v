`timescale 1 ns / 100 ps

module testbench;

    reg  j, k, ck;
    wire q, q_n;

    jk_latch jk_latch (.j(j), .k(k), .ck(ck), .q(q), .(q_n));
    
	
	
    initial $dumpvars;

    initial
    begin
		ck = 0;
		forever
			#2 ck = ~ck;
		end
			
        $monitor ("%0d j %b k %b ck %b q %b q_n %b", $time, j, k, ck, q, q_n);
		
        # 10;   j = 0; k = 0;
        # 10;   j = 1; k = 0;
        # 10;   j = 0; k = 0;
        # 10;   j = 0; k = 1;
        # 10;   j = 0; k = 0;
        # 10;   j = 1; k = 1;
        # 10;   j = 0; k = 0;
        # 10;   j = 0; k = 0;
        # 10;

        $finish;
    end

endmodule

module hexto7segment
(
    input      [3:0]               in_hex,
    output reg [6:0]               out_7seg
);

always @in_hex
    case (in_hex)
        4'b0000 :             //Digit 0
            out_7seg = 7'b1000000;
        4'b0001 :            //Digit 1
            out_7seg = 7'b1111001  ;
        4'b0010 :            //Digit 2
            out_7seg = 7'b0100100 ; 
        4'b0011 :             //Digit 3
            out_7seg = 7'b0110000 ;
        4'b0100 :            //Digit 4
            out_7seg = 7'b0011001 ;
        4'b0101 :            //Digit 5
            out_7seg = 7'b0010010 ;  
        4'b0110 :            //Digit 6
            out_7seg = 7'b0000010 ;
        4'b0111 :            //Digit 7
            out_7seg = 7'b1111000;
        4'b1000 :            //Digit 8
            out_7seg = 7'b0000000;
        4'b1001 :            //Digit 9
            out_7seg = 7'b0011000 ;
        4'b1010 :            //Digit A
            out_7seg = 7'b0001000 ; 
        4'b1011 :            //Digit B
            out_7seg = 7'b0000011;
        4'b1100 :            //Digit C
            out_7seg = 7'b1000110 ;
        4'b1101 :            //Digit D
            out_7seg = 7'b0100001 ;
        4'b1110 :            //Digit E
            out_7seg = 7'b0000110 ;
        4'b1111 :            //Digit F
            out_7seg = 7'b0001110 ;
    endcase
endmodule
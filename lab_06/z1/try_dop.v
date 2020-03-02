module try_dop
#(
  parameter WIDTH = 8
  )
 (
  input                      clk,
  input                      rst_n,
  input                      enable,
  output  [WIDTH - 1 : 0] bin_inc 
 );

  reg [WIDTH - 1 : 0]       bin;
  
  always@(posedge clk or negedge rst_n)
    if(!rst_n)begin
      bin  <= 0;
    end
    else if(enable)begin
      bin  <= bin_inc;
    end
  

  assign bin_inc = bin + 8'b00100000 + 8'b00000010 - 8'b00000001 - 8'b01000000;
  
  
endmodule 
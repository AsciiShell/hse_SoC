module dual_port_RAM
#(parameter DATA_WIDTH=8, parameter ADDR_WIDTH=12)
(
    input                          we, 
    input                          clk,
    // Read port:
    input      [(DATA_WIDTH-1):0]  data_in,
    input      [(ADDR_WIDTH-1):0]  read_addr, 
    // Write port:
    input      [(ADDR_WIDTH-1):0]  write_addr,
    output reg [(DATA_WIDTH-1):0]  data_out
);
    // Declare the array variable
    reg [DATA_WIDTH-1:0] dp_ram [0:2**ADDR_WIDTH-1];
    
    always @ (posedge clk)
    begin
        // Write
        if (we)
            dp_ram [write_addr] <= data_in;
 
         // Read
        data_out <= dp_ram [read_addr];
    end
endmodule
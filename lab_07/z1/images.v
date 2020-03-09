module images
#(parameter DATA_WIDTH=8)
(
    input        MAX10_CLK1_50,
    input  [1:0] KEY,
    input  [9:0] SW,
    output reg [9:0] LEDR
);

reg [7:0] data;
wire [7:0] data_out;
reg [15:0] addr, addr_out;
reg we;
wire clk;

assign clk = ~ KEY[0];

dual_port_RAM #(8,15) dual_port_RAM(
					.we(we),
					.clk(clk),
					.data_in(data),
					.read_addr(addr),
					.write_addr(addr_out),
					.data_out(data_out));
//запись данных и адреса
always @ (*)
begin
	if (SW[9]) begin //запись адреса
		if (SW[8]) begin
			addr[14:8] = SW[6:0];
		end
		else begin
			addr[7:0] = SW[7:0];
		end
		
	end
	else begin //запись data
		data[7:0] = SW[7:0];
	end
	
end

//изменение we
always @ (negedge KEY[1])
begin
	if (we) begin
		we = 0;
		LEDR[9] = 0;
	end
	else begin
		we = 1;
		LEDR[9] = 1;
	end
end

//вывод результатов
always @ (*)
begin
	if (we) begin
				case (SW[9:8])
					2'b00    :    LEDR[7:0] = data[7:0];
					2'b10    :    LEDR[7:0] = addr[7:0];
					2'b11    :    LEDR[7:0] = addr[15:8];
					default	 :   LEDR[7:0] = 8'b1;
				endcase
		end
		else begin
				case (SW[9:8])
					2'b00    :    LEDR[7:0] = data_out[7:0];
					2'b10    :    LEDR[7:0] = addr_out[7:0];
					2'b11    :    LEDR[7:0] = addr_out[15:8];
					default	 :   LEDR[7:0] = 8'b1;
				endcase
		end
end

endmodule
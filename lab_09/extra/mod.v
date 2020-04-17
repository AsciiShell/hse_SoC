//
////перевод кода символа в форму сигнала
//
//module mod
//#(
//    parameter CNTSIZE = 26,
//	 parameter wordsize = 5
//)
//(
//    input             		clk,
//    input             		rst_n,
//	 input  					[wordsize - 1:0] letter,
//    input            		cs,
//    output            		sck,
//    output				 		result
//);
//
//	reg shape;	
//	pisk pisk(clk,rst_n,shape, result);
//	
//   wire [ CNTSIZE - 1:0] cnt;
//   wire [ CNTSIZE - 1:0] cntNext = cnt + 1;
//   register #(.SIZE(CNTSIZE)) r_counter(clk, rst_n, cntNext, cnt);
//	assign sck = cnt[CNTSIZE-1];
//
//	reg sck_edge;
//	wire [wordsize - 1:0] firstLet;
//   wire [wordsize - 1:0] let;
//	reg [wordsize - 1:0] letNext;
//	
//	register_we #(.SIZE(wordsize)) let_buffer(clk, rst_n, sck_edge, letNext, let);
//	
////	always @ (negedge cs) begin
////		for (i = 0; i < wordsize - 1; i = i + 1) begin
////				firstLet[i] = letter[i];
////		end
////		firstLet = letter;
////		letNext = letter;
////		
////		
////	end
//	
//	
//	integer i, count = 0;
//	
//	always @ (negedge sck)
//		sck_edge = 1;
//	 
//	always @ (posedge sck) begin
//		if (cs == 0) begin
//			sck_edge = 0;
//			case (count)
//				0:
//				begin			
//					if (let[0] == 1) 
//						count = 5;
//					else 
//						count = 1;
//					
//					letNext[wordsize -2:0] = let[wordsize-1:1];
//					
//					shape = 1;
//					
//				end
//					
//				1:
//				begin
//					shape = 0;
//					count = count - 1;
//				end
//				default:
//					count = count - 1;
//			endcase
//				
//		end else 
//			shape = 0;
//	end
//
//	
//
//endmodule

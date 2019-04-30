
	`timescale 1 us/100 ps
	
	
module ledMatrix_tb;	

	reg MCLK_sig = 1'b0;
	reg source_valid_sig = 1'b0;
	reg [23:0] F_BIN_IN_sig = 24'd0;
	reg RESET_sig = 1'b1;

	wire RGB1_sig;
	wire RGB2_sig; 
	wire ROW_ADDRESS_sig; 
	wire CLK_MATRIX_sig;
	wire LATCH_sig;
	wire OE_sig;
	wire GND_sig;
	
	ledMatrix ledMatrix_inst
(
	.MCLK(MCLK_sig) ,	// input  MCLK_sig
	.source_valid(source_valid_sig) ,	// input  source_valid_sig
	.F_BIN_IN(F_BIN_IN_sig) ,	// input [BIN_WDITH-1:0] F_BIN_IN_sig
	.RESET(RESET_sig) ,	// input  RESET_sig
	.RGB1(RGB1_sig) ,	// output [2:0] RGB1_sig
	.RGB2(RGB2_sig) ,	// output [2:0] RGB2_sig
	.ROW_ADDRESS(ROW_ADDRESS_sig) ,	// output [3:0] ROW_ADDRESS_sig
	.CLK_MATRIX(CLK_MATRIX_sig) ,	// output  CLK_MATRIX_sig
	.LATCH(LATCH_sig) ,	// output  LATCH_sig
	.OE(OE_sig) ,	// output  OE_sig
	.GND(GND_sig) 	// output [2:0] GND_sig
);

	
	reg [5:0] counter = 6'd0;
	
	initial begin
	
		RESET_sig = 0;
	
		repeat(10) @(posedge MCLK_sig); 
		
		RESET_sig = 1;


	end
	 
	
	always begin
	
		#0.01 MCLK_sig <= ~MCLK_sig; //50 MHZ 

		
	end
	
	 

	always @ (posedge MCLK_sig) begin
	
		if (RESET_sig) begin	
	
			counter <= counter + 1;
			
			if(counter == 0) begin
				source_valid_sig <= 1'b1;
				F_BIN_IN_sig <= F_BIN_IN_sig + 1;
			end
			else 
				source_valid_sig <= 1'b0;

		end
	
	end

	
	

endmodule
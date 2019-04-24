
	`timescale 1 us/100 ps
	
	
module ledMatrix_tb;	

	reg MCLK_sig = 1'b0;
	reg source_vaid_sig = 1'b0;
	reg [23:0] F_BIN_IN_sig = 24'd0;
	reg RESET_sig = 1'b1;
	
	ledMatrix ledMatrix_inst
(
	.MCLK(MCLK_sig) ,	// input  MCLK_sig
	.source_vaid(source_vaid_sig) ,	// input  source_vaid_sig
	.F_BIN_IN(F_BIN_IN_sig) ,	// input [BIN_WDITH-1:0] F_BIN_IN_sig
	.RESET(RESET_sig) ,	// input  RESET_sig
	.R1(R1_sig) ,	// output  R1_sig
	.G1(G1_sig) ,	// output  G1_sig
	.B1(B1_sig) ,	// output  B1_sig
	.R2(R2_sig) ,	// output  R2_sig
	.G2(G2_sig) ,	// output  G2_sig
	.B2(B2_sig) ,	// output  B2_sig
	.A(A_sig) ,	// output  A_sig
	.B(B_sig) ,	// output  B_sig
	.C(C_sig) ,	// output  C_sig
	.D(D_sig) ,	// output  D_sig
	.CLK_MATRIX(CLK_MATRIX_sig) ,	// output  CLK_MATRIX_sig
	.LATCH(LATCH_sig) ,	// output  LATCH_sig
	.OE(OE_sig) 	// output  OE_sig
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
				source_vaid_sig <= 1'b1;
				F_BIN_IN_sig <= F_BIN_IN_sig + 1;
			end
			else 
				source_vaid_sig <= 1'b0;

		end
	
	end

	
	

endmodule
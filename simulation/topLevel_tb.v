`timescale 1 us/100 ps
	
	
	
module topLevel_tb;	

	
	
	
	reg         AUD_BCLK_sig = 1'b0;
	wire        AUD_LRC_sig;
	reg 			MCLK_sig = 1'b0;
	reg         AUD_ADC_DATA_sig = 1'b0;
	reg 			RESET_sig = 1'b0;
	
	reg [5:0] 	bclk_counter = 6'd0;
	reg [4:0]	sample_value_bit_ctr = 5'd0; //Counts to 32
	reg [23:0] 	sample_value = 24'b0; 
	
	
	
	topLevel topLevel_inst
(
	.AUD_BCLK(AUD_BCLK_sig) ,	// input  AUD_BCLK_sig
	.MCLK(MCLK_sig) ,	// input  MCLK_sig
	.AUD_LRC(AUD_LRC_sig) ,	// input  AUD_LRC_sig
	.AUD_ADC_DATA(AUD_ADC_DATA_sig) ,	// input  AUD_ADC_DATA_sig
	.RESET(RESET_sig) // input  RESET_sig
		// output  b_sig
);
	
	initial begin
	
	RESET_sig = 1'b0;
	bclk_counter = 6'd0;
	AUD_BCLK_sig    = 1'b0;
	AUD_ADC_DATA_sig = 1'b0;
	sample_value_bit_ctr = 5'd0;
	

	repeat(10) @(negedge MCLK_sig);
	
	RESET_sig = 1; 
	
	end
	
	
	
	
	always begin

		//Bit clock signal for 48kHz LR clock, would be coming from codec
		 #162 AUD_BCLK_sig <= ~AUD_BCLK_sig;
		 
	end
	
	always begin
	
		//50MHZ clock signal from board 
		#0.01 MCLK_sig <= ~MCLK_sig;  

		
	end
	
	
	/***** Send Bitstream of I2S sample data to module ******/ 
	
	//Bits are sent on BCLK negedge
	always @ (negedge AUD_BCLK_sig) begin
	
		if(RESET_sig) begin
					
					if(sample_value_bit_ctr < 24) begin
				
						//Get current bit of ADC_DATA value, start left to right as MSB is sent first
						//Also just send same data on L & R frames 
						AUD_ADC_DATA_sig <= sample_value[(23 - sample_value_bit_ctr )];	
						
		
					end else begin
					
				
						AUD_ADC_DATA_sig <= 0;
		
					end
							

						sample_value_bit_ctr <= sample_value_bit_ctr + 5'd1;
						 
						bclk_counter <= bclk_counter + 6'd1;
					
					if (&sample_value_bit_ctr[4:0]) begin

						//sample_value = sample_value + 1;

					end
				 


		end
	
	end
	
	assign AUD_LRC_sig = bclk_counter[5];	
	
	/**** Increment sample value on every LRCLK ****/
	
	always @(negedge AUD_LRC_sig) begin
	
		sample_value <= sample_value + 1;
	
	
	end
	
	
	
	
	
	
	
	
	
	
	
	
endmodule
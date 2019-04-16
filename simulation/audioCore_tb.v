// Audio Interface

	`timescale 1 us/100 ps
	
	
module audioCore_tb;	


	reg         AUD_BCLK_sig;
	reg         AUD_ADC_DATA_sig;
	reg 			reset;
	
	reg [5:0] 	bclk_counter;
	reg [4:0]	sample_value_bit_ctr; //Counts to 32
	reg [23:0] 	sample_value = 24'b0; //Counts to 64
	
	wire        AUD_LRC_sig;
	
	
	wire 			LRC_OUT_sig;
	wire[23:0]  DATA_OUT_sig;
	
		audioCore audioCore_inst
	(
		.AUD_BCLK(AUD_BCLK_sig) ,	// input  AUD_BCLK_sig
		.AUD_LRC(AUD_LRC_sig) ,	// input  AUD_LRC_sig
		.AUD_ADC_DATA(AUD_ADC_DATA_sig) ,	// input  AUD_ADC_DATA_sig
		.reset(reset),							//input reset
		.LRC_OUT(LRC_OUT_sig) ,	// output  LRC_OUT_sig
		.DATA_OUT(DATA_OUT_sig) 	// output [23:0] DATA_OUT_sig
	);


	
	initial begin
	
	reset = 1'b0;
	bclk_counter = 6'd0;
	AUD_BCLK_sig    = 1'b0;
	AUD_ADC_DATA_sig = 1'b0;
	sample_value_bit_ctr = 5'd0;
	
	repeat(5) @(negedge AUD_BCLK_sig);
	
	reset = 1'b1;

	end
	
	
	
	 
	always begin

		//Bit clock signal for 48kHz LR clock
		 #162 AUD_BCLK_sig <= ~AUD_BCLK_sig;
		 
	end

	 

	always @ (negedge AUD_BCLK_sig) begin
	
		if(reset) begin
		
					
					if(sample_value_bit_ctr < 24) begin
				
						//Get current bit of ADC_DATA value, start left to right as MSB is sent first
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
	
	
	always @(negedge AUD_LRC_sig) begin
	
		sample_value <= sample_value + 1;
	
	
	end
	
	
	

	assign AUD_LRC_sig = bclk_counter[5];	

	endmodule
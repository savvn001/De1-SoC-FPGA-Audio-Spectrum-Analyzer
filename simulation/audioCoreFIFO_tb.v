// Audio Interface

	`timescale 1 us/100 ps
	
	
module audioCoreFIFO_tb;	


	reg         AUD_BCLK_sig;
	reg 			CLK_50_sig;
	wire 			CLK_48_sig;
	reg         AUD_ADC_DATA_sig;
	reg 			reset_sig;
	reg 			readEn_in_sig;
	reg 			writeEn_in_sig;
	reg 			clear_in_sig;
	
	wire[23:0]	aFIFO_out_sig;
	wire			emptyOut_sig;
	wire			fullOut_sig;
	
	
	reg [5:0] 	bclk_counter;
	reg [4:0]	sample_value_bit_ctr; //Counts to 32
	reg [23:0] 	sample_value = 24'b0; //Counts to 64
	

	


	
	audioCoreFIFO audioCoreFIFO_inst
	(
		.AUD_BCLK(AUD_BCLK_sig) ,	// input  AUD_BCLK_sig
		.MCLK(CLK_50_sig) ,	// input  MCLK_sig
		.AUD_LRC(CLK_48_sig) ,	// input  AUD_LRC_sig
		.AUD_ADC_DATA(AUD_ADC_DATA_sig) ,	// input  AUD_ADC_DATA_sig
		.reset(reset_sig) ,	// input  reset_sig
		.readEn_in(readEn_in_sig) ,	// input  readEn_in_sig
		.writeEn_in(writeEn_in_sig) ,	// input  writeEn_in_sig
		.clear_in(clear_in_sig) ,	// input  clear_in_sig
		.aFIFO_out(aFIFO_out_sig) ,	// output [23:0] aFIFO_out_sig
		.emptyOut(emptyOut_sig) ,	// output  emptyOut_sig
		.fullOut(fullOut_sig) 	// output  fullOut_sig
	);
	
	initial begin
	
	reset_sig = 1'b0;
	bclk_counter = 6'd0;
	AUD_BCLK_sig    = 1'b0;
	CLK_50_sig		 = 1'b0;
	AUD_ADC_DATA_sig = 1'b0;
	clear_in_sig = 1'b0;
	sample_value_bit_ctr = 5'd0;
	
	repeat(5) @(negedge AUD_BCLK_sig);
	
	reset_sig = 1'b1;
	
	writeEn_in_sig = 1'b1;
	readEn_in_sig = 1'b1;
	
	end
	
	
	
	 
	always begin

		//Bit clock signal for 48kHz LR clock
		 #162 AUD_BCLK_sig <= ~AUD_BCLK_sig; 
	end
	
	always begin
	
		#0.01 CLK_50_sig <= ~CLK_50_sig; //50 MHZ 

		
	end

	 

	always @ (negedge AUD_BCLK_sig) begin
	
		if(reset_sig) begin
		
					
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
	
	
	always @(negedge CLK_48_sig) begin
	
		sample_value <= sample_value + 1;
	
	
	end
	
	
	
	assign CLK_48_sig = bclk_counter[5];	

	endmodule
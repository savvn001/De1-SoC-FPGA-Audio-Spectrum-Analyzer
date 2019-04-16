module audioCore(


	input AUD_BCLK,		//Bit clock from codec
	input AUD_LRC,			//Left Right/Word Select/Frame Select Clock signal - 48kHz
	input AUD_ADC_DATA,	//ADC data from codec L/R interleaved
	input reset,
	
	output wire LRC_OUT,		//Output LR clock for FFT module
	output wire [23:0] DATA_OUT	//FIFO data output from core



);

	reg [23:0] left_data;
	reg [23:0] right_data;
	reg [23:0] data_output;
	reg AUD_LRC_EXT;
	
	reg [4:0] adcbitcntr32;
	
	wire LRCLK_posedge;
	
	/*This flags when LRCLK is high and LRCLK_EXT is low
	  which is when a pair of L & R samples are collected
	  and ready to be sent out. This also means output sample is
	  sent on rising edege of LRCLK which what FFT module wants
	*/
	assign LRCLK_posedge = AUD_LRC & !AUD_LRC_EXT;
	
	assign LRC_OUT = AUD_LRC;
	
	assign DATA_OUT = data_output;
	
	initial begin
			
		adcbitcntr32 = 5'd0;
		
	end

	
	//I2S data bits come in on negative edge of BCLK signal 
	always @(negedge AUD_BCLK) begin
	
		if(reset) begin
		
				if(adcbitcntr32 < 25) begin
					//Low half of LR clock is left channel data
					if(!AUD_LRC_EXT) //Use delayed clock, see below
						
							left_data <= {left_data[23:0], AUD_ADC_DATA};
					
					//High half of LR clock is right channel data
					else
							
							right_data <= {right_data[23:0], AUD_ADC_DATA};
				end			
				adcbitcntr32 <= adcbitcntr32 + 5'd1;
				
		end		
	end
	
	//Delay LR clock by 1 BCLK, as MSB comes 1 BCLK after LRCLK changes. See I2S spec
	always @(posedge AUD_BCLK) begin
	
			AUD_LRC_EXT <= AUD_LRC;
		
	end
		

	always @(posedge AUD_LRC) begin
	
		//if(reset) begin
		
			//left_data <= 24'd0;
			//right_data <= 24'd0;
			
		if(LRCLK_posedge) begin
		
			//Sum left and right channels to mono and divide by 2 (keep volume same)
			data_output = ((left_data + right_data) >> 1);
		
		end
		
		
	end






	




















endmodule
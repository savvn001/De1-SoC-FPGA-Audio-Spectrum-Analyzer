/* IP Core for interfacing with Wolfson WM8731 audio codec onboard
	De1-SoC board. Module simply receives I2S serial bitstream of left and right 
	samples and sums them, outputting this as a parallel bitstream sample which streams to 
	the FFT module.
	
	Nicholas Savva
	
*/


module audioCore(


	input AUD_BCLK,		//Bit clock from codec
	input MCLK,				//50MHZ clock from board 
	input AUD_LRC,			//Left Right/Word Select/Frame Select Clock signal - 48kHz
	input AUD_ADC_DATA,	//ADC data from codec L/R interleaved
	input reset,			//Reset - ACTIVE LOW
	
	output wire LRC_OUT,		//Output LR clock for FFT module
	output wire [23:0] DATA_OUT	//FIFO data output from core
);


	/****** Internals for codec data*******/
	reg [23:0] left_data;
	reg [23:0] right_data;
	reg [23:0] sample_mono;
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
	
	assign DATA_OUT = sample_mono;
	
	
	/****** FIFO regs *******/

/*	reg [11+1:0] in_wptr; //Input write pointer
	reg [11+1:0] in_rptr; //Input read pointer
	
	reg [23:0] IN_FIFO [0:4095]; //Input data FIFO, 4096 x 24 bit samples  
	
	//This will flag when input FIFO is full 
	wire in_full;
	assign in_full = in_wptr[11];
	
	
	*/
	
	
	
	initial begin
			
		adcbitcntr32 = 5'd0;
		//in_wptr = 0;
		
	end
	
	
	/************* Getting data from codec *******************/

	
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
			sample_mono = ((left_data + right_data) >> 1);
		
		end
		
		
	end
	
	
	
	/****************** FIFO ******************/
	/*
	//Writing to FIFO
	always @(posedge AUD_LRC) begin
	
	
		if(!reset)
		
			in_wptr <= 0;
		//Check space in FIFO 
		else (!in_full)
		
			in_wptr <= in_wptr; //Increment write pointer
			
			IN_FIFO[in_wptr[11:0]]; <=  sample_mono; //Fill current FIFO element with sample 
			
	end
	
	
	//Reading from FIFO
	always @(posedge MCLK) begin
	
		if(!reset)
		
			in_rptr <= 0;
			
		//Check space in FIFO 
		else (!in_empty)
		
			in_rptr <= in_rptr; //Increment write pointer
			
			IN_FIFO[in_wptr[11:0]]; <=  sample_mono; //Fill current FIFO element with sample 
			
	
	
	
	end
	
*/

endmodule
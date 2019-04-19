module FFTtest(
	
	input MCLK, 						//50MHZ board clock
	input LR_CLK,						//48Khz sampling rate clock
	input [23:0] sink_real,	//Input real parts
	input [23:0] sink_imag,	//Input imaginary parts
	input reset,
	
	output sink_ready,				//FFT asserts when ready
	output [1:0] source_error,		//FFT asserts when error occurs
	output source_valid,				//Asserted by FFT when valid data to output
	output source_sop,				//FFT start of packet
	output source_eop,				//FFT end of packet
	output [23:0] source_real,			//FFT real ouput
	output [23:0] source_imag,			//FFT imaginary output
	output [5:0] source_exp 		//Exponent 
);
	
	reg [11:0] sample_counter;
	
	reg sink_sop; //input start of incoming FFT frame 
	reg sink_eop; //input end of incoming FFT frame
//	reg reset;
	reg sink_valid;
	reg source_ready;
	reg inverse;
	reg [1:0] sink_error;

    FFT u0 (
        .clk          (MCLK),          //    clk.clk								//input clock
        .reset_n      (reset),      //    rst.reset_n    - input active low reset
        .sink_valid   (sink_valid),   //   sink.sink_valid - input, assert to indicate data is valid
        .sink_ready   (sink_ready),   //       .sink_ready - outputs from FFT when ready to accept data
        .sink_error   (sink_error),   //       .sink_error - input error, probably won't use 
        .sink_sop     (sink_sop),     //       .sink_sop	  - input start of incoming FFT frame
        .sink_eop     (sink_eop),     //       .sink_eop   - input end of incoming FFT frame
        .sink_real    (sink_real),    //       .sink_real  - input sequence real parts
        .sink_imag    (sink_imag),    //       .sink_imag  - input sequence imaginary parts
        .inverse      (inverse),      //       .inverse
        .source_valid (source_valid), // source.source_valid - output, FFT asserts when valid data to output
        .source_ready (source_ready), //       .source_ready - input, asserted when ready to accept data(?)
        .source_error (source_error), //       .source_error - FFT core output when error in module
        .source_sop   (source_sop), 			  //       .source_sop - output marks start of outgoing FFT frame
        .source_eop   (source_eop),  		 //       .source_eop - output marks end of outgoing FFT frame
        .source_real  (source_real),  //       .source_real - output sequence real data
        .source_imag  (source_imag),  //       .source_imag - output sequence imaginary data 
        .source_exp   (source_exp)  			  //       .source_exp - output exponent 
    );

	initial begin
		
		sample_counter = 0;
		sink_sop = 0;
		sink_eop = 0;
	//	reset = 1;
		sink_valid = 0;
		source_ready = 1;
		sink_error = 2'b00;
		inverse = 0;
		
	end
	
	
	/* Assert in_valid for 1 MCLK cycle when data changes */

	
	/* Increment sample counter on every LR CLK */
	always @(posedge LR_CLK) begin
	
		if(reset)	begin
			
			sample_counter<=sample_counter+1; //Increment counter	
			
		end
		
	end
	
	/* Assert start of packet signal when first sample sent */
	always @(posedge LR_CLK) begin
	
		if(reset)	begin
		
			if(sample_counter == 0) begin
			sink_sop <= 1;
			sink_valid = 1;
			end
			else
			sink_sop  <= 0;
			
		end
	end

	/* Assert end of packet signal when 4096 samples sent */
	always @(posedge LR_CLK) begin
	
		if(reset)	begin
		
			if(sample_counter == 4095)
			sink_eop <= 1;
			else
			sink_eop <= 0;
			
		end
		
	end


endmodule 
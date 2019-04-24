module FFTcore(
	
	input MCLK, 						//50MHZ board clock
	input [23:0] sink_real,	//Input real parts
	input [23:0] sink_imag,	//Input imaginary parts
	input sink_valid,
	input sink_sop,
	input sink_eop,
	input reset,
	
	output sink_ready,				//FFT asserts when ready
	output [1:0] source_error,		//FFT asserts when error occurs
	output source_valid,				//Asserted by FFT when valid data to output
	output source_sop,				//FFT start of packet
	output source_eop,				//FFT 	 of packet
	output [23:0] source_real,			//FFT real ouput
	output [23:0] source_imag,			//FFT imaginary output
	output [5:0] source_exp 		//Exponent 
);
	
	reg [11:0] sample_counter;
	
	//reg sink_sop; //input start of incoming FFT frame 
	//reg sink_eop; //input 	 of incoming FFT frame
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
        .sink_eop     (sink_eop),     //       .sink_eop   - input 	 of incoming FFT frame
        .sink_real    (sink_real),    //       .sink_real  - input sequence real parts
        .sink_imag    (sink_imag),    //       .sink_imag  - input sequence imaginary parts
        .inverse      (inverse),      //       .inverse
        .source_valid (source_valid), // source.source_valid - output, FFT asserts when valid data to output
        .source_ready (source_ready), //       .source_ready - input, asserted when ready to accept data(?)
        .source_error (source_error), //       .source_error - FFT core output when error in module
        .source_sop   (source_sop), 			  //       .source_sop - output marks start of outgoing FFT frame
        .source_eop   (source_eop),  		 //       .source_eop - output marks 	 of outgoing FFT frame
        .source_real  (source_real),  //       .source_real - output sequence real data
        .source_imag  (source_imag),  //       .source_imag - output sequence imaginary data 
        .source_exp   (source_exp)  			  //       .source_exp - output exponent 
    );

	initial begin
		
		sample_counter = 0;

		//sink_valid = 0;
		source_ready = 1;
		sink_error = 2'b00;
		inverse = 0;
		
		
	end
	
	
	wire test = !sink_valid & MCLK;
	
	/* Increment sample counter on every LR CLK */
	always @(posedge MCLK) begin
	
		if(sink_valid) 
		
		sample_counter = sample_counter+1; //Increment counter

	end

	/* Assert sop when first sample sent */
	//assign sink_sop = sink_valid & sample_counter ==0 ? 1'b1 : 1'b0; 
	/* Assert eop when first sample sent */
	//assign sink_eop = sink_valid;
	




endmodule	
	`timescale 1 us/ 100ps


module FFTcore_tb;

	reg MCLK = 1'b0; 			//50MHZ board clock
	reg [23:0] sink_real_sig;	//Input real parts
	reg [23:0] sink_imag_sig;  //Input imaginary parts
	reg sink_valid_sig;
	reg reset_sig;
	
	wire	sink_ready_sig;
	wire 	 [1:0] source_error_sig;
	wire	 source_valid_sig;   
	wire	  source_sop_sig;
	wire	 source_eop_sig;
	wire	  [23:0] source_real_sig;
	wire	 [23:0] source_imag_sig;
	wire 	[5:0] source_exp_sig;
	
	
	reg [2:0] sample_interval_counter;
	reg [12:0] samples_sent_counter;
		 
	wire sink_sop;
	wire sink_eop;
	 
	 FFTcore FFTtest_inst
(
	.MCLK(MCLK) ,	// input  clk_sig
	.sink_real(sink_real_sig) ,	// input [23:0] sink_real_sig
	.sink_imag(sink_imag_sig) ,	// input [23:0] sink_imag_sig
	.sink_valid(sink_valid_sig),
	.sink_sop(sink_sop),
	.sink_eop(sink_eop),
	.reset(reset_sig) ,	// input  reset_sig
	.sink_ready(sink_ready_sig) ,	// output  sink_ready_sig
	.source_error(source_error_sig) ,	// output [1:0] source_error_sig
	.source_valid(source_valid_sig) ,	// output  source_valid_sig
	.source_sop(source_sop_sig) ,	// output  source_sop_sig
	.source_eop(source_eop_sig) ,	// output  source_eop_sig
	.source_real(source_real_sig) ,	// output [23:0] source_real_sig
	.source_imag(source_imag_sig) ,	// output [23:0] source_imag_sig
	.source_exp(source_exp_sig) 	// output [5:0] source_exp_sig
);

	integer file, file2, sample_val;
	reg error; 

		
	initial begin
		
		//Open text file to read sine wave values from
		file = $fopen("sine.txt","r");
		$ferror(file, error);
		
		file2 = $fopen("fft_output.txt","w");
		
		if(error != 0) 
		$display("\nFile Open Failed with Error Code = %x", error) ;
		
		else begin
		
		reset_sig = 0;
		sink_valid_sig = 0;
		samples_sent_counter = 0;
		repeat(10) @(posedge MCLK); 
		reset_sig = 1;
		repeat(1) @(posedge MCLK); 
		sample_interval_counter = 3'd0;	
		
		//Imaginary parts of signal always 0 as not interested in phase, only magnitude
		sink_imag_sig <= 24'h000000; 
		end
	
	end
	
	initial begin
		MCLK = 0;
	end


	
	always begin
	
		#1.041666665 MCLK <= ~MCLK; //50 MHZ 

		
	end
	


	
	//Pulse sink valid every 4095 MCLKs
	always @ (posedge MCLK) begin

	if(reset_sig) begin
			if(sample_interval_counter == 0) begin
			
				sink_valid_sig = 1;
								
				$fscanf(file,"%d\n",sample_val); //scan each line and get the value as an hexadecimal
						
				//Real parts of signal, which would be coming from ADC every 1/48Khz 
				sink_real_sig = sample_val;
				
				if(samples_sent_counter < 1024) 
				samples_sent_counter = samples_sent_counter + 1;
				else begin samples_sent_counter = 1;
				end
		
				$fdisplay(file2,"%d",source_real_sig); //write as decimal
			end	
			else 
				sink_valid_sig = 0;
			
		end
		
		sample_interval_counter = sample_interval_counter + 1;

		
	end
			
	assign sink_sop = sink_valid_sig & samples_sent_counter == 1 ? 1'b1 : 1'b0; 
	assign sink_eop = sink_valid_sig & samples_sent_counter == 1024 ? 1'b1 : 1'b0; 
	

endmodule
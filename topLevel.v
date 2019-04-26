module topLevel #(

	//Parameters
	parameter SAMPLE_LEGTH = 24 //Word length of ADC samples in bits. Default Reg settings are 24 bit 

)(

	input AUD_BCLK,		//Bit clock from codec
	input MCLK,				//50MHZ clock from board 
	input AUD_LRC,			//Left Right/Word Select/Frame Select Clock signal from codec - 48kHz
	input AUD_ADC_DATA,	//ADC bit stream data from codec L/R interleaved 
	input RESET,			//Reset - ACTIVE LOW
	
	output b
);


/************* Audio Core ************************/

wire LRC_CLK_OUT;
wire [SAMPLE_LEGTH-1:0] audio_core_out;

audioCore audioCore_inst
(
	.AUD_BCLK(AUD_BCLK) ,	// input  AUD_BCLK_sig
	.AUD_LRC(AUD_LRC) ,	// input  AUD_LRC_sig
	.AUD_ADC_DATA(AUD_ADC_DATA) ,	// input  AUD_ADC_DATA_sig
	.reset(RESET) ,	// input  reset_sig
	.LRC_OUT(LRC_CLK_OUT) ,	// output  LRC_OUT_sig
	.DATA_OUT(audio_core_out) 	// output [23:0] DATA_OUT_sig
);

/************ Asynchronus FIFO *****************/

	wire FIFO_read_empty;
	wire sink_valid;
	reg  FIFO_read_en = 1'b0;
	wire [SAMPLE_LEGTH-1:0] FIFO_OUTPUT;
	wire FIFO_write_full;
	reg  FIFO_write_en = 1'b0;
	reg  FIFO_clear_in = 1'b1;
	
	assign sink_valid = !FIFO_read_empty;
	
	always @(negedge AUD_LRC) begin 
		if(RESET) begin
			
			FIFO_clear_in = 1'b0;
			FIFO_write_en = 1'b1;
			FIFO_read_en = 1'b1;
		
		end
		
	end

	aFifo aFifo_inst
	(
		.Data_out(FIFO_OUTPUT) ,	// output [DATA_WIDTH-1:0] Data_out_sig
		.Empty_out(FIFO_read_empty) ,	// output  Empty_out_sig
		.ReadEn_in(FIFO_read_en) ,	// input  ReadEn_in_sig
		.RClk(MCLK) ,	// input  RClk_sig
		.Data_in(audio_core_out) ,	// input [DATA_WIDTH-1:0] Data_in_sig
		.Full_out(FIFO_write_full) ,	// output  Full_out_sig
		.WriteEn_in(FIFO_write_en) ,	// input  WriteEn_in_sig
		.WClk(LRC_CLK_OUT) ,	// input  WClk_sig
		.Clear_in(FIFO_clear_in) 	// input  Clear_in_sig
	);

	
/************** FFT *************************/	
	
	reg [SAMPLE_LEGTH-1:0] sink_imag_sig = 24'd0;
	wire sink_ready_sig;
	wire [1:0] source_error_sig;
	wire source_valid_sig;
	wire source_sop_sig;
	wire source_eop_sig;
	wire [SAMPLE_LEGTH-1:0] source_real_sig;
	wire [5:0] source_exp_sig;
		
	FFTcore FFTcore_inst
(
	.MCLK(MCLK_sig) ,	// input  MCLK_sig
	.sink_real(sink_real_sig) ,	// input [23:0] sink_real_sig
	.sink_imag(sink_imag_sig) ,	// input [23:0] sink_imag_sig
	.sink_valid(sink_valid_sig) ,	// input  sink_valid_sig
	.sink_sop(sink_sop_sig) ,	// input  sink_sop_sig
	.sink_eop(sink_eop_sig) ,	// input  sink_eop_sig
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
	
	
/*********** LED Driver *********************/	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
endmodule
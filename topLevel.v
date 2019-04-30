module topLevel #(

	//Parameters
	parameter SAMPLE_LEGTH = 24, //Word length of ADC samples in bits. Default Reg settings are 24 bit 
	parameter FFT_SIZE_WIDTH = 10,
	parameter FFT_SIZE = (1<<FFT_SIZE_WIDTH) //1024 point

)(

	input AUD_BCLK,				//Bit clock from codec
	input MCLK,						//50MHZ clock from board 
	input AUD_ADCLRCK,			//Left Right/Word Select/Frame Select Clock signal from codec - 48kHz
	input AUD_ADC_DATA,			//ADC bit stream data from codec L/R interleaved 
	input RESET,					//RESET_AL - ACTIVE LOW
	
	output AUD_XCK,				//12.288MHZ clock from PLL used to drive MCLK of codec
	
	output [2:0] RGB1,						//Top half shift registers
	output [2:0] RGB2,						//Bottom half shift registers 
	output [3:0] ROW_ADDRESS,				//Row selects
	output CLK_MATRIX,						//output clock to matrix
	output LATCH,
	output OE,				 					//Output enable
	output [2:0] GND
);

/************** RESET_AL *********************/
wire RESET_AL;
assign RESET_AL = !RESET;


/************* Audio Core ************************/

wire LRC_CLK_OUT;
wire [SAMPLE_LEGTH-1:0] audio_core_out;

audioCore audioCore_inst
(
	.AUD_BCLK(AUD_BCLK) ,	// input  AUD_BCLK_sig
	.AUD_LRC(AUD_ADCLRCK) ,	// input  AUD_LRC_sig
	.AUD_ADC_DATA(AUD_ADC_DATA) ,	// input  AUD_ADC_DATA_sig
	.reset(RESET_AL) ,	// input  RESET_AL_sig
	.LRC_OUT(LRC_CLK_OUT) ,	// output  LRC_OUT_sig
	.DATA_OUT(audio_core_out) 	// output [23:0] DATA_OUT_sig
);

/************ Asynchronus FIFO *****************/

	wire FIFO_read_empty;
	reg  FIFO_read_en = 1'b0;
	wire [SAMPLE_LEGTH-1:0] FIFO_OUTPUT;
	wire FIFO_write_full;
	reg  FIFO_write_en = 1'b0;
	reg  FIFO_clear_in = 1'b1;
	
	always @(negedge AUD_ADCLRCK) begin 
		if(RESET_AL) begin
			
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
	//Counter to keep track of samples sent, so know when to flag sop and eop signals
	reg [FFT_SIZE_WIDTH-1:0] samples_sent_counter = 0;
	reg sink_valid = 0;
	reg sink_valid_del = 0;
	wire sink_sop;
	wire sink_eop;
	
	assign sink_sop = (samples_sent_counter == 0) ? sink_valid : 0;
	assign sink_eop = (samples_sent_counter == FFT_SIZE - 1) ? sink_valid : 0;

	
	
	//First 2 samples will be invalid (hi z)
	reg [2:0] init = 0;
	

	
	
	//Sink valid logic
	always @(posedge MCLK) begin
		if(RESET_AL) begin
			sink_valid <= !FIFO_read_empty;
			sink_valid_del <= sink_valid;
		end
	end	
	
	always @(posedge MCLK) begin
		if(RESET_AL && sink_valid_del && FIFO_read_en)
			samples_sent_counter <= samples_sent_counter + 1;

	end
		


	wire sink_ready_sig;
	wire [1:0] source_error_sig;
	wire source_valid_sig;
	wire source_sop_sig;
	wire source_eop_sig;
	wire [SAMPLE_LEGTH-1:0] source_real_sig;
	wire [5:0] source_exp_sig;

	
		
	FFTcore FFTcore_inst
(
	.MCLK(MCLK) ,	// input  MCLK_sig
	.sink_real(FIFO_OUTPUT) ,	// input [23:0] sink_real_sig
	.sink_imag(sink_imag_sig) ,	// input [23:0] sink_imag_sig
	.sink_valid(sink_valid) ,	// input  sink_valid_sig
	.sink_sop(sink_sop) ,	// input  sink_sop_sig
	.sink_eop(sink_eop) ,	// input  sink_eop_sig
	.reset(RESET_AL) ,	// input  RESET_AL_sig
	.sink_ready(sink_ready_sig) ,	// output  sink_ready_sig
	.source_error(source_error_sig) ,	// output [1:0] source_error_sig
	.source_valid(source_valid_sig) ,	// output  source_valid_sig
	.source_sop(source_sop_sig) ,	// output  source_sop_sig
	.source_eop(source_eop_sig) ,	// output  source_eop_sig
	.source_real(source_real_sig) ,	// output [23:0] source_real_sig
	.source_imag(source_imag_sig) ,	// output [23:0] source_imag_sig
	.source_exp(source_exp_sig) 	// output [5:0] source_exp_sig
);

		
	ledMatrix ledMatrix_inst
(
	.MCLK(MCLK) ,	// input  MCLK_sig
	.source_valid(source_valid_sig) ,	// input  source_valid_sig
	.F_BIN_IN(source_real_sig) ,	// input [BIN_WDITH-1:0] F_BIN_IN_sig
	.RESET(RESET_AL) ,	// input  RESET_AL_sig
	.RGB1(RGB1) ,	// output [2:0] RGB1_sig
	.RGB2(RGB2) ,	// output [2:0] RGB2_sig
	.ROW_ADDRESS(ROW_ADDRESS) ,	// output [3:0] ROW_ADDRESS_sig
	.CLK_MATRIX(CLK_MATRIX) ,	// output  CLK_MATRIX_sig
	.LATCH(LATCH) ,	// output  LATCH_sig
	.OE(OE) ,	// output  OE_sig
	.GND(GND) 	// output [2:0] GND_sig
);
	
	
	
	

	
	
	
/* PLL for codec XCK signal. 12.288MHz */

	wire PLL_RESET_AL;
	assign PLL_RESET_AL = !RESET_AL;

	PLL PLL_inst
	(
		.refclk(MCLK),
		.rst(PLL_RESET_AL),
		.outclk_0(AUD_XCK),
		.locked()
		
	
	
	);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
endmodule
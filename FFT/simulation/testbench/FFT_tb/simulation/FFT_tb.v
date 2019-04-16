// FFT_tb.v

// Generated using ACDS version 17.1 590

`timescale 1 ps / 1 ps
module FFT_tb (
	);

	wire         fft_inst_clk_bfm_clk_clk;                 // FFT_inst_clk_bfm:clk -> [FFT_inst:clk, FFT_inst_rst_bfm:clk, FFT_inst_sink_bfm:clk, FFT_inst_source_bfm:clk]
	wire   [1:0] fft_inst_sink_bfm_conduit_sink_error;     // FFT_inst_sink_bfm:sig_sink_error -> FFT_inst:sink_error
	wire   [0:0] fft_inst_sink_bfm_conduit_inverse;        // FFT_inst_sink_bfm:sig_inverse -> FFT_inst:inverse
	wire   [0:0] fft_inst_sink_bfm_conduit_sink_eop;       // FFT_inst_sink_bfm:sig_sink_eop -> FFT_inst:sink_eop
	wire   [0:0] fft_inst_sink_bfm_conduit_sink_sop;       // FFT_inst_sink_bfm:sig_sink_sop -> FFT_inst:sink_sop
	wire   [0:0] fft_inst_sink_bfm_conduit_sink_valid;     // FFT_inst_sink_bfm:sig_sink_valid -> FFT_inst:sink_valid
	wire  [23:0] fft_inst_sink_bfm_conduit_sink_real;      // FFT_inst_sink_bfm:sig_sink_real -> FFT_inst:sink_real
	wire         fft_inst_sink_sink_ready;                 // FFT_inst:sink_ready -> FFT_inst_sink_bfm:sig_sink_ready
	wire  [23:0] fft_inst_sink_bfm_conduit_sink_imag;      // FFT_inst_sink_bfm:sig_sink_imag -> FFT_inst:sink_imag
	wire  [23:0] fft_inst_source_source_imag;              // FFT_inst:source_imag -> FFT_inst_source_bfm:sig_source_imag
	wire  [23:0] fft_inst_source_source_real;              // FFT_inst:source_real -> FFT_inst_source_bfm:sig_source_real
	wire   [0:0] fft_inst_source_bfm_conduit_source_ready; // FFT_inst_source_bfm:sig_source_ready -> FFT_inst:source_ready
	wire         fft_inst_source_source_sop;               // FFT_inst:source_sop -> FFT_inst_source_bfm:sig_source_sop
	wire         fft_inst_source_source_eop;               // FFT_inst:source_eop -> FFT_inst_source_bfm:sig_source_eop
	wire         fft_inst_source_source_valid;             // FFT_inst:source_valid -> FFT_inst_source_bfm:sig_source_valid
	wire   [5:0] fft_inst_source_source_exp;               // FFT_inst:source_exp -> FFT_inst_source_bfm:sig_source_exp
	wire   [1:0] fft_inst_source_source_error;             // FFT_inst:source_error -> FFT_inst_source_bfm:sig_source_error
	wire         fft_inst_rst_bfm_reset_reset;             // FFT_inst_rst_bfm:reset -> [FFT_inst:reset_n, FFT_inst_sink_bfm:reset, FFT_inst_source_bfm:reset]

	FFT fft_inst (
		.clk          (fft_inst_clk_bfm_clk_clk),                 //    clk.clk
		.reset_n      (fft_inst_rst_bfm_reset_reset),             //    rst.reset_n
		.sink_valid   (fft_inst_sink_bfm_conduit_sink_valid),     //   sink.sink_valid
		.sink_ready   (fft_inst_sink_sink_ready),                 //       .sink_ready
		.sink_error   (fft_inst_sink_bfm_conduit_sink_error),     //       .sink_error
		.sink_sop     (fft_inst_sink_bfm_conduit_sink_sop),       //       .sink_sop
		.sink_eop     (fft_inst_sink_bfm_conduit_sink_eop),       //       .sink_eop
		.sink_real    (fft_inst_sink_bfm_conduit_sink_real),      //       .sink_real
		.sink_imag    (fft_inst_sink_bfm_conduit_sink_imag),      //       .sink_imag
		.inverse      (fft_inst_sink_bfm_conduit_inverse),        //       .inverse
		.source_valid (fft_inst_source_source_valid),             // source.source_valid
		.source_ready (fft_inst_source_bfm_conduit_source_ready), //       .source_ready
		.source_error (fft_inst_source_source_error),             //       .source_error
		.source_sop   (fft_inst_source_source_sop),               //       .source_sop
		.source_eop   (fft_inst_source_source_eop),               //       .source_eop
		.source_real  (fft_inst_source_source_real),              //       .source_real
		.source_imag  (fft_inst_source_source_imag),              //       .source_imag
		.source_exp   (fft_inst_source_source_exp)                //       .source_exp
	);

	altera_avalon_clock_source #(
		.CLOCK_RATE (50000000),
		.CLOCK_UNIT (1)
	) fft_inst_clk_bfm (
		.clk (fft_inst_clk_bfm_clk_clk)  // clk.clk
	);

	altera_avalon_reset_source #(
		.ASSERT_HIGH_RESET    (0),
		.INITIAL_RESET_CYCLES (50)
	) fft_inst_rst_bfm (
		.reset (fft_inst_rst_bfm_reset_reset), // reset.reset_n
		.clk   (fft_inst_clk_bfm_clk_clk)      //   clk.clk
	);

	altera_conduit_bfm fft_inst_sink_bfm (
		.clk            (fft_inst_clk_bfm_clk_clk),             //     clk.clk
		.reset          (~fft_inst_rst_bfm_reset_reset),        //   reset.reset
		.sig_inverse    (fft_inst_sink_bfm_conduit_inverse),    // conduit.inverse
		.sig_sink_eop   (fft_inst_sink_bfm_conduit_sink_eop),   //        .sink_eop
		.sig_sink_error (fft_inst_sink_bfm_conduit_sink_error), //        .sink_error
		.sig_sink_imag  (fft_inst_sink_bfm_conduit_sink_imag),  //        .sink_imag
		.sig_sink_ready (fft_inst_sink_sink_ready),             //        .sink_ready
		.sig_sink_real  (fft_inst_sink_bfm_conduit_sink_real),  //        .sink_real
		.sig_sink_sop   (fft_inst_sink_bfm_conduit_sink_sop),   //        .sink_sop
		.sig_sink_valid (fft_inst_sink_bfm_conduit_sink_valid)  //        .sink_valid
	);

	altera_conduit_bfm_0002 fft_inst_source_bfm (
		.clk              (fft_inst_clk_bfm_clk_clk),                 //     clk.clk
		.reset            (~fft_inst_rst_bfm_reset_reset),            //   reset.reset
		.sig_source_eop   (fft_inst_source_source_eop),               // conduit.source_eop
		.sig_source_error (fft_inst_source_source_error),             //        .source_error
		.sig_source_exp   (fft_inst_source_source_exp),               //        .source_exp
		.sig_source_imag  (fft_inst_source_source_imag),              //        .source_imag
		.sig_source_ready (fft_inst_source_bfm_conduit_source_ready), //        .source_ready
		.sig_source_real  (fft_inst_source_source_real),              //        .source_real
		.sig_source_sop   (fft_inst_source_source_sop),               //        .source_sop
		.sig_source_valid (fft_inst_source_source_valid)              //        .source_valid
	);

endmodule
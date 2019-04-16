
module FFT (
	clk,
	reset_n,
	sink_valid,
	sink_ready,
	sink_error,
	sink_sop,
	sink_eop,
	sink_real,
	sink_imag,
	inverse,
	source_valid,
	source_ready,
	source_error,
	source_sop,
	source_eop,
	source_real,
	source_imag,
	source_exp);	

	input		clk;
	input		reset_n;
	input		sink_valid;
	output		sink_ready;
	input	[1:0]	sink_error;
	input		sink_sop;
	input		sink_eop;
	input	[23:0]	sink_real;
	input	[23:0]	sink_imag;
	input	[0:0]	inverse;
	output		source_valid;
	input		source_ready;
	output	[1:0]	source_error;
	output		source_sop;
	output		source_eop;
	output	[23:0]	source_real;
	output	[23:0]	source_imag;
	output	[5:0]	source_exp;
endmodule

// (C) 2001-2017 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel FPGA IP License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.



module FFT_fft_ii_0 (
   input clk, 
   input reset_n,
	input	[0 : 0] inverse,
	input	sink_valid,
	input	sink_sop,
	input	sink_eop,
	input	logic [23 : 0] sink_real,
	input	logic [23 : 0] sink_imag,
	input	logic [1 : 0] sink_error,
	input	source_ready,
   output [5 : 0] source_exp,
	output sink_ready,
	output [1 : 0] source_error,
	output source_sop,
	output source_eop,
	output source_valid,
	output [23 : 0] source_real,
	output [23 : 0] source_imag
	);

	asj_fft_dualstream #(
		.device_family("Cyclone V"),
		.nps(4096),
		.bfp(1),
		.nume(2),
		.mpr(24),
		.twr(24),
		.bpr(24),
		.bpb(6),
		.fpr(4),
		.mram(0),
		.m512(0),
		.mult_type(1),
		.mult_imp(0),
		.dsp_arch(2),
		.srr("AUTO_SHIFT_REGISTER_RECOGNITION=OFF"),
		.rfs1("FFT_fft_ii_0_1n4096sin.hex"),
		.rfs2("FFT_fft_ii_0_2n4096sin.hex"),
		.rfs3("FFT_fft_ii_0_3n4096sin.hex"),
		.rfc1("FFT_fft_ii_0_1n4096cos.hex"),
		.rfc2("FFT_fft_ii_0_2n4096cos.hex"),
		.rfc3("FFT_fft_ii_0_3n4096cos.hex")
	)
	asj_fft_dualstream_inst (
		.clk(clk),
		.clk_ena(1'b1),
		.reset_n(reset_n),
		.inverse(inverse),
		.sink_valid(sink_valid),
		.sink_sop(sink_sop),
		.sink_eop(sink_eop),
		.sink_real(sink_real),
		.sink_imag(sink_imag),
		.sink_ready(sink_ready),
		.sink_error(sink_error),
		.source_error(source_error),
		.source_ready(source_ready),
		.source_sop(source_sop),
		.source_eop(source_eop),
		.source_valid(source_valid),
		.source_exp(source_exp),
		.source_real(source_real),
		.source_imag(source_imag)
	);
endmodule


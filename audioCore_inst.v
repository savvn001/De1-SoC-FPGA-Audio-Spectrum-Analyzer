// Copyright (C) 2017  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details.


// Generated by Quartus Prime Version 17.1 (Build Build 590 10/25/2017)
// Created on Fri Apr 19 02:06:23 2019

audioCore audioCore_inst
(
	.AUD_BCLK(AUD_BCLK_sig) ,	// input  AUD_BCLK_sig
	.MCLK(MCLK_sig) ,	// input  MCLK_sig
	.AUD_LRC(AUD_LRC_sig) ,	// input  AUD_LRC_sig
	.AUD_ADC_DATA(AUD_ADC_DATA_sig) ,	// input  AUD_ADC_DATA_sig
	.reset(reset_sig) ,	// input  reset_sig
	.LRC_OUT(LRC_OUT_sig) ,	// output  LRC_OUT_sig
	.DATA_OUT(DATA_OUT_sig) 	// output [23:0] DATA_OUT_sig
);


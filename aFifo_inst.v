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
// Created on Fri Apr 19 02:10:03 2019

aFifo aFifo_inst
(
	.Data_out(Data_out_sig) ,	// output [DATA_WIDTH-1:0] Data_out_sig
	.Empty_out(Empty_out_sig) ,	// output  Empty_out_sig
	.ReadEn_in(ReadEn_in_sig) ,	// input  ReadEn_in_sig
	.RClk(RClk_sig) ,	// input  RClk_sig
	.Data_in(Data_in_sig) ,	// input [DATA_WIDTH-1:0] Data_in_sig
	.Full_out(Full_out_sig) ,	// output  Full_out_sig
	.WriteEn_in(WriteEn_in_sig) ,	// input  WriteEn_in_sig
	.WClk(WClk_sig) ,	// input  WClk_sig
	.Clear_in(Clear_in_sig) 	// input  Clear_in_sig
);

defparam aFifo_inst.DATA_WIDTH = 24;
defparam aFifo_inst.ADDRESS_WIDTH = 4;
//defparam aFifo_inst.FIFO_DEPTH = ;

// Audio Interface

	`timescale 1 us/100 ps
	
	
module afifo_tb;	


	reg 			CLK_50_sig;
	reg 			CLK_48_sig;
	reg        [23:0] FIFO_IN_DATA;
	reg 			reset_sig;
	reg 			readEn_in_sig;
	reg 			writeEn_in_sig;
	reg 			clear_in_sig;

	wire				write_full;
	wire 	[23:0]		FIFO_OUTPUT;
	wire 			read_empty;
		
		aFifo aFifo_inst
	(
		.Data_out(FIFO_OUTPUT) ,	// output [DATA_WIDTH-1:0] Data_out_sig
		.Empty_out(read_empty) ,	// output  Empty_out_sig
		.ReadEn_in(readEn_in_sig) ,	// input  ReadEn_in_sig
		.RClk(CLK_50_sig) ,	// input  RClk_sig
		.Data_in(FIFO_IN_DATA) ,	// input [DATA_WIDTH-1:0] Data_in_sig
		.Full_out(write_full) ,	// output  Full_out_sig
		.WriteEn_in(writeEn_in_sig) ,	// input  WriteEn_in_sig
		.WClk(CLK_48_sig) ,	// input  WClk_sig
		.Clear_in(clear_in_sig) 	// input  Clear_in_sig
	);
			

	
	initial begin
	
	reset_sig = 1'b0;
	CLK_50_sig		 = 1'b0;
	CLK_48_sig = 1'b0;
	clear_in_sig = 1'b1;
	FIFO_IN_DATA = 24'd0;
	
	repeat(5) @(negedge CLK_48_sig);
	
	reset_sig = 1'b1;
	clear_in_sig = 1'b0;
	writeEn_in_sig = 1'b1;
	readEn_in_sig = 1'b1;
	
	end
	
	
	
	 
	always begin

		//Bit clock signal for 48kHz LR clock
		 #10.41666666665 CLK_48_sig <= ~CLK_48_sig; 
	end
	
	always begin
	
		#0.01 CLK_50_sig <= ~CLK_50_sig; //50 MHZ 

		
	end

	 

	always @ (posedge CLK_48_sig) begin
	
		if(reset_sig) begin
		
				FIFO_IN_DATA <= FIFO_IN_DATA + 24'd1;
				 
		end
	
	end
	
	
	endmodule
module matrixTest #(

	parameter SCREEN_WIDTH = 64, //Depth of shift 	isters
	parameter SCREEN_WIDTH_BITS = 6,  //2^ of this should equal above
	parameter SCREEN_LENGTH = 32,
	parameter SCREEN_LENGTH_BITS = 5,		//2^ of this should equal length
	parameter OE_HOLD = 1000				//OE hold time in clock cycles



)(
	
	input MCLK,							  //50MHZ board clock
	//input source_vaid,
	//input [BIN_WDITH-1:0] F_BIN_IN, //Input frequency bins from FFT core
	//input RESET,

	//RGB shift registers. One set for top half of matrix 
	//and other set for bottom half
	output reg [2:0] RGB1 = 0,						//Top half shift registers
	output reg [2:0] RGB2 = 0,						//Bottom half shift registers 
	output reg [3:0] ROW_ADDRESS = 0,				//Row selects
	output wire CLK_MATRIX,				//output clock to matrix
	output reg LATCH = 0,
	output reg OE = 1,				 //Output enable
	output reg [2:0] GND = 0
	

);

reg [23:0] test_bin_buffer [63:0];
		


reg [63:0] matrix_frame_buffer [31:0];

	/** Function to calculate what LEDs should be on for current row */
	function [63:0] row_set;
	
		input [SCREEN_LENGTH_BITS-1:0] row_no;
	
		integer k;
	
		begin
		
			for(k = 0; k < SCREEN_WIDTH; k = k + 1) begin
				
				if(row_no <  (test_bin_buffer[k] >> 19)) //>> By 19 to scale to between 2^24 to 0-32
					row_set[k] = 0;
				else	
					row_set[k] = 1;
			
			
			end

	
	end endfunction 
	





integer i;
integer j;

initial begin

	for (i=0;i<64;i=i+1) begin
   test_bin_buffer[i] = 24'd8388608;
	end
	
	/* Create 'histogram' from bin_buffer values, store this in frame buffer */
	for(j=0;j<32;j=j+1) begin
				
			matrix_frame_buffer[j] = row_set(j);
					
	end 
	

 

end











/************** Driving the display *************************/

reg [3:0] clock_counter = 0;
reg clock_25 = 0;

always @(posedge MCLK) begin

		clock_counter <= clock_counter + 1;
		
		if(clock_counter == 3'd3)
					clock_25 <= ~clock_25;
		
end

reg clk_enable = 0;
reg shift_in_clk;


reg RESET = 0;
reg [15:0] delay_counter = 0;
assign CLK_MATRIX = shift_in_clk;

reg [31:0] shift_counter = 0;



/* Initialize */
always @(posedge MCLK) begin


	delay_counter <= delay_counter + 1'd1;
	if(delay_counter[15]) begin
		RESET <= 1;
		GND <= 0;
					
	end
	
	
	
	
end

/*	Generate clock signal for shift regs simply by enabling the
	main clock on whilst shifting bits in, and off before/after that.  
*/
always @* begin

	if(clk_enable == 1) 
		shift_in_clk <= clock_25;
	else  
		shift_in_clk <= 0;
	
	

end



always @(posedge clock_25) begin
	
	if(RESET) begin
		
		
		//Shift data bits in 
		if(shift_counter == SCREEN_WIDTH) begin
		LATCH <= 1; //Latch will latch bits into leds
		ROW_ADDRESS <= ROW_ADDRESS + 4'd1; //Get ready to scan next row
		end else begin
		LATCH <= 0;
		end
		
		
		if(shift_counter < SCREEN_WIDTH) begin
			clk_enable <= 1;
			//Shift in bits from frame buffer
			
			//Blue LEDs 
			RGB1[0] <= matrix_frame_buffer[ROW_ADDRESS][shift_counter]; 
			RGB2[0] <= matrix_frame_buffer[ROW_ADDRESS+16][shift_counter]; //Bottom half
			
			//Green LEDs
			RGB1[1] <= 0;
			RGB2[1] <= 0;
			
			//Red LEDs
			RGB1[2] <= 0;
			RGB2[2] <= 0;
			
			
		end else
			clk_enable = 0; //Disable clocking signal for shift regs after all bits are shifted in 
		
		
		//Deassert output enable after latch to unblank the display
		if(shift_counter > SCREEN_WIDTH + 1 && shift_counter < SCREEN_WIDTH + OE_HOLD-1)
			OE <= 0;		
		else
			OE <= 1;
			
		
		//Reset counter to 0		
		if(shift_counter < SCREEN_WIDTH + OE_HOLD)
		shift_counter <= shift_counter + 1'd1;
		else
		shift_counter <= 0;

			
	
	end


end




endmodule
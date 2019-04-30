module ledMatrix #(


	//Width of frequency bins in bits.
	parameter BIN_WDITH = 24,
	parameter BUFFER_WIDTH = 10, 
	parameter BUFFER_SIZE_NO = (1<<BUFFER_WIDTH),
	
	parameter SCREEN_WIDTH = 64, 				//Depth of shift registers
	parameter SCREEN_WIDTH_BITS = 6,  		//2^ of this should equal above
	parameter SCREEN_LENGTH = 32,
	parameter SCREEN_LENGTH_BITS = 5,		//2^ of this should equal length
	parameter OE_HOLD = 1000					//OE hold time in clock cycles
	
)(
	
	input MCLK,							  			//50MHZ board clock
	input source_valid,
	input [BIN_WDITH-1:0] F_BIN_IN, 			//Input frequency bins from FFT core
	input RESET,

	//RGB shift registers. One set for top half of matrix 
	//and other set for bottom half
	output reg [2:0] RGB1 = 0,								//Top half shift registers
	output reg [2:0] RGB2 = 0,								//Bottom half shift registers 
	output reg [3:0] ROW_ADDRESS = 0,					//Row selects
	output wire CLK_MATRIX,									//output clock to matrix
	output reg LATCH = 0,
	output reg OE = 1,									   //Output enable
	output reg [2:0] GND = 0					
);


//Buffer size / width of screen = how many bits wide is each 'group' to average
localparam group_width = ((2**BUFFER_WIDTH)/SCREEN_WIDTH)-1;


//Memory to store frequency bins in buffer
reg [BIN_WDITH-1:0] Bin_buffer [0:BUFFER_SIZE_NO-1];

//This stores how high each line on each column of the matrix will be each
//time the display is refreshed
reg [31:0] column_heights [SCREEN_WIDTH-1:0];


//To count clock cycles for filling up column_heights
reg [SCREEN_WIDTH_BITS-1:0] 	column_counter;


//'write pointer' in buffer
reg [BUFFER_WIDTH-1:0] wrt_pointer;


wire buffer_full;
assign buffer_full = (wrt_pointer == BUFFER_SIZE_NO - 1 ? 1'b1 : 1'b0); 

reg [3:0] avg = 0; //Parameter this as well [( log2 group width -1) : 0]

wire calc_average;
assign calc_average = avg[1] & avg [0];

reg hold = 0;


initial begin
			
		wrt_pointer <= 0;
		avg <= 0;
		column_counter = 0;
		
	end	
	
	
integer i;

reg [31:0] sum_of_group = 32'd0;
reg [31:0] average_of_group = 32'd0;


/* Writing to FIFO */
always @(posedge MCLK) begin
	
	if(RESET && source_valid) begin
		
		//Fill up buffer with frequency bins
		Bin_buffer[wrt_pointer] <= F_BIN_IN;
					
		wrt_pointer <= wrt_pointer+ 1;
		avg <= avg + 1;
	
		
		if(avg == 0) begin
		
				//Take average value of every 'group_width' elements
				for(i = 0; i <= group_width; i = i + 1) begin
				
				sum_of_group = sum_of_group + Bin_buffer[(wrt_pointer-i-1)]; //Collect sum of group 
				average_of_group = sum_of_group >> 4; //PARAMETERIZE LATER! FOR GROup_width  = 16 (divide by 16, 1024 bufer size)
				
			
				end
				
				
				column_heights[column_counter] = average_of_group;
				
				if(!hold) begin
						column_counter = 0;
						hold = hold + 1;
				end else begin
				column_counter = column_counter + 1;
				end
				sum_of_group = 0;
		
		
		end
	
	end
	
	else if(!RESET) 
		wrt_pointer <= 0;



end



/********************************LED Matrix control *************************************************************/
	
//Buffer to store and hold column heights at moment when buffer is full until buffer is next full again.
reg [31:0] column_heights_hold [SCREEN_WIDTH-1:0];


	
/** Function to calculate what LEDs should be on for current row */
	function [63:0] row_set;
	
		input [SCREEN_LENGTH_BITS-1:0] row_no;
	
		integer k;
	
		begin
		
			for(k = 0; k < SCREEN_WIDTH; k = k + 1) begin
				
				if(row_no <  (column_heights_hold[k] >> 19)) //>> By 19 to scale to between 2^24 (ADC range) to 0-32
					row_set[k] = 0;
				else	
					row_set[k] = 1;
			
			
			end

	
	end endfunction 	
	

reg [63:0] matrix_frame_buffer [31:0];

integer j;
integer z;

reg [5:0] assignment_counter1 = 0; //Count to 64
reg [4:0] assignment_counter2 = 0; //Count to 32

always @(posedge MCLK) begin


	if(column_counter == 63) begin
		
				if(assignment_counter1 < SCREEN_WIDTH) begin
				
				//Make copy of column_heights array
				column_heights_hold[assignment_counter1] <= column_heights[assignment_counter1];
				assignment_counter1 <= assignment_counter1 + 1;
				
				end else if(assignment_counter2 < SCREEN_LENGTH) begin
				
				// Create 'histogram' from bin_buffer values, store this in frame buffer 
				matrix_frame_buffer[assignment_counter2] <= row_set(assignment_counter2);
				assignment_counter2 = assignment_counter2 + 1;
				
				end
				
		
			
	
	end

end


/************** Driving the display *************************/

reg clock_counter = 0;
reg clock_25 = 0;

always @(posedge MCLK) begin

		//clock_counter = clock_counter + 1;
		
		//if(clock_counter)
					clock_25 <= ~clock_25;
		
end

reg clk_enable = 0;
reg shift_in_clk;

assign CLK_MATRIX = shift_in_clk;

reg [31:0] shift_counter = 0;


/*	Generate clock signal for shift regs simply by enabling the
	clock on whilst shifting bits in, and off before/after that.  
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
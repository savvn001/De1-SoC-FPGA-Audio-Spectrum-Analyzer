module ledMatrix #(


	//Specify number of LEDs in matrix
	parameter MTRX_HEIGHT = 32,
	parameter MTRX_LENGTH = 64,
	//Width of frequency bins in bits.
	parameter BIN_WDITH = 24,
	parameter BUFFER_WIDTH = 8, 
	parameter BUFFER_SIZE_NO = 256

	

)(
	
	input MCLK,							  //50MHZ board clock
	input source_vaid,
	input [BIN_WDITH-1:0] F_BIN_IN, //Input frequency bins from FFT core
	input RESET,

	//RGB shift registers. One set for top half of matrix 
	//and other set for bottom half
	output R1,G1,B1,
	output R2, G2, B2,
	output A, B, C, D,				//Row selects
	output CLK_MATRIX,				//output clock to matrix
	output LATCH,
	output OE							//Output enable 

);


//Buffer size / width of screen = how many bits wide is each 'group' to average
localparam group_width = ((2**BUFFER_WIDTH)/MTRX_LENGTH)-1;


//Memory to store frequency bins in buffer
reg [BIN_WDITH-1:0] Bin_buffer [0:BUFFER_SIZE_NO-1];

//This stores how high each line on each column of the matrix will be each
//time the display is refreshed
reg [5:0] column_heights [MTRX_LENGTH-1:0];


//To count clock cycles for filling up column_heights
reg [MTRX_LENGTH-1:0] 	column_counter;


//'write pointer' in buffer
reg [BUFFER_WIDTH-1:0] wrt_pointer;


wire buffer_full;
assign buffer_full = (wrt_pointer == BUFFER_SIZE_NO - 1 ? 1'b1 : 1'b0); 

reg [1:0] avg = 0;

wire calc_average;
assign calc_average = avg[1] & avg [0];




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

	if(RESET && source_vaid) begin
		
		//Fill up buffer with frequency bins
		Bin_buffer[wrt_pointer] <= F_BIN_IN;
		wrt_pointer <= wrt_pointer+ 1;
		avg <= avg + 1;
		
		if(avg == 0) begin
		
				//Take average value of every 'group_width' elements
				for(i = 0; i < group_width+1; i = i + 1) begin
				
				sum_of_group = sum_of_group + Bin_buffer[(wrt_pointer-i-1)];
				average_of_group = sum_of_group >> 2; //PARAMETERIZE LATER!!!! FOR GROup_width  = 4, (divide by 4)
				
			
				end
			
				column_heights[column_counter] = average_of_group;
				column_counter = column_counter + 1;
				sum_of_group = 0;
		
		
		end
	
	end
	
	else if(!RESET) 
		wrt_pointer <= 0;



end


/******* TO DO -  LED Matrix control Send out column_heights[column_counter] to shift registers,
	latch every time buffer full etc. *****/


endmodule
/* IP core for controlling RGB LED matrix panels like this: https://www.adafruit.com/product/1484
	They work over whats known as a 'HUB75' interface which there isn't any official documentation for 
	but the below webpages explain the interface clearly enough:
	
	https://bikerglen.com/projects/lighting/led-panel-1up/
	https://www.open-electronics.org/a-fpga-controlled-rgb-led-matrix-for-incredible-effects-the-hardware/
	http://www.rayslogic.com/propeller/Programming/AdafruitRGB/AdafruitRGB.htm
	
	Here the IP Core takes the FFT IP core output frequency bins and plots them like a 
	spectrum analyzer on the RGB LED matrix
	
*/
	

module ledDriver(


		input MCLK,							//Master clock, clocks display
		input CLK_48,						//48KhZ sampling rate clock 
		input [23:0] FFT_IN,				//Frequency bins output from FFT module
		input SOP,							//FFT Data start of packet flag
		input EOP,							//FFT data end of packet flag
		input reset,	
		
		output R1,							//Red LED data for top half
		output G1,							//Green LED data for top half
		output B1,							//Blue LED data for top half
		output R2,							//Red LED data for bottom half
		output G2,							//Green LED data for bottom half
		output B2,							//Blue LED data for bottom half
		output A,							//Row select bit 0
		output B,							//Row select bit 1
		output C,							//Row select bit 2
		output D,							//Row select bit 3
		output LATCH,						//Latch output for all LEDs
		output CLK_OUT,					//Clock output for display
		output OE							//Output enable for display

);


//Array of 64 x 5 bit values. Each value 
//representing a column across the screen and the height to draw up to
reg [4:0] plot_data [63:0]; 

//Counter to count up to 64 samples
reg [5:0] sample_counter = 6'd0;


always @(posedge CLK_48) begin

	//Start collecting at start of packet signal
	if(SOP) begin
	
		
	
	
	
	
	end


end











endmodule


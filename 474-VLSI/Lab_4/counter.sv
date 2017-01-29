module counter(

	input  [7:0]  buttons,
	input         encoder0,
	input         encoder1,
	input         clk,
	input  wire   reset,
	output        lock_pwm,
	output		  lock_display,
	output        pwm_led,
	output [6:0]  segments,
	output [2:0]  select,
	output        pwm_clk,  //5000Hz,
	output 		  display_clk, //5000Hz
	output        pwm

);

logic encoder_a;
logic encoder_b;
logic button_a;
logic button_b;
//clock is 5KHz
brightness_clk_2hz button_clk0(
  .inclk0 ( clk ),
  .c0     ( pwm_clk ),
  .locked ( lock_pwm )
);
// 10K clock
frame_rate frame_rate0(
  .inclk0 ( clk ),
  .c1     ( display_clk ),
  .locked ( lock_display )
);
// debounce both of the encoder inputs
debounce encodera(

	.clk       (clk),
	.A		     (encoder0),
	.triggered (encoder_a)
);

debounce encoderb(

	.clk       (clk),
	.A		     (encoder1),
	.triggered (encoder_b)
);

debounce buttona(

	.clk       (clk),
	.A		     (buttons[7]),
	.triggered (button_a)
);

debounce buttonb(

	.clk       (clk),
	.A		     (buttons[6]),
	.triggered (button_b)
);
logic [3:0]   digit     = 0;  // initial digit to display
logic [12:0]  pwm_count = 0;  // holds 2Hz clock
logic [6:0]   duty      = 0;  // counter that counts to top before cycling(frequency) 
logic [6:0]   lumens    = 1;  // % of time on, creates dimming
parameter     top       = 32; // value that controls frequency

// clock running at 10KHz needs to count to 5000 until it
// can be 2Hz, using a counter
always_ff @ (posedge display_clk)
	begin
		if (pwm_count == 5000) 
			begin
				pwm_count = 0;
				casez(~buttons)
					8'b00000001 : //if we press the first button, then brightness increases to a limit
						begin
							if (lumens == 32) 
								lumens = lumens;
							else
								lumens++;
						end
					8'b00000010 : // decrease brightness
						begin
							if (lumens == 0) 
								lumens = lumens;
							else
								lumens--;
						end
					default     : lumens = lumens;			
				endcase
			end
		else
			pwm_count++;
			
		if (duty == top) 
			duty = 0;
		else
			duty = duty + 1;
				
		if (duty <= (lumens)) 
			pwm = 0;
		else 
			pwm = 1;
	end
// seven seg decoder
always_comb
	begin
		unique casez (digit)       //abcdefg
										 
			1 : segments = 7'b1111001; 
			2 : segments = 7'b0100100; 
			3 : segments = 7'b0110000; 
			4 : segments = 7'b0011001; 
			5 : segments = 7'b0010010; 
			6 : segments = 7'b0000010; 
			7 : segments = 7'b1111000; 
			8 : segments = 7'b0000000; 
			9 : segments = 7'b0010000; 
			0 : segments = 7'b1000000; 
						 
		endcase
	end


// quad encoder logic, Roger';s flip flop idea found on FPGAs are fun
// Takes the known last states of the encoders and debounces them
// Xors a 4 bit register with itself to check for a turn
logic [2:0] encoder0_last;
logic [2:0] encoder1_last;

// sync encoders to the clock
// append encoder states to last states to debounce
// then xor to get final state
always @(posedge clk)
	begin 
		encoder0_last <= {encoder0_last[1:0], encoder_a};
	end
always @(posedge clk)
	begin
		encoder1_last <= {encoder1_last[1:0], encoder_b};
	end
	
wire encoder_turning = encoder0_last[1] ^ encoder0_last[2] ^ encoder1_last[1] ^ encoder1_last[2];
wire encoder_dir   = encoder0_last[1] ^ encoder1_last[2];

// check encoder states, if forward, count up, if backward, count down. 
// count var is 10 bits wide to allow 999 digits
logic [9:0] cnt;
always  @(posedge clk)
	begin
		if (encoder_turning)
			begin
				if(encoder_dir) 
					cnt<=cnt+1; 
				else 
					cnt<=cnt-1;
			end
		else
			cnt <= cnt;
	end
	
logic [21:0] digit_counter = 22'd1;
logic [2:0]  select_state = 3'b001;

// state machine for cycling through select_states
// current select bit becomes new select bits
always_ff @ (posedge display_clk)

	begin
		unique casez (select_state)
			3'b001  : select_state = 3'b010; 
			3'b010  : select_state = 3'b100;
			3'b100  : select_state = 3'b001;
		endcase
	end
	
//state machine for sycling through digits
logic [4:0] ones;
logic [4:0] tens;
logic [4:0] hundreds;
	
// block takes the current countand creates the digit to push out the decoder
// to do this, we're going to take the 10 bit count value and do some math
// If we want the 1's place, we take 987 % 10, and we get 7
// 10's: 987 / 10 % 10 
// 100's: 987 / 100 % 10
// .. N's place: (X/N) % 10

always_comb
	begin	
	ones     = (cnt/1)%10;
	tens     = (cnt/10)%10;
	hundreds = (cnt/100)%10;	
	unique casez(select_state)
		3'b001  : 
			begin
				if (hundreds > 0) 
					select = 3'b011; 
				else
					select = 3'b111; //off
			end
		3'b010  : 
			begin
				if (tens > 0 || hundreds > 0)
					select = 3'b001; 
				else 
					select = 3'b111; //off
			end
				
		3'b100  : select = 3'b000; 
	endcase
		
	unique casez(select)
		3'b011 : digit = hundreds;			
		3'b001 : digit = tens;
		3'b000 : digit = ones;
	endcase
	
	end
endmodule
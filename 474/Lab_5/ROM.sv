module ROM(

	input logic [7:0] buttons,
	input         		encoder0,
	input         		encoder1,
	input         		clk,
	input  wire   		reset,
	output [6:0]  		segments,
	output [2:0]  		select,
	output 		  		display_clk, //5000Hz
	output        		phase_clk, //16.77MHz
	output unsigned 	[7:0]  rr,
	output        		pwm
	

);
integer multiplier = 1;
logic [23:0] phase_acc;
logic [10:0] rom_data;
logic encoder_a;
logic encoder_b;
logic button0;
logic button1;

// 10K clock
frame_rate frame_rate0(
  .inclk0 ( clk ),
  .c1     ( display_clk ),
  .locked ( lock_display )
);

sine ROM0(
  .address ( rom_data ),
  .clock   ( clk ),
  .q       ( rr )
);

phase phase_clk0(
  .inclk0 (clk),
  .c0     (phase_clk)
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

logic [3:0]   digit  = 0;  // initial digit to display

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
logic [13:0] cnt = 1000;
always  @(posedge clk)
	begin
		if (encoder_turning)
			begin
				if(encoder_dir) 
					cnt<=cnt+(1*multiplier); 
				else 
					cnt<=cnt-(1*multiplier);
				if (cnt > 9999)
					cnt <= cnt - 9999;
			end
		else
			cnt <= cnt;
	end
	
logic [2:0]  select_state = 3'b001;

// state machine for cycling through select_states
// current select bit becomes new select bits
always_ff @ (posedge display_clk)

	begin
		unique casez (select_state)
			3'b001  : select_state = 3'b010; 
			3'b010  : select_state = 3'b100;
			3'b100  : select_state = 3'b111;
			3'b111  : select_state = 3'b001;
		endcase
	end
	

always @(posedge phase_clk) 
	begin
	  // increment by 16 instead of 1
	phase_acc += cnt;
	rom_data = phase_acc[23:13];
	
end	
	
//state machine for cycling through digits
logic [3:0] ones = 0;
logic [3:0] tens = 0;
logic [3:0] hundreds = 0;
logic [3:0] thousands = 0;
integer  i;
// block takes the current countand creates the digit to push out the decoder
// to do this, we're going to take the 10 bit count value and do some math

//BCD algorithm: double dabble
//or shift and add 3 algorithm

always @ (cnt)
	begin
		  thousands = 4'd0;
        hundreds = 4'd0;
        tens = 4'd0;
        ones = 4'd0;
		for  (i = 13; i >= 0; i = i-1)
			begin
			  // if the value contained is over 5, add three
			  // so that the shift guarantees the carryover to the next "number"
=          if (thousands >= 5)
               thousands = thousands + 3;
			 	else
					thousands = thousands;
          if (hundreds >= 5)
               hundreds = hundreds + 3;
			 else
				   hundreds = hundreds;
          if (tens >= 5)
               tens = tens + 3;
			 else
					tens = tens;
          if (ones >= 5)
				ones = ones + 3;
			 else
				ones = ones;
			 
          thousands = thousands << 1;
          thousands[0] = hundreds[3];
          hundreds = hundreds << 1;
          hundreds[0] = tens[3];
          tens = tens << 1;
          tens[0] = ones[3];
          ones = ones << 1;
          ones[0] = cnt[i];
				
			end
	end
	
//extra credit use buttons for count modifiers. 
logic [1:0] buttons_ab;
always_comb
	begin
	buttons_ab = {button0, button1};
	case (~buttons)
		2'b??????00 : multiplier = 1;
		2'b??????01 : multiplier = 10;
	   2'b??????10 : multiplier = 100;
		2'b??????11 : multiplier = 1000;
		default : multiplier = 1;
	endcase
end

always_comb
	begin		
	unique casez(select_state)
		3'b111  :
			begin
				if (thousands > 0)
					select = 3'b100;
				else
					select = 3'b111;
			end
		3'b001  : 
			begin
				if (hundreds > 0 || thousands > 0) 
					select = 3'b011; 
				else
					select = 3'b111; //off
			end
		3'b010  : 
			begin
				if (tens > 0 || hundreds > 0 || thousands > 0)
					select = 3'b001; 
				else 
					select = 3'b111; //off
			end
				
		3'b100  : select = 3'b000; 
	endcase
		
	unique casez(select)
		3'b100 : digit = thousands; 
		3'b011 : digit = hundreds;			
		3'b001 : digit = tens;
		3'b000 : digit = ones;
	endcase
	
	end
endmodule

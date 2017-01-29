module UART(

	  input                   clk,
	  input  wire             reset,
	  input logic             d_out,
	  output logic            d_in,
	  output logic            cs_n,
	  output                  sclk,
	  output [6:0]            segments,
	  output                  dp,
	  output [2:0]            select,
	  output                  display_clk, //5000Hz
	  output                  pwm,
	  output 					  tx_clk,
	  output logic            tx_send


);

// UART vars
localparam TX_START=0, TX_STOP=1, TX_DATA=2, TX_IDLE=3, TX_INIT=4;
logic [2:0] tx_state = TX_INIT;
logic tx_ready = 1;
logic [7:0] baud_count = 0;
// adc_bcd_state machine
localparam ONES=0, TENS=1, HUNDREDS=2, THOUSANDS=3, DECIMAL=4, NEWLINE=5, CARRAIGE=6;
logic [2:0] adc_state = THOUSANDS;
logic [7:0] tx_data = 0;
logic adc_val_ready = 0;
logic tx_complete = 0;
integer tx_data_count = 0;
// ADC vars
logic [11:0] adc_rom_out;
logic [11:0] d_out_buffer = 1;
logic [3:0]  count_posedge;
logic [3:0] count_negedge;

// 10K clock
Display_PLL display0 (
	  .inclk0 ( clk ),
	  .c0 ( display_clk )
);

TX_PLL tx0 (
	  .inclk0 ( clk ),
	  .c0 ( _clk )
);


Conversion_ROM ADC0 (
	  .address ( adc_data ),
	  .clock ( clk ),
	  .q ( adc_rom_out )
);


ADC_PLL sclk_0 (
	  .inclk0 ( clk ),
	  .c0 ( sclk )
);


// The adc is free running (may change) at a 2MHZ clk. It has an operating sclk range of 0.8 to 3.2 MHz
// There is a 16 bit data loop that is captured one bit at a time, at the falling edge of sclk
// CS is lowered on the first falling edge, and din is provided one bit at a time at the negedge of sclk
// sclk is raised on the last rising edge of a frame
/*always @(negedge sclk)
	  begin
		casez(count_negedge)

				0 : cs_n <= 0;
				2 : d_in <= 0;
				3 : d_in <= 0;
				4 : d_in <= 1;
				//15: cs_n = 1;
				default : d_in = 0;
	  endcase
	  count_negedge++;
	  end
*/
always @(posedge sclk)
  begin
		 unique casez(count_posedge)
			0 : cs_n <= 0;
			1 : d_in <= 0;
			2 : d_in <= 0;
			3 : d_in <= 1;
			4  : d_out_buffer[11] <= d_out;
			5  : d_out_buffer[10] <= d_out;
			6  : d_out_buffer[9] <= d_out;
			7  : d_out_buffer[8] <= d_out;
			8  : d_out_buffer[7] <= d_out;
			9  : d_out_buffer[6] <= d_out;
			10 : d_out_buffer[5] <= d_out;
			11 : d_out_buffer[4] <= d_out;
			12 : d_out_buffer[3] <= d_out;
			13 : d_out_buffer[2] <= d_out;
			14 : d_out_buffer[1] <= d_out;
			15 : d_out_buffer[0] <= d_out;
		 endcase
		 count_posedge++;

  end
  
reg [3:0] state;
logic TxD_start = 1;
logic [7:0] TxD_data = 200;
// the state machine starts when "TxD_start" is asserted, but advances when "BaudTick" is asserted (115200 times a second)
always @(posedge tx_clk)
case(state)
  4'b0000: if(TxD_start) state <= 4'b0100;
  4'b0100: if(baud_count == 192) state <= 4'b1000; // start
  4'b1000: if(baud_count == 192) state <= 4'b1001; // bit 0
  4'b1001: if(baud_count == 192) state <= 4'b1010; // bit 1
  4'b1010: if(baud_count == 192) state <= 4'b1011; // bit 2
  4'b1011: if(baud_count == 192) state <= 4'b1100; // bit 3
  4'b1100: if(baud_count == 192) state <= 4'b1101; // bit 4
  4'b1101: if(baud_count == 192) state <= 4'b1110; // bit 5
  4'b1110: if(baud_count == 192) state <= 4'b1111; // bit 6
  4'b1111: if(baud_count == 192) state <= 4'b0001; // bit 7
  4'b0001: if(baud_count == 192) state <= 4'b0010; // stop1
  4'b0010: if(baud_count == 192) state <= 4'b0000; // stop2
  default: if(baud_count == 192) state <= 4'b0000;
endcase
reg muxbit;

always @(state[2:0])
case(state[2:0])
  0: tx_send <= TxD_data[0];
  1: tx_send <= TxD_data[1];
  2: tx_send <= TxD_data[2];
  3: tx_send <= TxD_data[3];
  4: tx_send <= TxD_data[4];
  5: tx_send <= TxD_data[5];
  6: tx_send <= TxD_data[6];
  7: tx_send <= TxD_data[7];
endcase

always @(posedge tx_clk)
	begin
	if (baud_count == 192) baud_count = 0;
	else baud_count++;
	end
/*
always @(posedge tx_clk)
	begin
		if (baud_count == 192)
			begin
			baud_count <= 0;
			case(tx_state)
			
				TX_INIT: begin
					tx_send <= 1;
					tx_data_count <= 0;
					tx_state <= TX_IDLE;				
					end
					
				TX_IDLE: begin
					tx_send <= 1;
					if (tx_ready || ~tx_complete) begin
						unique casez(adc_state)
							ONES: begin
								tx_data <= 5;//ones+48;
								adc_state <= NEWLINE;
								tx_state <= TX_START;
								end
							TENS: begin
								tx_data <= 5;//tens+48;
								adc_state <= ONES;
								tx_state <= TX_START;
								end
							HUNDREDS: begin
								tx_data <= 5;//hundreds+48;
								adc_state <= TENS;
								tx_state <= TX_START;
								end
							THOUSANDS: begin
								tx_complete <= 0;
								tx_data <= 5;//thousands+48;
								adc_state <= DECIMAL;
								tx_state <= TX_START;
								end
							DECIMAL: begin
								tx_data <= 5;//46;
								adc_state <= HUNDREDS;
								tx_state <= TX_START;
								end
							NEWLINE: begin
								tx_data <= 5;//10;
								adc_state <= THOUSANDS;
								tx_state <= TX_START;
								end
							CARRAIGE: begin
								tx_data <= 5;//13;
								adc_state <= NEWLINE;
								tx_complete = 1;
								tx_state <= TX_START;
								end
						endcase
					end
					else
						tx_state <= TX_IDLE;
				end
				TX_START: begin
					tx_send <= 0;
					tx_state <= TX_DATA;
					end

				TX_DATA: begin
					tx_send <= tx_data[0];
					tx_data <= {1'b0, tx_data[7:1]};
					if (tx_data_count == 7) begin
						tx_data_count = 0;
						tx_state <= TX_STOP;
					end
					else begin
						tx_data_count <= tx_data_count + 1;
						tx_state <= TX_DATA;
					end
					end

				TX_STOP: begin
					tx_send <= 1;
					tx_state <= TX_IDLE;
					end
					
				default: begin
					tx_send <= 0;
					tx_data_count <= 0;
					tx_state <= TX_IDLE;
				end
			endcase
			end
		else
			baud_count <= baud_count + 1;
	end
	
*/
// ***************************************************************************//
//                                Routine Logic
// **************************************************************************//
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
				10 : segments = 7'b1111111;
	 endcase
  end

// quad encoder logic, Roger';s flip flop idea found on FPGAs are fun
// Takes the known last states of the encoders and debounces them


logic [2:0]  select_state = 3'b001;

// state machine for cycling through select_states
// current select bit becomes new select bits
always_ff @(posedge display_clk) begin
		if (update_counter == 5000) begin
			update_counter = 0;
			adc_data = d_out_buffer;
		end
		else
			update_counter++;
	  
				 unique casez (select_state)
							3'b001  : select_state = 3'b010;
							3'b010  : select_state = 3'b100;
							3'b100  : select_state = 3'b111;
							3'b111  : select_state = 3'b001;
				 endcase
	  end

//state machine for cycling through digits
logic [11:0] adc_data = 1;
logic [12:0] update_counter = 0;
logic [3:0] ones = 0;
logic [3:0] tens = 0;
logic [3:0] hundreds = 0;
logic [3:0] thousands = 0;
integer  i;
// block takes the current countand creates the digit to push out the decoder
// to do this, we're going to take the 10 bit count value and do some math

//BCD algorithm: double dabble
//or shift and add 3 algorithm


// combine start, data, and stop bits together
assign TxD = (state<4) | (state[3] & muxbit);
always @(adc_data)
	begin

		thousands = 4'd0;
		hundreds = 4'd0;
		tens = 4'd0;
		ones = 4'd0;
		for  (i = 11; i >= 0; i = i-1)
			begin
			// if the value contained is over 5, add three
			// so that the shift guarantees the carryover to the next "number"
			if (thousands >= 5)
				thousands = thousands + 3;
			else
				hundreds = hundreds;
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
			ones[0] = adc_rom_out[i];
			//if (i == 0)
			//	tx_ready = 1;
			//else
			//	tx_ready = 0;		
	  end
	 end

always_comb
	  begin
		 casez (select)
			3'b100 : dp = 0;
			default: dp = 1;
		 endcase
  end
  
always_comb
		begin
		unique casez(select_state)
			3'b111 : select = 3'b100;
			3'b001 : select = 3'b011;
			3'b010 : select = 3'b001;
			3'b100 : select = 3'b000;
		endcase
		end
			
always_comb
	  begin
	  unique casez(select)
				 3'b100 : digit = thousands;
				 3'b011 : digit = hundreds;    //always DP on          
				 3'b001 : digit = tens;
				 3'b000 : digit = ones;
	  endcase

	  end
endmodule
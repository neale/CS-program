
module seven_seg(
	
	input logic [7:0] buttons, 
	output logic [2:0] select,
	output logic [6:0] segments,
	
   output logic en_n
);

assign en_n = 1'b0;
reg [7:0] digit;
////8 to 3 encoder logic for select pins
always_comb
	begin
    unique casez(buttons)
        8'b11111111 : select = 3'b111;
        8'b11111110 : select = 3'b100;
        8'b1111110? : select = 3'b011;
        8'b111110?? : select = 3'b001;
        8'b11110??? : select = 3'b000;
    endcase
	end


//7 seg decoder
// checks select pins and outputs a number based on the selected digit
always_comb
	begin
		unique casez(select)
		
		  3'b100: digit = 8'b00001000; //8
        3'b011: digit = 8'b00000010; //2
        3'b001: digit = 8'b00000111; //7
        3'b000: digit = 8'b00000011; //3
		
		endcase
	end
	
always_comb
    begin
    unique casez (digit)       //abcdefg
		  	
        1 : segments = 7'b0000110; 
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
endmodule

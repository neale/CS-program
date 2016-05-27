
module seven_seg(
	
	input        [7:0] buttons, 
	output       [2:0] select,
	input wire         pwm,
	output       [6:0] segments
        output             en_n
);

assign en_n = 1'b0

//8 to 3 encoder logic for select pins
always comb

    unique casez(buttons)
        8'b11111111 : 3'b111 = select;
        8'b11111110 : 3'b100 = select;
        8'b11111101 : 3'b011 = select;
        8'b11111011 : 3'b001 = select;
        8'b11110111 : 3'b000 = select;
    endcase


//7 seg decoder
// checks select pins and outputs a number based on the selected digit
always comb
    
    unique casez (select)       //abcdefg

        3'b100: 7'b0000000 = segments; //8
        3'b011: 7'b1101101 = segments; //2
        3'b110: 7'b0001111 = segments; //7
        3'b000: 7'b0000110 = segments; //3

    endcase


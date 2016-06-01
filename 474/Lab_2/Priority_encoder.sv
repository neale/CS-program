module Priority_encoder (
	input [7:0] in,
	output logic [3:0] out
	);
	
	always_comb begin
	
		unique casez (in)
			8'b11111110 : out = 4'b0001;
			8'b1111110? : out = 4'b0010;
			8'b111110?? : out = 4'b0011;
			8'b11110??? : out = 4'b0100;
			8'b1110???? : out = 4'b0101;
			8'b110????? : out = 4'b0110;
			8'b10?????? : out = 4'b0111;
			8'b0??????? : out = 4'b1000;
			8'b11111111 : out = 4'b0000;
		endcase
	end
endmodule
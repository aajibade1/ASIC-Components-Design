// $Id: $
// File name:   adder_1bit.sv
// Created:     1/23/2020
// Author:      Abdulrahman Ajibade
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: 1-bit Full Adder Design.



module adder_1bit(input wire a, input wire b, input wire carry_in, output reg sum, output reg carry_out);
	
	always_comb
	begin
		sum = carry_in ^ (a ^ b);		
		carry_out = ((!carry_in) & b & a) | (carry_in & (b | a));

	end

endmodule

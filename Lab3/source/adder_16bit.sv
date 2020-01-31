// 337 TA Provided Lab 2 8-bit adder wrapper file template
// This code serves as a template for the 8-bit adder design wrapper file 
// STUDENT: Replace this message and the above header section with an
// appropriate header based on your other code files

module adder_16bit
(
	input wire [15:0] a,
	input wire [15:0] b,
	input wire carry_in,
	output wire [15:0] sum,
	output wire overflow
);

	// STUDENT: Fill in the correct port map with parameter override syntax for using your n-bit ripple carry adder design to be an 16-bit ripple carry adder design
	genvar i;	
	generate

	for(i = 0;i < 16; i = i+1)
	  begin
		always @ (a[i], b[i], carry_in)
		begin
		assert((a[i] == 1'b1) || (a[i] == 1'b0))
	        	else $error("input a not digital logic value");

		assert((b[i] == 1'b1) || (b[i] == 1'b0))
	        	else $error("input 'b' not digital logic value");

	        assert((carry_in == 1'b1) || (carry_in == 1'b0)) 
			else $error("input 'carry_in' not digital logic value");

		end
	end
	endgenerate
	adder_nbit #(16) nb (.a(a), .b(b), .carry_in(carry_in), .sum(sum), .overflow(overflow));

endmodule

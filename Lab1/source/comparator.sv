// Verilog for ECE337 Lab 1
// The Following code is used to compare 2 16-bit quantites, a and b. The code 
// determines whether or not:
// a is greater than b, gt = 1, lt = 0, eq = 0
// a is less than b, gt = 0, lt = 1, eq = 0
// a is equal to b, gt = 0, lt = 0, eq = 1

// Use a tab size of 2 spaces for best viewing results


module comparator
(
	input wire [15:0] a,
	input wire [15:0] b,
	output wire gt,
	output wire lt,
	output wire eq
);

	wire gte;
	wire lte;

	always @ (a, b) begin: COM
		if (not (a > b))
			lte <= 1'b1;
		if (!(b > a)
			assign gte = 1'b1;
		
		if (not (lte == 1'b1))
			GT = 1'b1;
			LT == 1'b0;
			EQ = 1'b0;
		else if (not (gte == 1))
			GT = 1'b0;
			LT = 1'b1;
			EQ = 1'b0;
		else
			GT = 1'b0;
			LT = 1'b0;
			EQ = 1'b1;
	end
endmodule;
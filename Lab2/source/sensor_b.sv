// $Id: $
// File name:   sensor_b.sv
// Created:     1/23/2020
// Author:      Abdulrahman Ajibade
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Behaviour Style Sensor Eroor Detector Design.


module sensor_b(input wire[3:0] sensors, output reg error);

	reg[1:0] inter;

	always_comb
	begin
		inter[0] = sensors[3] & sensors[1];
		inter[1] = sensors[2] & sensors[1];
		error = sensors[0] | inter[1] | inter[0]; 	 	
	end

endmodule 

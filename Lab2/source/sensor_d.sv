// $Id: $
// File name:   sensor_d.sv
// Created:     1/23/2020
// Author:      Abdulrahman Ajibade
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Dataflow Style Sensor Error Detector Design



module sensor_d(input wire[3:0] sensors, output wire error);

	wire inter1;
	wire inter2;

	assign inter1 = sensors[3] & sensors[1];
	assign inter2 = sensors[2] & sensors[1];
	assign error = sensors[0] | inter1 | inter2;

endmodule

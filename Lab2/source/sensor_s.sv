// $Id: $
// File name:   sensor_s.sv
// Created:     1/22/2020
// Author:      Abdulrahman Ajibade
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Structural Coding for Sensor Error Detector.

module sensor_s(input wire [3:0] sensors, output wire error);
	wire out1;
	wire out2;
	wire out3;
	
	AND2X1 A1 (.Y(out1), .A(sensors[3]), .B(sensors[1]));
	AND2X1 A2 (.Y(out2), .A(sensors[2]), .B(sensors[1]));
	OR2X1 R1 (.Y(out3), .A(out1), .B(out2));
	OR2X1 R2 (.Y(error), .A(out3), .B(sensors[0]));

endmodule

// $Id: $
// File name:   sr_9bit.sv
// Created:     9/14/2018
// Author:      Tim Pritchett
// Lab Section: 9999
// Version:     1.0  Initial Design Entry
// Description: 9-bit MSB Serial to Parallel shift register 
//              (Defaults for Flex StP SR)

module sr_9bit
(
  input wire clk,
  input wire n_rst,
  input wire shift_strobe,
  input wire serial_in,
  output reg [8:0] packet_data 
);


flex_stp_sr #(.NUM_BITS(9), .SHIFT_MSB(0))
  CORE(
    .clk(clk),
    .n_rst(n_rst),
    .serial_in(serial_in),
    .shift_enable(shift_strobe),
    .parallel_out(packet_data)
  );

endmodule

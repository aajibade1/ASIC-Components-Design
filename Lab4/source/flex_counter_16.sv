// $Id: $
// File name:   flex_counter_16.sv
// Created:     2/7/2020
// Author:      Abdulrahman Ajibade
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Flex Counter Design.

module flex_counter_16(
input wire clk, 
input wire n_rst, 
input wire clear, 
input wire count_enable, 
input wire [15:0]rollover_val, 
output reg [15:0]count_out, 
output reg rollover_flag);


flex_counter #(16) ebit (.clk(clk), .n_rst(n_rst), .clear(clear), .count_enable(count_enable), .rollover_val(rollover_val), .count_out(count_out), .rollover_flag(rollover_flag)); 

endmodule

// $Id: $
// File name:   timer.sv
// Created:     2/26/2020
// Author:      Abdulrahman Ajibade
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Timer Module.

module timer(
    input wire clk,
    input wire n_rst,
    input wire [3:0] data_size,
    input wire [13:0] bit_period,
    input wire enable_timer,
    output reg shift_enable,
    output reg packet_done
);
    reg [13:0]count_out1;
    reg [3:0]count_out2;

    flex_counter #(14) 
    flex_counter1 (
        .clk(clk),
        .n_rst(n_rst),
        .clear(packet_done),
        .count_enable(enable_timer),
        .rollover_val(bit_period),
        .count_out(count_out1),
        .rollover_flag(shift_enable)
    );

    flex_counter flex_counter2(
        .clk(clk),
        .n_rst(n_rst),
        .clear(packet_done),
        .count_enable(shift_enable),
        .rollover_val(data_size + 1'b1),
        .count_out(count_out2),
        .rollover_flag(packet_done)
    );
endmodule

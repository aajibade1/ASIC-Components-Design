// $Id: $
// File name:   counter.sv
// Created:     3/4/2020
// Author:      Abdulrahman Ajibade
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Counter block module.



module counter(
    input wire clk,
    input wire n_rst,
    input wire cnt_up,
    input wire clear,
    output reg one_k_samples
);

reg [9:0] count_out;

    flex_counter #(.NUM_CNT_BITS(10)) 
    flex_counter1(
        .clk(clk),
        .n_rst(n_rst),
        .clear(clear),
        .count_enable(cnt_up),
        .rollover_val(10'd1000),
        .count_out(count_out),
        .rollover_flag(one_k_samples)
    );
endmodule

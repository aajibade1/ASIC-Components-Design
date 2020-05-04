// $Id: $
// File name:   timer.sv
// Created:     4/22/2020
// Author:      Abdulrahman Ajibade
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Timer Module.

module timer(
    input wire clk,
    input wire n_rst,
    input wire d_edge,
    input wire rcving,
    input wire bit_stuff,
    output reg shift_enable,
    output reg byte_received,
    output reg [3:0] count
);
    reg [3:0]count_out1;
    reg new_shift_enable;

    always_comb begin
        new_shift_enable = '0;
        if(shift_enable == 1'b1 && bit_stuff == 1'b0) begin
            new_shift_enable = shift_enable;
        end
    end

    flex_counter 
    flex_counter1 (
        .clk(clk),
        .n_rst(n_rst),
        .clear(d_edge),
        .count_enable(rcving),
        .rollover_val(4'd8),
        .count_out(count_out1),
        .rollover_flag(shift_enable)
    );

    flex_counter1 flex_counter2(
        .clk(clk),
        .n_rst(n_rst),
        .clear(rcving),
        .count_enable(new_shift_enable),
        .rollover_val(4'd8),
        .count_out(count),
        .rollover_flag(byte_received)
    );
endmodule

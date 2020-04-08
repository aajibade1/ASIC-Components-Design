// $Id: $
// File name:   rcv_block.sv
// Created:     2/26/2020
// Author:      Abdulrahman Ajibade
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Receiver Block Module.

module rcv_block(
    input wire clk,
    input wire n_rst,
    input wire [3:0] data_size,
    input wire [13:0] bit_period,
    input wire serial_in,
    input wire data_read,
    output reg [7:0]rx_data,
    output reg data_ready,
    output reg overrun_error,
    output reg framing_error
);
    logic enable_timer;
    logic shift_enable;
    logic load_buffer;
    logic sbc_clear;
    logic sbc_enable;
    logic packet_done;
    logic new_packet_detected;
    logic [8:0]packet_data;
    reg new_package;


    rcu rec(
        .clk(clk),
        .n_rst(n_rst),
        .new_packet_detected(new_packet_detected),
        .packet_done(packet_done),
        .framing_error(framing_error),
        .sbc_clear(sbc_clear),
        .sbc_enable(sbc_enable),
        .load_buffer(load_buffer),
        .enable_timer(enable_timer)
    );

    timer tim(
        .clk(clk),
        .n_rst(n_rst),
        .data_size(data_size),
        .bit_period(bit_period),
        .enable_timer(enable_timer),
        .shift_enable(shift_enable),
        .packet_done(packet_done)
    );

    sr_9bit send(
        .clk(clk),
        .n_rst(n_rst),
        .shift_strobe(shift_enable),
        .serial_in(serial_in),
        .packet_data(packet_data)
    );

    rx_data_buff dat( 
        .clk(clk),
        .n_rst(n_rst),
        .load_buffer(load_buffer),
        .packet_data(packet_data[7:0]),
        .data_read(data_read),
        .rx_data(rx_data),
        .data_ready(data_ready),
        .overrun_error(overrun_error)
    );

    start_bit_det sbd (
        .clk(clk),
        .n_rst(n_rst),
        .serial_in(serial_in),
        .start_bit_detected(new_packet_detected),
        .new_package_detected(new_package)
    );

    stop_bit_chk sbc(
        .clk(clk),
        .n_rst(n_rst),
        .sbc_clear(sbc_clear),
        .sbc_enable(sbc_enable),
        .stop_bit(packet_data[8]),
        .framing_error(framing_error)
    );


    endmodule

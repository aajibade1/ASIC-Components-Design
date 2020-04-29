// $Id: $
// File name:   usb_receiver.sv
// Created:     4/22/2020
// Author:      Abdulrahman Ajibade
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: USB Receiver Module.

module usb_receiver(input wire clk, input wire n_rst, input wire d_plus,
    input wire d_minus, input wire r_enable, output reg[7:0] r_data,
output reg empty, output reg full, output reg rcving, output reg r_error);


reg shift_enable;
reg eop;
reg d_orig;
reg d_edge;
reg d_plus_sync;
reg d_minus_sync;
reg byte_received;
reg[7:0] rcv_data;
reg w_enable;
reg [3:0] bitcount;

sync_high sh (.clk(clk), .n_rst(n_rst), .async_in(d_plus), .sync_out(d_plus_sync));

sync_low sl (.clk(clk), .n_rst(n_rst), .async_in(d_minus), .sync_out(d_minus_sync));


decode unc (.clk(clk), .n_rst(n_rst), .d_plus(d_plus_sync), 
    .shift_enable(shift_enable), .eop(eop), .d_orig(d_orig));


edge_detect ed (.clk(clk), .n_rst(n_rst), .d_plus(d_plus_sync), .d_edge(d_edge));


timer tim (.clk(clk) , .n_rst(n_rst), .d_edge(d_edge), .rcving(rcving),
.shift_enable(shift_enable), .byte_received(byte_received), .count(bitcount));

shift_register sr (.clk(clk), .n_rst(n_rst), .shift_enable(shift_enable),
.d_orig(d_orig), .rcv_data(rcv_data));

rx_fifo rxf(.clk(clk), .n_rst(n_rst), .r_enable(r_enable), .w_enable(w_enable), 
.w_data(rcv_data), .r_data(r_data), .empty(empty), .full(full));

eop_detect ep (.d_plus(d_plus_sync), .d_minus(d_minus_sync), .eop (eop));

rcu rc (.clk(clk), .n_rst(n_rst), .d_edge(d_edge), .eop(eop), .shift_enable(shift_enable), 
.rcv_data(rcv_data), .byte_received(byte_received), .rcving(rcving), 
.w_enable(w_enable), .r_error(r_error), .bit_count(bitcount));

endmodule

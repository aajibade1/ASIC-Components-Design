// $Id: $
// File name:   apb_uart_rx.sv
// Created:     3/23/2020
// Author:      Abdulrahman Ajibade
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: APB-UART Reciever Pheripheral.

module apb_uart_rx (
    input wire clk, input wire n_rst,
    input wire serial_in, input wire psel,
    input wire [2:0] paddr, input wire penable,
    input wire pwrite, input wire[7:0] pwdata,
    output reg [7:0] prdata, output reg pslverr);


reg [3:0] data_size;
reg [13:0] bit_period;
reg data_read;
reg [7:0] rx_data;
reg data_ready;
reg overrun_error;
reg framing_error;

apb_slave apb (
    .clk(clk), .n_rst(n_rst),
    .rx_data(rx_data), .data_ready(data_ready),
    .overrun_error(overrun_error),
    .framing_error(framing_error),
    .data_read(data_read),
    .psel(psel), .paddr(paddr),
    .penable(penable), .pwrite(pwrite),
    .prdata(prdata), .pslverr(pslverr),
    .pwdata(pwdata), 
    .data_size(data_size), .bit_period(bit_period)
);

rcv_block uart (
    .clk(clk), .n_rst(n_rst),
    .data_size(data_size), .bit_period(bit_period),
    .serial_in(serial_in), .data_read(data_read),
    .rx_data(rx_data), .data_ready(data_ready),
    .overrun_error(overrun_error),
    .framing_error(framing_error)
);

endmodule

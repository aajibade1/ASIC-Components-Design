// $Id: $
// File name:   rx_fifo.sv
// Created:     4/22/2020
// Author:      Abdulrahman Ajibade
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: RX_FIFO Wrapper File.

module rx_fifo (input wire clk, input wire n_rst, input wire r_enable,
    input wire w_enable, input wire[7:0] w_data, output reg[7:0] r_data,
    output reg empty, output reg full);


    fifo fif(.r_clk(clk), .w_clk(clk), .n_rst(n_rst), .r_enable(r_enable),
            .w_enable(w_enable), .w_data(w_data), .r_data(r_data), 
            .empty(empty), .full(full)
        );
    endmodule

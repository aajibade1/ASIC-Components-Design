// $Id: $
// File name:   shift_register.sv
// Created:     4/22/2020
// Author:      Abdulrahman Ajibade
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Shift Register Module.


module shift_register (input wire clk, input wire n_rst,
    input wire shift_enable, input wire d_orig, output reg[7:0] rcv_data
);

flex_stp_sr flex_shift (.clk(clk), .n_rst(n_rst), 
                        .shift_enable(shift_enable),
                        .serial_in(d_orig), .parallel_out(rcv_data)
                    );
endmodule  

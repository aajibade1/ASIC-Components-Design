// $Id: $
// File name:   shift_register.sv
// Created:     4/22/2020
// Author:      Abdulrahman Ajibade
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Shift Register Module.


module shift_register (input wire clk, input wire n_rst,
    input wire shift_enable, input wire d_orig, output reg[7:0] rcv_data, input wire bit_stuff
);

reg new_shift_enable;

always_comb begin
    new_shift_enable = '0;
    if(shift_enable == 1'b1 && bit_stuff == 1'b0) begin
        new_shift_enable = '1;
    end
end

flex_stp_sr flex_shift (.clk(clk), .n_rst(n_rst), 
                        .shift_enable(new_shift_enable),
                        .serial_in(d_orig), .parallel_out(rcv_data)
                    );
endmodule  

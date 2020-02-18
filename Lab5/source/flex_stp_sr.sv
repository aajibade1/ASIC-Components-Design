// $Id: $
// File name:   flex_stp_sr.sv
// Created:     2/14/2020
// Author:      Abdulrahman Ajibade
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Serial to parallel Shift design 


module flex_stp_sr #(parameter  NUM_BITS = 4)(
    input wire clk,
    input wire n_rst,
    input wire shift_enable,
    input wire serial,
    output reg parallel_out[NUM_BITS-1:0]
);


reg next_parallel_out[NUM_BITS-1:0];

always_ff @ (posedge clk, negedge n_rst) begin
    if(1'b0 == n_rst) begin
        parallel_out <= '0;
    end
    else begin
        rollover_flag <= next_rollover_flag;
        count_out <=next_count;
    end
end








endmodule

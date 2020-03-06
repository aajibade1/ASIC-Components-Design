// $Id: $
// File name:   flex_stp_sr.sv
// Created:     2/14/2020
// Author:      Abdulrahman Ajibade
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Serial to parallel Shift design 


module flex_stp_sr #(parameter NUM_BITS = 4, parameter SHIFT_MSB = 1)(
    input wire clk,
    input wire n_rst,
    input wire shift_enable,
    input wire serial_in,
    output reg [NUM_BITS-1:0] parallel_out
);


reg [NUM_BITS-1:0]next_parallel_out;

always_ff @ (posedge clk, negedge n_rst) begin
    if(1'b0 == n_rst) begin
        parallel_out <= '1;
    end
    else begin
        parallel_out <= next_parallel_out;
    end
end

always_comb begin
    
    if(shift_enable == 1'b1 && SHIFT_MSB == 1'b1) begin
        next_parallel_out[0] = serial_in;
        next_parallel_out[NUM_BITS-1:1] = parallel_out[NUM_BITS-2:0];
    end
    else if(shift_enable == 1'b1 && SHIFT_MSB == 1'b0) begin
        next_parallel_out[NUM_BITS-1] = serial_in;
        next_parallel_out[NUM_BITS-2:0] = parallel_out[NUM_BITS-1:1];
    end
    else begin
        next_parallel_out = parallel_out;
    end

end

endmodule

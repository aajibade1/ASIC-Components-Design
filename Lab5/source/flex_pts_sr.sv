// $Id: $
// File name:   flex_pts_sr.sv
// Created:     2/14/2020
// Author:      Abdulrahman Ajibade
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Parallel to Serial Shift design 


module flex_pts_sr #(parameter NUM_BITS = 4, parameter SHIFT_MSB = 1)(
    input wire clk,
    input wire n_rst,
    input wire shift_enable,
    input wire load_enable,
    input wire [NUM_BITS-1:0] parallel_in,
    output reg serial_out
);


reg [NUM_BITS-1:0]temp_out;
reg [NUM_BITS-1:0]next_temp_out;


always_ff @ (posedge clk, negedge n_rst) begin
    if(1'b0 == n_rst) begin
        temp_out <= '1;
    end
    else begin
        temp_out <= next_temp_out;
    end
end

always_comb begin
    next_temp_out = '0;
    
    if(load_enable == 1'b1) begin
        next_temp_out = parallel_in;
    end
    else if(shift_enable == 1'b1 && SHIFT_MSB == 1'b1) begin
        next_temp_out = {temp_out[NUM_BITS-2:0],1'b1};
    end
    else if(shift_enable == 1'b1 && SHIFT_MSB == 1'b0) begin
        next_temp_out = {1'b1,temp_out[NUM_BITS-1:1]};
    end
    else begin
        next_temp_out = temp_out;
    end
    
end
always_comb begin

    if(SHIFT_MSB == 1'B1) begin
        serial_out = temp_out[NUM_BITS-1];
    end
    else begin
        serial_out = temp_out[0];
    end

end

endmodule

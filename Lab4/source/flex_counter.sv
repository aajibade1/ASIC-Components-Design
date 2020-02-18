// $Id: $
// File name:   flex_counter.sv
// Created:     2/7/2020
// Author:      Abdulrahman Ajibade
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Flex Counter Design.

module flex_counter #(parameter NUM_CNT_BITS = 4)(input wire clk, input wire n_rst, input wire clear, input wire count_enable, input wire [NUM_CNT_BITS-1:0]rollover_val, output reg [NUM_CNT_BITS-1:0]count_out, output reg rollover_flag);

reg [NUM_CNT_BITS-1:0]next_count;
reg next_rollover_flag;

always_ff @ (posedge clk, negedge n_rst) begin
    if(1'b0 == n_rst) begin
        count_out <= '0;
        rollover_flag <= '0;
    end
    else begin
        rollover_flag <= next_rollover_flag;
        count_out <=next_count;
    end
end

always_comb begin
    next_count = '0;
    next_rollover_flag = '0;
    if (clear == 1'b1)begin
        next_count = '0;
        next_rollover_flag = 1'b0;
    end
    else if(count_enable == 1'b1) begin
        if (rollover_val == count_out+1)begin
            next_count = count_out+1;
            next_rollover_flag = '1;
        end
        else if (rollover_val == count_out) begin
            next_count = 4'b1;
            next_rollover_flag = 1'b0;
        end
        else begin
            next_count = count_out+1;
            next_rollover_flag = '0;
        end
    end
    else begin 
        next_count = count_out;
       next_rollover_flag = rollover_flag; 
    end

end
endmodule

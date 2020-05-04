// $Id: $
// File name:   stuff_bit_detect.sv
// Created:     4/28/2020
// Author:      Abdulrahman Ajibade
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Stuff bit detector module.


module stuff_bit_detect(
    input wire clk, input wire n_rst, input wire d_orig,
    input wire shift_enable, output reg bit_stuff
);


    typedef enum bit [3:0] {
        IDLE,
        DETECT1,
        DETECT2,
        DETECT3,
        DETECT4,
        DETECT5,
        DETECT6,
        STUFFR} stateType;


    stateType state;
    stateType next_state;

    always_ff @(posedge clk, negedge n_rst) begin
        if(1'b0 == n_rst) begin
            state <= IDLE;
        end
        else begin
            state <= next_state;
        end
    end

    always_comb begin
        next_state = state;
        bit_stuff = '0;
        case(state)
            IDLE: begin
                if(shift_enable == 1'b1 && d_orig == 1'b1) begin
                    next_state = DETECT1;
                    bit_stuff = '0;
                end
                else if (shift_enable == 1'b1 && d_orig == 1'b0) begin
                    next_state = IDLE;
                    bit_stuff = '0;
                end
            end
            DETECT1: begin
                if(shift_enable == 1'b1 && d_orig == 1'b1) begin
                    next_state = DETECT2;
                    bit_stuff = '0;
                end
                else if (shift_enable == 1'b1 && d_orig == 1'b0)begin
                    next_state = IDLE;
                    bit_stuff = '0;
                end
            end  
            DETECT2: begin
                if(shift_enable == 1'b1 && d_orig == 1'b1) begin
                    next_state = DETECT3;
                    bit_stuff = '0;
                end
                else if (shift_enable == 1'b1 && d_orig == 1'b0) begin
                    next_state = IDLE;
                    bit_stuff = '0;
                end
            end
            DETECT3: begin
                if(shift_enable == 1'b1 && d_orig == 1'b1) begin
                    next_state = DETECT4;
                    bit_stuff = '0;
                end
                else if(shift_enable == 1'b1 && d_orig == 1'b0)begin
                    next_state = IDLE;
                    bit_stuff = '0;
                end
            end
            DETECT4: begin
                if(shift_enable == 1'b1 && d_orig == 1'b1) begin
                    next_state = DETECT5;
                    bit_stuff = '0;
                end
                else if (shift_enable == 1'b1 && d_orig == 1'b0)begin
                    next_state = IDLE;
                    bit_stuff = '0;
                end
            end
            DETECT5: begin
                if(shift_enable == 1'b1 && d_orig == 1'b1) begin
                    next_state = DETECT6;
                    bit_stuff = 0;
                end
                else if (shift_enable == 1'b1 && d_orig == 1'b0)begin
                    next_state = IDLE;
                    bit_stuff = '0;
                end
            end
            DETECT6: begin
                bit_stuff = '1;
                if (shift_enable == 1'b1)begin
                    next_state = STUFFR;
                end
                else begin
                    next_state = DETECT6;
                end
            end
            STUFFR: begin
                    next_state = IDLE;
                    bit_stuff = '0;
            end
    endcase
end

endmodule

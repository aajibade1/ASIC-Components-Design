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
        DETECT6} stateType;


    stateType state;
    stateType next_state;

    reg next_bit_stuff;

    always_ff @(posedge clk, negedge n_rst) begin
        if(1'b0 == n_rst) begin
            state <= IDLE;
            bit_stuff <= '0;
        end
        else begin
            state <= next_state;
            bit_stuff <= next_bit_stuff;
        end
    end

    always_comb begin
        next_state = state;
        next_bit_stuff = bit_stuff;

        case(state)
            IDLE: begin
                if(shift_enable == 1'b1 && d_orig == 1'b1) begin
                    next_state = DETECT1;
                    next_bit_stuff = '0;
                end
                else begin
                    next_state = IDLE;
                    next_bit_stuff = '0;
                end
            end
            DETECT1: begin
                if(shift_enable == 1'b1 && d_orig == 1'b1) begin
                    next_state = DETECT2;
                    next_bit_stuff = '0;
                end
                else begin
                    next_state = IDLE;
                    next_bit_stuff = '0;
                end
            end  
            DETECT2: begin
                if(shift_enable == 1'b1 && d_orig == 1'b1) begin
                    next_state = DETECT3;
                    next_bit_stuff = '0;
                end
                else begin
                    next_state = IDLE;
                    next_bit_stuff = '0;
                end
            end
            DETECT3: begin
                if(shift_enable == 1'b1 && d_orig == 1'b1) begin
                    next_state = DETECT4;
                    next_bit_stuff = '0;
                end
                else begin
                    next_state = IDLE;
                    next_bit_stuff = '0;
                end
            end
            DETECT4: begin
                if(shift_enable == 1'b1 && d_orig == 1'b1) begin
                    next_state = DETECT5;
                    next_bit_stuff = '0;
                end
                else begin
                    next_state = IDLE;
                    next_bit_stuff = '0;
                end
            end
            DETECT5: begin
                if(shift_enable == 1'b1 && d_orig == 1'b1) begin
                    next_state = DETECT6;
                    next_bit_stuff = '1;
                end
                else begin
                    next_state = IDLE;
                    next_bit_stuff = '0;
                end
            end
            DETECT6: begin
                    next_state = IDLE;
                    next_bit_stuff = '0;
            end
    end

// $Id: $
// File name:   rcu.sv
// Created:     2/26/2020
// Author:      Abdulrahman Ajibade
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Reciever Control Unit (rcu).



module rcu(
    input wire clk,
    input wire n_rst,
    input wire new_packet_detected,
    input wire packet_done,
    input wire framing_error,
    output reg sbc_clear,
    output reg sbc_enable,
    output reg load_buffer,
    output reg enable_timer
);

typedef enum bit [2:0] {
    IDLE,
    CLEAR,
    WAIT1,
    ENABLE,
    CHECKWAIT,
    CHECK,
    LOAD} stateType;

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
        sbc_clear = '0;
        sbc_enable = '0;
        load_buffer = '0;
        enable_timer = '0;

        case(state)
            IDLE: begin
                if(new_packet_detected == 1'b1) begin
                    next_state = CLEAR;
                    sbc_clear = 1'b1;
                    sbc_enable = 1'b0;
                     load_buffer = 1'b0;
                     enable_timer = 1'b0;
                end
                else begin
                    next_state = IDLE;
                     sbc_clear = 1'b0;
                     sbc_enable = 1'b0;
                     load_buffer = 1'b0;
                     enable_timer = 1'b0;
                end
            end
            CLEAR: begin
                    next_state = WAIT1;
                     sbc_clear = 1'b0;
                     sbc_enable = 1'b0;
                     load_buffer = 1'b0;
                     enable_timer = 1'b0;
            end
            WAIT1: begin
                    next_state = ENABLE;
                     sbc_clear = 1'b0;
                     sbc_enable = 1'b0;
                     load_buffer = 1'b0;
                     enable_timer = 1'b1;
            end 
              
            ENABLE: begin
                if(packet_done == 1'b1) begin
                    next_state = CHECKWAIT;
                     sbc_clear = 1'b0;
                     sbc_enable = 1'b1;
                     load_buffer = 1'b0;
                     enable_timer = 1'b0;

                end
                else begin
                    next_state = ENABLE;
                     sbc_clear = 1'b0;
                     sbc_enable = 1'b0;
                     load_buffer = 1'b0;
                     enable_timer = 1'b1;
                end
            end
           CHECKWAIT: begin
                    next_state = CHECK;
                     sbc_clear = 1'b0;
                     sbc_enable = 1'b1;
                     load_buffer = 1'b0;
                     enable_timer = 1'b0;
            end
            CHECK: begin
                if(framing_error == 1'b1) begin
                    next_state = IDLE;
                     sbc_clear = 1'b0;
                     sbc_enable = 1'b0;
                     load_buffer = 1'b0;
                     enable_timer = 1'b0;
                end
                else begin
                    next_state = LOAD;
                     sbc_clear = 1'b0;
                     sbc_enable = 1'b0;
                     load_buffer = 1'b1;
                     enable_timer = 1'b0;
                end
            end
            LOAD: begin
                    next_state = IDLE;
                     sbc_clear = 1'b0;
                     sbc_enable = 1'b0;
                     load_buffer = 1'b0;
                     enable_timer = 1'b0;
            end
        endcase
    end   
endmodule

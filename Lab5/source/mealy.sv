// $Id: $
// File name:   mealy.sv
// Created:     2/18/2020
// Author:      Abdulrahman Ajibade
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Mealy Machime '1101' Detector.


module mealy(
    input wire clk,
    input wire n_rst,
    input wire i,
    output reg o
);

typedef enum bit [2:0] {
    IDLE,
    STATE1,
    STATE2,
    STATE3} stateType;

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

        case(state)
            IDLE: begin
                if(i == 1'b1) begin
                    next_state = STATE1;
                end
                else begin
                    next_state = IDLE;
                end
            end
            STATE1: begin
                if(i == 1'b1) begin
                    next_state = STATE2;
                end
                else begin
                    next_state = IDLE;
                end
            end
            STATE2: begin
                if(i == 1'b1) begin
                    next_state = STATE2;
                end
                else begin
                    next_state = STATE3;
                end
            end
            STATE3: begin
                if(i == 1'b1) begin
                    next_state = STATE1;
                end
                else begin
                    next_state = IDLE;
                end
            end
        endcase
    end
    
    always_comb begin
        o = 1'b0;        
        if (state == STATE3) begin
            if(i == 1'b1) begin
                o = 1'b1;
            end
        end
    end
endmodule

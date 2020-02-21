// $Id: $
// File name:   moore.sv
// Created:     2/18/2020
// Author:      Abdulrahman Ajibade
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Moore Machime '1101' Detector.


module moore(
    input wire clk,
    input wire n_rst,
    input wire i,
    output reg o
);

typedef enum bit [2:0] {
    IDLE,
    RV1,
    RV11,
    RV110,
    RV1101} stateType;

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
                    next_state = RV1;
                end
                else begin
                    next_state = IDLE;
                end
            end
            RV1: begin
                if(i == 1'b1) begin
                    next_state = RV11;
                end
                else begin
                    next_state = IDLE;
                end
            end
             RV11: begin
                if(i == 1'b1) begin
                    next_state = RV11;
                end
                else begin
                    next_state = RV110;;
                end
            end
             RV110: begin
                if(i == 1'b1) begin
                    next_state = RV1101;
                end
                else begin
                    next_state = IDLE;
                end
            end
              RV1101: begin
                if(i == 1'b1) begin
                    next_state = RV11;
                end
                else begin
                    next_state = IDLE;
                end
            end
        endcase
    end
    
    always_comb begin
        o = 1'b0;        
        if (state == RV1101) begin
            o = 1'b1;
        end
    end

endmodule

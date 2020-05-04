// $Id: $
// File name:   rcu.sv
// Created:     4/22/2020
// Author:      Abdulrahman Ajibade
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Rcu Module.

module rcu (input wire clk, input wire n_rst, input wire d_edge,
    input wire eop, input wire shift_enable, input wire[7:0] rcv_data,
    input wire byte_received, output reg rcving, output reg w_enable,
    output reg r_error, input wire[3:0] bit_count, output reg[3:0] PID
);

typedef enum bit [4:0] {
    IDLE,
    BEGINRCV,
    WAIT,
    CHECKSYNC,
    PIDWAIT,
    WAIT1,
    OUTFIFO,
    EOPVALID,
    EOPGOOD,
    WAITEOP,
    WAITEOP1,
    ERROR,
    WAITERR,
    WAITERR2,
    WAITERR3} stateType;

    stateType state;
    stateType next_state;

    reg next_rcving;
    reg next_r_error;
    reg next_w_enable;
    reg [3:0] next_PID;

    always_ff @(posedge clk, negedge n_rst) begin
        if(1'b0 == n_rst) begin
            state <= IDLE;
            rcving <= '0;
            r_error <= '0;
            w_enable <= '0;
            PID <= '1;
        end
        else begin
            state <= next_state;
            rcving <= next_rcving;
            r_error <= next_r_error;
            w_enable <= next_w_enable;
            PID <= next_PID;
        end
    end

    always_comb begin
        next_state = state;
        next_w_enable = w_enable;;
        next_r_error = r_error;
        next_rcving = rcving;
        next_PID = PID;

        case(state)
            IDLE: begin
                if (d_edge == 1'b1) begin
                    next_state = BEGINRCV;
                    next_rcving = '1;
                    next_r_error = '0;
                    next_w_enable = '0;
                    next_PID = '1;
                end 
                else begin 
                    next_state = IDLE;
                    next_rcving = '0;
                    next_r_error = '0;
                    next_w_enable = '0;
                    next_PID = '1;
                end
            end
            BEGINRCV: begin
                next_state = WAIT;
                next_rcving = '1;
                next_r_error = '0;
                next_w_enable = '0;
            end
            WAIT: begin
                if (byte_received == 1'b0) begin
                    next_state = WAIT;
                    next_rcving = '1;
                end
                else if(byte_received == 1'b1) begin
                    next_state = CHECKSYNC;
                    next_rcving = '1;
                end
            end
            CHECKSYNC: begin
                if (rcv_data == 8'b10000000) begin
                    next_state = PIDWAIT;
                    next_rcving = '1;
                    next_w_enable = '0; 
                end
                else begin
                    next_state = ERROR;
                    next_rcving = '1;
                    next_w_enable = '0;
                    next_r_error = '1;
                end
            end
            PIDWAIT: begin
                if (eop == 1'b1 && shift_enable == 1'b1) begin
                    next_state = EOPVALID;
                    next_rcving = '1;
                    next_w_enable = '0;
                end
                else if(byte_received == 1'b0) begin
                    next_state = PIDWAIT;
                    next_rcving = '1;
                    next_w_enable = '0;
                end
                else if(byte_received == 1'b1) begin
                    next_state = WAIT1;
                    next_rcving = '1;
                    next_w_enable = '1;
                    next_PID = rcv_data[3:0];
                end
            end
            WAIT1: begin
                if (eop == 1'b1 && shift_enable == 1'b1) begin
                    next_state = EOPVALID;
                    next_rcving = '1;
                    next_w_enable = '0;
                end
                else if(byte_received == 1'b0) begin
                    next_state = WAIT1;
                    next_rcving = '1;
                    next_w_enable = '0;
                end
                else if(byte_received == 1'b1) begin
                    next_state = OUTFIFO;
                    next_rcving = '1;
                    next_w_enable = '1;
                end
            end
            OUTFIFO: begin
                next_state = WAIT1;
                next_rcving = '1;
                next_w_enable = '0;
            end
            EOPVALID: begin
                if (bit_count == 1'd1) begin
                    next_state = EOPGOOD;
                    next_rcving = '1;
                    next_w_enable = '0;
                    next_r_error = '0;
                end
                else begin
                    next_state = WAITERR;
                    next_rcving = '1;
                    next_r_error = '1;
                    next_w_enable = '0;
                end
            end
            EOPGOOD: begin
                next_rcving = '1;
                if (shift_enable == 1'b1) begin
                    next_state = WAITEOP;
                    next_rcving = '1;
                end
                else begin
                    next_state = EOPGOOD;
                end
            end
            WAITEOP: begin
                next_rcving = '1;
                 if (shift_enable == 1'b1) begin
                    next_state = WAITEOP1;
                    next_rcving = '1;
                end
                else begin
                    next_state = WAITEOP;
                end               
            end
            WAITEOP1: begin
                next_state = IDLE;
                next_rcving = '0;
                next_r_error = '0;
            end
            ERROR: begin
                next_rcving = '1;
                next_r_error = '1;
                next_w_enable = '0;
                if (eop == 1'b1 && shift_enable == 1'b1) begin
                    next_state = WAITERR;
                    next_rcving = '1;
                    next_r_error = '1;
                    next_w_enable = '0;
                end 
                else begin
                    next_state = ERROR;
                end
            end
            WAITERR: begin
                if (shift_enable == 1'b1) begin
                    next_state = WAITERR2;
                    next_r_error = 1'b1;
                    next_rcving = 1'b1;
                end
                else begin
                    next_state = WAITERR;
                    next_r_error = 1'b1;
                    next_rcving = 1'b1;
                end
            end
            WAITERR2: begin 
                 if (shift_enable == 1'b1) begin
                    next_state = WAITERR3;
                    next_r_error = 1'b1;
                    next_rcving = 1'b0;
                end
                else begin
                    next_state = WAITERR2;
                    next_r_error = 1'b1;
                    next_rcving = 1'b1;
                end               
            end
             WAITERR3: begin 
                 if (d_edge == 1'b1) begin
                    next_state = BEGINRCV;
                    next_r_error = 1'b0;
                    next_rcving = 1'b1;
                end
                else begin
                    next_state = WAITERR3;
                    next_r_error = 1'b1;
                    next_rcving = 1'b0;
                end               
            end       
        endcase
    end
endmodule

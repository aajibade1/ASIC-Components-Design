// $Id: $
// File name:   controller.sv
// Created:     3/4/2020
// Author:      Abdulrahman Ajibade
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Controller module.


module controller (input wire clk, input wire n_rst, input wire dr, input wire lc, input wire overflow,
                   output reg cnt_up, output reg clear, output reg modwait, output reg[2:0] op,
                   output reg[3:0] src1, output reg[3:0] src2, output reg[3:0] dest, output reg err,
                   output reg ff_done
                  );


typedef enum bit [4:0] {
    IDLE, LOAD1, WAIT1, LOAD2,
    WAIT2, LOAD3, WAIT3, LOAD4,
    STORE, ZERO, SORT1, SORT2, SORT3,
    SORT4, MUL1, MUL2, MUL3, MUL4, 
    ADD1, SUB1, ADD2, SUB2, EIDLE} stateType;

    stateType next_state;
    stateType state;

    reg next_clear;
    reg next_cnt_up;
    reg next_modwait;
    reg [2:0]next_op;
    reg [3:0]next_src1;
    reg [3:0]next_src2;
    reg [3:0]next_dest;
    reg next_err;
    reg next_ff_done;

    always_ff @(posedge clk, negedge n_rst) begin
        if(1'b0 == n_rst) begin
            state <= IDLE;
            clear <= '0;
            cnt_up <= '0;
            modwait <= '0;
            op <= '0;
            src1 <= '0;
            src2 <= '0;
            dest <= '0;
            err <= '0;

        end
        else begin
            state <= next_state;
            clear <= next_clear;
            cnt_up <= next_cnt_up;
            modwait <= next_modwait;
            op <= next_op; 
            src1 <= next_src1;
            src2 <= next_src2;
            dest <= next_dest;
            err <= next_err;
        end
    end

    always_comb begin
        next_state = state;
        next_clear = clear;
        next_cnt_up = cnt_up;
        next_modwait = modwait;
        next_op = op;
        next_src1 = src1;
        next_src2 = src2;
        next_dest = dest;
        next_err = err;
        ff_done = '0;

        case(state)
            IDLE: begin
                if (lc == 1'b1) begin
                    next_state = LOAD1;
                    next_clear = '1;
                    next_cnt_up = '0;
                    next_modwait = '1;
                    next_op = 3'b011;
                    next_src1 = '0;
                    next_src2 = '0;
                    next_dest = 4'd10;
                    next_err = '0;
                end
                else if (dr ==1'b1) begin
                    next_state = STORE;
                    next_clear = '0;
                    next_cnt_up = '0;
                    next_modwait = '1;
                    next_op = 3'b010;
                    next_src1 = '0;
                    next_src2 = '0;
                    next_dest = 4'd5;
                    next_err = '0; 
                    ff_done = 1'b0;
                end
                else begin
                    next_state = IDLE;
                    next_clear = '0;
                    next_cnt_up = '0;
                    next_modwait = '0;
                    next_op = '0;
                    next_src1 = '0;
                    next_src2 = '0;
                    next_dest = '0;
                    next_err = '0;  
                    ff_done = 1'b0;
                end
            end
            LOAD1: begin
                    next_state = WAIT1;
                    next_clear = '0;
                    next_cnt_up = '0;
                    next_modwait = '0;
                    next_op = '0;
                    next_src1 = '0;
                    next_src2 = '0;
                    next_dest = '0;
                    next_err = '0;
            end
            WAIT1: begin
                if (lc == 1'b1) begin
                    next_state = LOAD2;
                    next_clear = '0;
                    next_cnt_up = '0;
                    next_modwait = '1;
                    next_op = 3'b011;
                    next_src1 = '0;
                    next_src2 = '0;
                    next_dest = 4'd9;
                    next_err = '0;
                end
                else begin
                    next_state = WAIT1;
                    next_clear = '0;
                    next_cnt_up = '0;
                    next_modwait = '0;
                    next_op = '0;
                    next_src1 = '0;
                    next_src2 = '0;
                    next_dest = '0;
                    next_err = '0;               
                end
            end
            LOAD2: begin
                    next_state = WAIT2;
                    next_clear = '0;
                    next_cnt_up = '0;
                    next_modwait = '0;
                    next_op = '0;
                    next_src1 = '0;
                    next_src2 = '0;
                    next_dest = '0;
                    next_err = '0;
            end
            WAIT2:begin
                if (lc == 1'b1) begin
                    next_state = LOAD3;
                    next_clear = '0;
                    next_cnt_up = '0;
                    next_modwait = '1;
                    next_op = 3'b011;
                    next_src1 = '0;
                    next_src2 = '0;
                    next_dest = 4'd8;
                    next_err = '0;
                end
                else begin
                    next_state = WAIT2;
                    next_clear = '0;
                    next_cnt_up = '0;
                    next_modwait = '0;
                    next_op = '0;
                    next_src1 = '0;
                    next_src2 = '0;
                    next_dest = '0;
                    next_err = '0;               
                end
     
            end
            LOAD3: begin
                next_state = WAIT3;
                next_clear = '0;
                next_cnt_up = '0;
                next_modwait = '0;
                next_op = '0;
                next_src1 = '0;
                next_src2 = '0;
                next_dest = '0;
                next_err = '0;     
            end
            WAIT3: begin
                if (lc == 1'b1) begin
                    next_state = LOAD4;
                    next_clear = '0;
                    next_cnt_up = '0;
                    next_modwait = '1;
                    next_op = 3'b011;
                    next_src1 = '0;
                    next_src2 = '0;
                    next_dest = 4'd7;
                    next_err = '0;
                end
                else begin
                    next_state = WAIT3;
                    next_clear = '0;
                    next_cnt_up = '0;
                    next_modwait = '0;
                    next_op = '0;
                    next_src1 = '0;
                    next_src2 = '0;
                    next_dest = '0;
                    next_err = '0;               
                end
            end
            LOAD4: begin
                next_state = IDLE;
                next_clear = '0;
                next_cnt_up = '0;
                next_modwait = '0;
                next_op = '0;
                next_src1 = '0;
                next_src2 = '0;
                next_dest = '0;
                next_err = '0;     
            end
            STORE: begin
                if (dr == 1'b1) begin
                    next_state = ZERO;
                    next_clear = '0;
                    next_cnt_up = '1;
                    next_modwait = '1;
                    next_op = 3'b101;
                    next_src1 = 4'd11;
                    next_src2 = 4'd11;
                    next_dest = 4'd0;
                    next_err = '0;
                end
                else if (dr ==1'b0) begin
                    next_state = EIDLE;
                    next_clear = '0;
                    next_cnt_up = '0;
                    next_modwait = '0;
                    next_op = '0;
                    next_src1 = '0;
                    next_src2 = '0;
                    next_dest = '0;
                    next_err = '1;               
                end
            end
            ZERO: begin
                next_state = SORT1;
                next_clear = '0;
                next_cnt_up = '0;
                next_op = 3'b001;
                next_src1 = 4'd2;
                next_src2 = '0;
                next_dest = 4'd1;
                next_err = '0;     
            end
            SORT1: begin
                next_state = SORT2;
                next_clear = '0;
                next_cnt_up = '0;
                next_op = 3'b001;
                next_src1 = 4'd3;
                next_src2 = '0;
                next_dest = 4'd2;
                next_err = '0; 
                ff_done = 1'b1;
            end
            SORT2: begin
                next_state = SORT3;
                next_clear = '0;
                next_cnt_up = '0;
                next_op = 3'b001;
                next_src1 = 4'd4;
                next_src2 = '0;
                next_dest = 4'd3;
                next_err = '0;     
            end
            SORT3: begin
                next_state = SORT4;
                next_clear = '0;
                next_cnt_up = '0;
                next_op = 3'b001;
                next_src1 = 4'd5;
                next_src2 = '0;
                next_dest = 4'd4;
                next_err = '0;     
            end
            SORT4: begin
             next_state = MUL1;
                next_clear = '0;
                next_cnt_up = '0;
                next_op = 3'b110;
                next_src1 = 4'd1;
                next_src2 = 4'd7;
                next_dest = 4'd6;
                next_err = '0;     
            end
            MUL1: begin
             next_state = ADD1;
                next_clear = '0;
                next_cnt_up = '0;
                next_op = 3'b100;
                next_src1 = 4'd0;
                next_src2 = 4'd6;
                next_dest = 4'd0;
                next_err = '0;     
            end
            MUL2: begin
             next_state = SUB1;
                next_clear = '0;
                next_cnt_up = '0;
                next_op = 3'b101;
                next_src1 = 4'd0;
                next_src2 = 4'd6;
                next_dest = 4'd0;
                next_err = '0;     
            end
            MUL3: begin
             next_state = ADD2;
                next_clear = '0;
                next_cnt_up = '0;
                next_op = 3'b100;
                next_src1 = 4'd0;
                next_src2 = 4'd6;
                next_dest = 4'd0;
                next_err = '0;     
            end
            MUL4: begin
             next_state = SUB2;
                next_clear = '0;
                next_cnt_up = '0;
                next_op = 3'b101;
                next_src1 = 4'd0;
                next_src2 = 4'd6;
                next_dest = 4'd0;
                next_err = '0;     
            end
            ADD1: begin
                 if (overflow == 1'b1) begin
                    next_state = EIDLE;
                    next_clear = '0;
                    next_cnt_up = '0;
                    next_modwait = '0;
                    next_op = '0;
                    next_src1 = '0;
                    next_src2 = '0;
                    next_dest = '0;
                    next_err = '1;
                end
                else if (overflow ==1'b0) begin
                    next_state = MUL2;
                    next_clear = '0;
                    next_cnt_up = '0;
                    next_op = 3'b110;
                    next_src1 = 4'd2;
                    next_src2 = 4'd8;
                    next_dest = 4'd6;
                    next_err = '0;               
                end   
            end
            SUB1: begin
                 if (overflow == 1'b1) begin
                    next_state = EIDLE;
                    next_clear = '0;
                    next_cnt_up = '0;
                    next_modwait = '0;
                    next_op = '0;
                    next_src1 = '0;
                    next_src2 = '0;
                    next_dest = '0;
                    next_err = '1;
                end
                else if (overflow == 1'b0) begin
                    next_state = MUL3;
                    next_clear = '0;
                    next_cnt_up = '0;
                    next_op = 3'b110;
                    next_src1 = 4'd3;
                    next_src2 = 4'd9;
                    next_dest = 4'd6;
                    next_err = '0;               
                end   
            end
            ADD2: begin
                 if (overflow == 1'b1) begin
                    next_state = EIDLE;
                    next_clear = '0;
                    next_cnt_up = '0;
                    next_modwait = '0;
                    next_op = '0;
                    next_src1 = '0;
                    next_src2 = '0;
                    next_dest = '0;
                    next_err = '1;
                end
                else if (overflow ==1'b0) begin
                    next_state = MUL4;
                    next_clear = '0;
                    next_cnt_up = '0;
                    next_op = 3'b110;
                    next_src1 = 4'd4;
                    next_src2 = 4'd10;
                    next_dest = 4'd6;
                    next_err = '0;               
                end  
            end
            SUB2: begin
                if (overflow == 1'b1) begin
                    next_state = EIDLE;
                    next_clear = '0;
                    next_cnt_up = '0;
                    next_modwait = '0;
                    next_op = '0;
                    next_src1 = '0;
                    next_src2 = '0;
                    next_dest = '0;
                    next_err = '1;
                end
                else if (overflow == 1'b0) begin
                    next_state = IDLE;
                    next_clear = '0;
                    next_cnt_up = '0;
                    next_modwait = '0;
                    next_op = '0;
                    next_src1 = '0;
                    next_src2 = '0;
                    next_dest = '0;
                    next_err = '0; 
                end
            end
            EIDLE: begin
                if (lc == 1'b1) begin
                    next_state = LOAD1;
                    next_clear = '1;
                    next_cnt_up = '0;
                    next_modwait = '1;
                    next_op = 3'b110;
                    next_src1 = '0;
                    next_src2 = '0;
                    next_dest = 4'd10;
                    next_err = '0;
                end
                else if (dr == 1'b1) begin
                    next_state = STORE;
                    next_clear = '0;
                    next_cnt_up = '0;
                    next_modwait = '1;
                    next_op = 3'b010;
                    next_src1 = '0;
                    next_src2 = '0;
                    next_dest = 4'd5;
                    next_err = '0;
                end
                else if (dr ==1'b0) begin
                    next_state = EIDLE;
                    next_clear = '0;
                    next_cnt_up = '0;
                    next_modwait = '0;
                    next_op = '0;
                    next_src1 = '0;
                    next_src2 = '0;
                    next_dest = '0;
                    next_err = '1;               
                end    
            end 
        endcase
    end
endmodule

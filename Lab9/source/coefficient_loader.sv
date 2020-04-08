// $Id: $
// File name:   coefficient_loader.sv
// Created:     4/2/2020
// Author:      Abdulrahman Ajibade
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Coefficient Loader Module.


module coefficient_loader(
    input wire clk, input wire n_reset,
    input wire new_coefficient_set,
    input wire modwait,
    output reg load_coeff,
    output reg [1:0] coefficient_num,
    output reg cl_done, output reg cl_busy
);

typedef enum bit [3:0] {
    IDLE, LOAD1, WAIT1, LOAD2,
    WAIT2, LOAD3, WAIT3, LOAD4, WAIT4} stateType;

    stateType next_state;
    stateType state;

    reg [1:0] next_coff_num;
    reg next_load_coeff;
    reg next_cl_done;
    reg next_cl_busy;

always_ff @ (posedge clk, negedge n_reset) begin
    if (n_reset == 1'b0) begin
        state <= IDLE;
        coefficient_num <= '0;
        load_coeff <= '0;
        cl_busy <= '0;
    end
    else begin
        state <= next_state;
        coefficient_num <= next_coff_num;
        load_coeff <= next_load_coeff;
        cl_busy <= next_cl_busy;
    end
end

always_comb begin
    next_state = state;
    next_coff_num = coefficient_num;
    next_load_coeff = load_coeff;
    cl_done = 1'b0;
    next_cl_busy = cl_busy;
    case(state)
        IDLE: begin
            if (new_coefficient_set == 1'b1) begin
                next_state = LOAD1;
                next_coff_num = '0;
                next_load_coeff = 1'b1;
                cl_done = '0;
                next_cl_busy = 1'b1;
            end
            else begin
                next_state = IDLE;
                next_coff_num = '0;
                next_load_coeff = '0;
                cl_done = '0;
                next_cl_busy = 1'b0;
            end
        end
        
        LOAD1: begin
            next_state = WAIT1;
            next_load_coeff = 1'b0;
            next_cl_busy = 1'b1;
        end

        WAIT1: begin
            if(modwait == 1'b1) begin
                next_state = WAIT1;
                next_load_coeff = 1'b0;
                next_cl_busy = 1'b1;
            end
            else if(modwait == 1'b0) begin
                next_state = LOAD2;
                next_coff_num = 2'b01;
                next_load_coeff = 1'b1;
                next_cl_busy = 1'b1;
            end
        end

        LOAD2: begin
            next_state = WAIT2;
            next_load_coeff = 1'b0;
            next_cl_busy = 1'b1;
        end

        WAIT2: begin
            if(modwait == 1'b1) begin
                next_state = WAIT2;
                next_load_coeff = 1'b0;
                next_cl_busy = 1'b1;
            end
            else if(modwait == 1'b0) begin
                next_state = LOAD3;
                next_coff_num = 2'b10;
                next_load_coeff = 1'b1;
                next_cl_busy = 1'b1;
            end
        end

        LOAD3: begin
            next_state = WAIT3;
            next_load_coeff = 1'b0;
            next_cl_busy = 1'b1;
        end


        WAIT3: begin
            if(modwait == 1'b1) begin
                next_state = WAIT3;
                next_load_coeff = 1'b0;
                next_cl_busy = 1'b1;
            end
            else if(modwait == 1'b0) begin
                next_state = LOAD4;
                next_coff_num = 2'b11;
                next_load_coeff = 1'b1; 
                next_cl_busy = 1'b1;
            end
        end

        LOAD4: begin
            next_state = WAIT4;
            next_load_coeff = 1'b0;
            next_cl_busy = 1'b1;
        end

        WAIT4: begin
            next_state = IDLE;
            cl_done = 1'b1;
            next_cl_busy = 1'b0;
        end
    endcase
end
endmodule

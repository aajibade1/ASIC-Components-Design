// $Id: $
// File name:   apb_slave.sv
// Created:     3/23/2020
// Author:      Abdulrahman Ajibade
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: APB-Slave Interface.

module apb_slave (
    input wire clk, input wire n_rst, input wire [7:0] rx_data,
    input wire data_ready, input wire overrun_error, input wire framing_error,
    input wire psel, input wire [2:0] paddr, input wire penable, input wire pwrite,
    input wire [7:0] pwdata, output reg[7:0] prdata, output reg pslverr,
    output reg data_read, output reg [3:0] data_size, output reg [13:0] bit_period);

    reg[2:0] read_select;
    reg[2:0] write_select;
    reg[13:0] next_bit_period_temp;
    reg[3:0] next_data_size_temp;
    reg[13:0] bit_period_temp;
    reg[3:0] data_size_temp;
    reg[7:0] next_prdata;
    

    always_ff @ (posedge clk, negedge n_rst) begin
        if (n_rst == 1'b0) begin
            bit_period_temp <= '0;
            data_size_temp <= '0;
            prdata <= '0;
        end
        else begin
            data_size_temp <= next_data_size_temp;
            bit_period_temp <= next_bit_period_temp;
            prdata <= next_prdata;
        end
    end

    always_comb begin : SET_OUTPUTS
        bit_period = bit_period_temp;
        data_size = data_size_temp;
    end

    always_comb begin : ADDRESS_MAPPING
        pslverr = 1'b0;
        write_select = '0;
        read_select = '0;
        if (pwrite == 1'b1) begin
            if (penable && psel) begin
                if (paddr == 3'd2) begin
                    write_select = 3'd1;
                end
                else if (paddr == 3'd3) begin
                    write_select = 3'd2;
                end
                else if (paddr == 3'd4) begin
                    write_select = 3'd3;
                end
                else begin
                    pslverr = 1'b1;
                end
            end
        end
        else if(pwrite == 1'b0) begin
            if(psel) begin
                if (paddr == 3'd0) begin
                    read_select = 3'd1;
                end
                else if (paddr == 3'd1) begin
                    read_select = 3'd2;
                end
                else if (paddr == 3'd2) begin
                    read_select = 3'd3;
                end
                else if (paddr == 3'd3) begin
                    read_select = 3'd4;
                end
                else if (paddr == 3'd4) begin
                    read_select = 3'd5;
                end
                else if (paddr == 3'd6) begin
                    read_select = 3'd6;
                end
            end
        end
    end

    always_comb begin : PRDATA 
        next_prdata = prdata;
        data_read = 1'b0;
        if (read_select == 3'd1) begin
            next_prdata = {7'b0000000, data_ready};
        end
        else if (read_select == 3'd2) begin
            next_prdata = {6'b000000, {overrun_error, framing_error}}; 
        end
        else if (read_select == 3'd3) begin
            next_prdata = bit_period[7:0];
        end
        else if (read_select == 3'd4) begin
            next_prdata = {2'b00, bit_period[13:8]};
        end
        else if (read_select == 3'd5) begin
            next_prdata = {4'b0000,data_size};
        end
        else if (read_select == 3'd6) begin
            if (data_size == 4'd5) begin
                next_prdata = {3'b000, rx_data[7:3]};
                data_read = 1'b1;
            end
            else if (data_size == 4'd7) begin
                next_prdata = {1'b0, rx_data[7:1]};
                data_read = 1'b1;
            end
            else begin
                next_prdata = rx_data;
                data_read = 1'b1;
            end
        end
    end

    always_comb begin : PWDATA
        if (write_select == 3'd1) begin
            next_bit_period_temp[7:0] = pwdata;
        end
        else begin
            next_bit_period_temp[7:0] = bit_period[7:0]; 
        end

        if (write_select == 3'd2) begin
            next_bit_period_temp[13:8] = pwdata[5:0];
        end
        else begin
            next_bit_period_temp[13:8] = bit_period[13:8];
        end

        if (write_select == 3'd3) begin
            next_data_size_temp = pwdata[3:0];
        end
        else begin
            next_data_size_temp = data_size;
        end
    end
                 
endmodule


// $Id: $
// File name:   ahb_lite_slave.sv
// Created:     4/1/2020
// Author:      Abdulrahman Ajibade
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: AHB-Lite Slave Module.


module ahb_lite_slave (
    input wire clk, input wire n_rst,
    input wire [1:0] coefficient_num, input wire modwait,
    input wire [15:0] fir_out, input wire err, input wire hsel,
    input wire [3:0] haddr, input wire hsize, input wire cl_done, input wire cl_busy,
    input wire ff_done,
    input wire [1:0] htrans, input wire hwrite, input wire [15:0] hwdata,
    output reg [15:0] sample_data, output reg data_ready, 
    output reg new_coefficient_set, output reg [15:0] fir_coefficient,
    output reg [15:0] hrdata, output reg hresp
    );


    reg [4:0] read_select;
    reg [4:0] write_select;
    reg [4:0] next_write_select;
    reg [4:0] next_read_select;
    reg [15:0] f_zero;
    reg [15:0] next_f_zero;
    reg [15:0] f_one;
    reg [15:0] next_f_one;   
    reg [15:0] f_two;
    reg [15:0] next_f_two;  
    reg [15:0] f_three;
    reg [15:0] next_f_three; 
    reg [15:0] sample_data_temp;
    reg [15:0] next_sample_data_temp;
    reg new_coff_set_temp;
    reg next_new_coff_set_temp;
    reg next_data_ready;
    reg busy;
    
    always_ff @ (posedge clk, negedge n_rst) begin
        if (n_rst == 1'b0) begin
            f_zero <= '0;
            f_one <= '0;
            f_two <= '0;
            f_three <= '0;
            sample_data_temp <= '0;
            new_coff_set_temp <= '0;
            write_select <= '0;
            read_select <= '0;
            data_ready <= '0;
        end
        else begin
            f_zero <= next_f_zero;
            f_one <= next_f_one;
            f_two <= next_f_two;
            f_three <= next_f_three;
            write_select <= next_write_select;
            read_select <= next_read_select;
            sample_data_temp <= next_sample_data_temp;
            new_coff_set_temp <= next_new_coff_set_temp;
            data_ready <= next_data_ready;
        end
    end

    always_comb begin : SET_OUTPUTS
        fir_coefficient = '0;
        if(new_coff_set_temp == 1'b1) begin
            if (coefficient_num == 2'd0) begin
                fir_coefficient = f_zero;
            end
            else if (coefficient_num == 2'd1) begin
                fir_coefficient = f_one;
            end
             else if (coefficient_num == 2'd2) begin
                fir_coefficient = f_two;
            end 
             else if (coefficient_num == 2'd3) begin
                fir_coefficient = f_three;
            end
        end
        sample_data = sample_data_temp;
        new_coefficient_set = new_coff_set_temp;
    end 

    always_comb begin: ADDRESS_MAPPING
        hresp = 1'b0;
        next_write_select = '0;
        next_read_select = '0;
        if(hsel && (htrans != 1'b0)) begin
            if (hwrite == 1'b1) begin
                if(haddr == 4'd4) begin
                    if (hsize == 1'b1) begin
                        next_write_select = 5'd1;
                    end
                    else if(hsize == 1'b0) begin
                        next_write_select = 5'd2;
                    end
                end
                else if(haddr == 4'd5) begin
                     if (hsize == 1'b1) begin
                        next_write_select = 5'd3;
                    end
                    else if(hsize == 1'b0) begin
                        next_write_select = 5'd4;
                    end                  
                end
                else if(haddr == 4'd6) begin
                     if (hsize == 1'b1) begin
                        next_write_select = 5'd5;
                    end
                    else if(hsize == 1'b0) begin
                        next_write_select = 5'd6;
                    end                  
                end
                else if(haddr == 4'd7) begin
                     if (hsize == 1'b1) begin
                        next_write_select = 5'd7;
                    end
                    else if(hsize == 1'b0) begin
                        next_write_select = 5'd8;
                    end                  
                end
                else if(haddr == 4'd8) begin
                     if (hsize == 1'b1) begin
                        next_write_select = 5'd9;
                    end
                    else if(hsize == 1'b0) begin
                        next_write_select = 5'd10;
                    end                 
                end
                else if(haddr == 4'd9) begin
                     if (hsize == 1'b1) begin
                        next_write_select = 5'd11;
                    end
                    else if(hsize == 1'b0) begin
                        next_write_select = 5'd12;
                    end                 
                end
                else if(haddr == 4'd10) begin
                     if (hsize == 1'b1) begin
                        next_write_select = 5'd13;
                    end
                    else if(hsize == 1'b0) begin
                        next_write_select = 5'd14;
                    end                  
                end
                else if(haddr == 4'd11) begin
                     if (hsize == 1'b1) begin
                        next_write_select = 5'd15;
                    end
                    else if(hsize == 1'b0) begin
                        next_write_select = 5'd16;
                    end                
                end
                else if(haddr == 4'd12) begin
                     if (hsize == 1'b1) begin
                        next_write_select = 5'd17;
                    end
                    else if(hsize == 1'b0) begin
                        next_write_select = 5'd18;
                    end                
                end
                else if(haddr == 4'd13) begin
                     if (hsize == 1'b1) begin
                        next_write_select = 5'd19;
                    end
                    else if(hsize == 1'b0) begin
                        next_write_select = 5'd20;
                    end            
                end
                else if(haddr == 4'd14) begin
                    next_write_select = 5'd21;                
                end
                else begin
                    hresp = 1'b1;
                end
            end
            else if(hwrite == 1'b0) begin
                 if(haddr == 4'd0) begin
                    if (hsize == 1'b1) begin
                        next_read_select = 5'd1;     
                    end
                    else if(hsize == 1'b0) begin
                        next_read_select = 5'd2;
                    end
                end
                else if(haddr == 4'd1) begin
                     if (hsize == 1'b1) begin
                        next_read_select = 5'd3;     
                    end
                    else if(hsize == 1'b0) begin
                        next_read_select = 5'd4;
                    end              
                end
                else if(haddr == 4'd2) begin
                     if (hsize == 1'b1) begin
                        next_read_select = 5'd5;     
                    end
                    else if(hsize == 1'b0) begin
                        next_read_select = 5'd6;
                    end                  
                end
                else if(haddr == 4'd3) begin
                     if (hsize == 1'b1) begin
                        next_read_select = 5'd7;     
                    end
                    else if(hsize == 1'b0) begin
                        next_read_select = 5'd8;
                    end                 
                end
                else if(haddr == 4'd4) begin
                     if (hsize == 1'b1) begin
                        next_read_select = 5'd9;     
                    end
                    else if(hsize == 1'b0) begin
                        next_read_select = 5'd10;
                    end           
                end
                else if(haddr == 4'd5) begin
                     if (hsize == 1'b1) begin
                        next_read_select = 5'd11;     
                    end
                    else if(hsize == 1'b0) begin
                        next_read_select = 5'd12;
                    end                 
                end
                else if(haddr == 4'd6) begin
                     if (hsize == 1'b1) begin
                        next_read_select = 5'd13;     
                    end
                    else if(hsize == 1'b0) begin
                        next_read_select = 5'd14;
                    end                 
                end
                else if(haddr == 4'd7) begin
                     if (hsize == 1'b1) begin
                        next_read_select = 5'd15;     
                    end
                    else if(hsize == 1'b0) begin
                        next_read_select = 5'd16;
                    end            
                end
                else if(haddr == 4'd8) begin
                     if (hsize == 1'b1) begin
                        next_read_select = 5'd17;     
                    end
                    else if(hsize == 1'b0) begin
                        next_read_select = 5'd18;
                    end                
                end
                else if(haddr == 4'd9) begin
                     if (hsize == 1'b1) begin
                        next_read_select = 5'd19;     
                    end
                    else if(hsize == 1'b0) begin
                        next_read_select = 5'd20;
                    end                  
                end
                else if(haddr == 4'd10) begin
                     if (hsize == 1'b1) begin
                        next_read_select = 5'd21;     
                    end
                    else if(hsize == 1'b0) begin
                        next_read_select = 5'd22;
                    end                  
                end
                else if(haddr == 4'd11) begin
                     if (hsize == 1'b1) begin
                        next_read_select = 5'd23;     
                    end
                    else if(hsize == 1'b0) begin
                        next_read_select = 5'd24;
                    end                 
                end
                else if(haddr == 4'd12) begin
                     if (hsize == 1'b1) begin
                        next_read_select = 5'd25;     
                    end
                    else if(hsize == 1'b0) begin
                        next_read_select = 5'd26;
                    end               
                end
                else if(haddr == 4'd13) begin
                     if (hsize == 1'b1) begin
                        next_read_select = 5'd27;     
                    end
                    else if(hsize == 1'b0) begin
                        next_read_select = 5'd28;
                    end                  
                end
                else if(haddr == 4'd14) begin
                    next_read_select = 5'd29;                 
                end
                else begin
                    hresp = 1'b1;
                end
            end
        end
    end

    always_comb begin: HRDATA
        hrdata = '0;
        //STATUS REGSITER
        if(read_select == 5'd1) begin
             if (err == 1'b1) begin
                hrdata = 16'd256;
            end
            else if (busy == 1'b1) begin
                hrdata = 16'd1;
            end
            else begin
                hrdata = 16'd0;
            end 
        end
        else if (read_select == 5'd2) begin
            if (busy == 1'b1) begin
                hrdata = 16'd1;
            end
            else begin
                hrdata = 16'd0;
            end
        end
        else if(read_select == 5'd3) begin
            if (err == 1'b1) begin
                hrdata = 16'd256;
            end
            else if (busy == 1'b1) begin
                hrdata = 16'd1;
            end
            else begin
                hrdata = 16'd0;
            end
        end
        else if (read_select == 5'd4) begin
            if (err == 1'b1) begin
                hrdata = 16'd256;
            end
            else begin
                hrdata = 16'd0;
            end
        end
        
        //RESULT REGISTER
        else if(read_select == 5'd5) begin
            hrdata = fir_out;
        end
        else if (read_select ==5'd6) begin
            hrdata = {8'd0,fir_out[7:0]};
        end

        else if(read_select == 5'd7) begin
            hrdata = fir_out;
        end
        else if (read_select == 5'd8) begin
            hrdata = {fir_out[15:8], 8'd0};
        end
        //SAMPLE REGISTER
        else if(read_select == 5'd9) begin
            hrdata = sample_data;
        end
        else if (read_select == 5'b10) begin
            hrdata = {8'd0, sample_data[7:0]};
        end
        else if(read_select == 5'd11) begin
            hrdata = sample_data;
        end
        else if (read_select == 5'd12) begin
            hrdata = {sample_data[15:8], 8'd0};
        end
        //FO 
        else if(read_select == 5'd13) begin
            hrdata = f_zero;
        end
        else if (read_select == 5'd14) begin
            hrdata = {8'd0, f_zero[7:0]};
        end
        else if(read_select == 5'd15) begin
            hrdata = f_zero;
        end
        else if (read_select == 5'd16) begin
            hrdata = {f_zero[15:8], 8'd0};
        end
        //F1 
        else if(read_select == 5'd17) begin
            hrdata = f_one;
        end
        else if (read_select == 5'd18) begin
            hrdata = {8'd0, f_one[7:0]};
        end
        else if(read_select == 5'd19) begin
            hrdata = f_one;
        end
        else if (read_select == 5'd20) begin
            hrdata = {f_one[15:8], 8'd0};
        end
        //F2 
        else if(read_select == 5'd21) begin
            hrdata = f_two;
        end
        else if (read_select == 5'd22) begin
            hrdata = {8'd0, f_two[7:0]};
        end
        else if(read_select == 5'd23) begin
            hrdata = f_two;
        end
        else if (read_select == 5'd24) begin
            hrdata = {f_two[15:8], 8'd0};
        end
        //F3 
        else if(read_select == 5'd25) begin
            hrdata = f_three;
        end
        else if (read_select == 5'd26) begin
            hrdata = {8'd0, f_three[7:0]};
        end
        else if(read_select == 5'd27) begin
            hrdata = f_three;
        end
        else if (read_select == 5'd28) begin
            hrdata = {f_three[15:8], 8'd0};
        end
        //NEW COEFFICIENT SET 
        else if(read_select == 5'd29) begin
            hrdata = {15'd0, new_coefficient_set};
        end
    end

    always_comb begin: HWDATA
        busy = 1'b0;
        next_data_ready = data_ready; 
        next_sample_data_temp = sample_data_temp;
        next_f_zero = f_zero;
        next_f_one = f_one;
        next_f_two = f_two;
        next_f_three = f_three;
        //NEW SAMPLE
        if(write_select == 5'd1) begin
            next_sample_data_temp = hwdata;
            next_data_ready = 1'b1;
        end
        if (write_select == 5'd2) begin
            next_sample_data_temp[7:0] = hwdata[7:0];
            next_data_ready = 1'b1;
        end
        if(write_select == 5'd3) begin
            next_sample_data_temp = hwdata;
            next_data_ready = 1'b1;
        end
        if (write_select == 5'd4) begin
            next_sample_data_temp[15:8] = hwdata[15:8];
            next_data_ready = 1'b1;
        end
        //FO
        if(write_select == 5'd5) begin
            next_f_zero = hwdata;
        end
        if (write_select == 5'd6) begin
            next_f_zero[7:0] = hwdata[7:0];
        end
        if(write_select == 5'd7) begin
            next_f_zero = hwdata;
        end
        if (write_select == 5'd8) begin
            next_f_zero[15:8] = hwdata[15:8];
        end
        //F1
        if(write_select == 5'd9) begin
            next_f_one = hwdata;
        end
        if (write_select == 5'b10) begin
            next_f_one[7:0] = hwdata[7:0];
        end
        if(write_select == 5'd11) begin
            next_f_one = hwdata;
        end
        if (write_select == 5'd12) begin
            next_f_one[15:8] = hwdata[15:8];
        end
        //F2
        if(write_select == 5'd13) begin
            next_f_two = hwdata;
        end
        if (write_select == 5'd14) begin
            next_f_two[7:0] = hwdata[7:0];
        end
        if(write_select == 5'd15) begin
            next_f_two = hwdata;
        end
        if (write_select == 5'd16) begin
            next_f_two[15:8] = hwdata[15:8];
        end
        //F3
        if(write_select == 5'd17) begin
            next_f_three = hwdata;
        end
        if (write_select == 5'd18) begin
            next_f_three[7:0] = hwdata[7:0];
        end
        if(write_select == 5'd19) begin
            next_f_three = hwdata;
        end
        if (write_select == 5'd20) begin
            next_f_three[15:8] = hwdata[15:8];
        end
        //NEW COEFFICIENT SET
        if(write_select == 5'd21) begin
            next_new_coff_set_temp = hwdata[0];
        end
        else begin
            next_new_coff_set_temp = new_coff_set_temp;;
        end

        if(cl_done == 1'b1) begin
            next_new_coff_set_temp = 1'b0;
        end
        
        if(ff_done == 1'b1) begin
            next_data_ready = 1'b0;
        end
        
        if(new_coefficient_set == 1'b0) begin
            if(modwait == 1'b1) begin
                busy = 1'b1;
            end
            else begin
                busy = 1'b0;
            end
        end
        else if (new_coefficient_set == 1'b1) begin
            busy = cl_busy;
        end

    end
       
    
endmodule

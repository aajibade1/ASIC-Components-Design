// $Id: $
// File name:   ahb_lite_fir_filter.sv
// Created:     4/3/2020
// Author:      Abdulrahman Ajibade
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: AHB-Lite FIR FIlter Accelerator Module.

module ahb_lite_fir_filter (
    input wire clk, input wire n_rst, input wire hsel,
    input wire [3:0] haddr, input wire hsize, 
    input wire [1:0] htrans, input wire hwrite,
    input wire [15:0] hwdata, output reg [15:0] hrdata,
    output reg hresp
    );

    reg [15:0] sample_data;
    reg data_ready;
    reg new_coefficient_set;
    reg [1:0] coefficient_num;
    reg [15:0] fir_coefficient;
    reg modwait;
    reg [15:0] fir_out;
    reg err;
    reg load_coeff;
    reg one_k_samples;
    reg ff_done;
    reg cl_done;
    reg cl_busy;

    ahb_lite_slave als(
        .clk(clk), .n_rst(n_rst),
        .sample_data(sample_data), .data_ready(data_ready),
        .new_coefficient_set(new_coefficient_set),
        .coefficient_num(coefficient_num),
        .fir_coefficient(fir_coefficient), .modwait(modwait),
        .fir_out(fir_out), .err(err), .hsel(hsel),
        .haddr(haddr), .hsize(hsize), .htrans(htrans),
        .hwrite(hwrite), .hwdata(hwdata), .hrdata(hrdata),
        .hresp(hresp), .cl_done(cl_done), .cl_busy(cl_busy),
        .ff_done(ff_done)
    );

    fir_filter ff(
        .clk(clk), .n_reset(n_rst), .sample_data(sample_data),
        .data_ready(data_ready), .fir_coefficient(fir_coefficient),
        .load_coeff(load_coeff), .one_k_samples(one_k_samples), 
        .modwait(modwait), .fir_out(fir_out), .err(err),
        .ff_done(ff_done)
    );

    coefficient_loader cl (
        .clk(clk), .n_reset(n_rst),
        .new_coefficient_set(new_coefficient_set),
        .modwait(modwait), .load_coeff(load_coeff),
        .coefficient_num(coefficient_num),
        .cl_done(cl_done), .cl_busy(cl_busy)
    );

endmodule


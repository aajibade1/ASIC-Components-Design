// $Id: $
// File name:   fir_filter.sv
// Created:     3/4/2020
// Author:      Abdulrahman Ajibade
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: FIR filter module.


module fir_filter (input wire clk, input wire n_reset, input wire[15:0] sample_data,
                   input wire[15:0] fir_coefficient, input wire load_coeff, input wire data_ready,
                   output reg one_k_samples, output reg modwait, output reg[15:0] fir_out, output reg err,
                   output reg ff_done
                  );




logic [16:0] outreg_data;
logic [2:0]op;
logic [3:0]src1;
logic [3:0]src2;
logic [3:0]dest;
logic overflow;
logic clear;
logic cnt_up;


controller control(
    .clk(clk),
    .n_rst(n_reset),
    .dr(data_ready),
    .lc(load_coeff),
    .overflow(overflow),
    .cnt_up(cnt_up),
    .clear(clear),
    .modwait(modwait),
    .op(op),
    .src1(src1),
    .src2(src2),
    .dest(dest),
    .err(err),
    .ff_done(ff_done)
);

counter count(
    .clk(clk),
    .n_rst(n_reset),
    .cnt_up(cnt_up),
    .clear(clear),
    .one_k_samples(one_k_samples)
);

datapath dat(
    .clk(clk),
    .n_reset(n_reset),
    .op(op),
    .src1(src1),
    .src2(src2),
    .dest(dest),
    .ext_data1(sample_data),
    .ext_data2(fir_coefficient),
    .outreg_data(outreg_data),
    .overflow(overflow)
);

magnitude mag(
    .in(outreg_data),
    .out(fir_out)
);

endmodule


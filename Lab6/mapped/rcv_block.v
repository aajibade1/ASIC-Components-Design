/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Thu Feb 27 19:35:04 2020
/////////////////////////////////////////////////////////////


module rcu ( clk, n_rst, new_packet_detected, packet_done, framing_error, 
        sbc_clear, sbc_enable, load_buffer, enable_timer );
  input clk, n_rst, new_packet_detected, packet_done, framing_error;
  output sbc_clear, sbc_enable, load_buffer, enable_timer;
  wire   n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27;
  wire   [2:0] state;
  wire   [2:0] next_state;

  DFFSR \state_reg[0]  ( .D(next_state[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[0]) );
  DFFSR \state_reg[2]  ( .D(next_state[2]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[2]) );
  DFFSR \state_reg[1]  ( .D(next_state[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[1]) );
  NOR2X1 U6 ( .A(n4), .B(n5), .Y(sbc_enable) );
  INVX1 U7 ( .A(n6), .Y(n5) );
  AOI22X1 U8 ( .A(packet_done), .B(n7), .C(state[2]), .D(n8), .Y(n4) );
  NOR2X1 U9 ( .A(n9), .B(n10), .Y(sbc_clear) );
  NAND2X1 U10 ( .A(new_packet_detected), .B(n6), .Y(n10) );
  AOI21X1 U11 ( .A(n11), .B(state[1]), .C(n12), .Y(n6) );
  NAND2X1 U12 ( .A(n8), .B(n13), .Y(n9) );
  OR2X1 U13 ( .A(n14), .B(n15), .Y(next_state[2]) );
  OAI21X1 U14 ( .A(n16), .B(n17), .C(n18), .Y(n15) );
  INVX1 U15 ( .A(packet_done), .Y(n17) );
  NAND3X1 U16 ( .A(n19), .B(n18), .C(n20), .Y(next_state[1]) );
  AOI22X1 U17 ( .A(n12), .B(n13), .C(n21), .D(n16), .Y(n20) );
  NAND3X1 U18 ( .A(n22), .B(n19), .C(n23), .Y(next_state[0]) );
  INVX1 U19 ( .A(n14), .Y(n23) );
  OAI21X1 U20 ( .A(n7), .B(n8), .C(n24), .Y(n14) );
  NAND3X1 U21 ( .A(n11), .B(n25), .C(state[2]), .Y(n24) );
  INVX1 U22 ( .A(enable_timer), .Y(n19) );
  NAND3X1 U23 ( .A(n11), .B(n25), .C(new_packet_detected), .Y(n22) );
  INVX1 U24 ( .A(n18), .Y(load_buffer) );
  NAND2X1 U25 ( .A(n26), .B(n12), .Y(n18) );
  NOR2X1 U26 ( .A(n11), .B(state[1]), .Y(n12) );
  NOR2X1 U27 ( .A(framing_error), .B(n13), .Y(n26) );
  OAI21X1 U28 ( .A(packet_done), .B(n16), .C(n27), .Y(enable_timer) );
  NAND3X1 U29 ( .A(n11), .B(n13), .C(state[1]), .Y(n27) );
  INVX1 U30 ( .A(state[2]), .Y(n13) );
  INVX1 U31 ( .A(n7), .Y(n16) );
  NOR2X1 U32 ( .A(n8), .B(state[2]), .Y(n7) );
  INVX1 U33 ( .A(n21), .Y(n8) );
  NOR2X1 U34 ( .A(n11), .B(n25), .Y(n21) );
  INVX1 U35 ( .A(state[1]), .Y(n25) );
  INVX1 U36 ( .A(state[0]), .Y(n11) );
endmodule


module flex_counter_1 ( clk, n_rst, clear, count_enable, rollover_val, 
        count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n42, n43, n44, n45, n46, n1, n2, n3, n4, n5, n6, n7, n8, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33;

  DFFSR \count_out_reg[0]  ( .D(n46), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[3]  ( .D(n43), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR \count_out_reg[1]  ( .D(n45), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n44), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR rollover_flag_reg ( .D(n42), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  MUX2X1 U5 ( .B(n1), .A(n2), .S(n3), .Y(n46) );
  OAI21X1 U6 ( .A(n4), .B(n1), .C(n5), .Y(n2) );
  INVX1 U10 ( .A(n6), .Y(n4) );
  OAI22X1 U11 ( .A(n3), .B(n7), .C(n8), .D(n14), .Y(n45) );
  INVX1 U12 ( .A(count_out[1]), .Y(n7) );
  OAI22X1 U13 ( .A(n3), .B(n15), .C(n16), .D(n14), .Y(n44) );
  OAI22X1 U14 ( .A(n3), .B(n17), .C(n18), .D(n14), .Y(n43) );
  NAND3X1 U15 ( .A(n3), .B(n5), .C(n6), .Y(n14) );
  NAND3X1 U16 ( .A(n19), .B(n20), .C(n21), .Y(n6) );
  NOR2X1 U17 ( .A(n22), .B(n23), .Y(n21) );
  XOR2X1 U18 ( .A(rollover_val[1]), .B(count_out[1]), .Y(n22) );
  XOR2X1 U19 ( .A(rollover_val[2]), .B(n15), .Y(n20) );
  INVX1 U20 ( .A(count_out[2]), .Y(n15) );
  XOR2X1 U21 ( .A(rollover_val[3]), .B(n17), .Y(n19) );
  MUX2X1 U22 ( .B(n24), .A(n25), .S(n3), .Y(n42) );
  OR2X1 U23 ( .A(count_enable), .B(clear), .Y(n3) );
  NAND3X1 U24 ( .A(n26), .B(n23), .C(n27), .Y(n25) );
  NOR2X1 U25 ( .A(n28), .B(n29), .Y(n27) );
  OAI21X1 U26 ( .A(n17), .B(n30), .C(n5), .Y(n29) );
  INVX1 U27 ( .A(clear), .Y(n5) );
  INVX1 U28 ( .A(count_out[3]), .Y(n17) );
  XNOR2X1 U29 ( .A(rollover_val[1]), .B(n8), .Y(n28) );
  XOR2X1 U30 ( .A(count_out[1]), .B(n1), .Y(n8) );
  INVX1 U31 ( .A(count_out[0]), .Y(n1) );
  XOR2X1 U32 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n23) );
  NOR2X1 U33 ( .A(n31), .B(n32), .Y(n26) );
  XNOR2X1 U34 ( .A(rollover_val[2]), .B(n16), .Y(n32) );
  XOR2X1 U35 ( .A(n33), .B(count_out[2]), .Y(n16) );
  NAND2X1 U36 ( .A(count_out[1]), .B(count_out[0]), .Y(n33) );
  XNOR2X1 U37 ( .A(rollover_val[3]), .B(n18), .Y(n31) );
  XOR2X1 U38 ( .A(n30), .B(count_out[3]), .Y(n18) );
  NAND3X1 U39 ( .A(count_out[1]), .B(count_out[0]), .C(count_out[2]), .Y(n30)
         );
  INVX1 U40 ( .A(rollover_flag), .Y(n24) );
endmodule


module flex_counter_0 ( clk, n_rst, clear, count_enable, rollover_val, 
        count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38;

  DFFSR \count_out_reg[0]  ( .D(n34), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[3]  ( .D(n37), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR \count_out_reg[1]  ( .D(n35), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n36), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR rollover_flag_reg ( .D(n38), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  MUX2X1 U5 ( .B(n1), .A(n2), .S(n3), .Y(n34) );
  OAI21X1 U6 ( .A(n4), .B(n1), .C(n5), .Y(n2) );
  INVX1 U10 ( .A(n6), .Y(n4) );
  OAI22X1 U11 ( .A(n3), .B(n7), .C(n8), .D(n14), .Y(n35) );
  INVX1 U12 ( .A(count_out[1]), .Y(n7) );
  OAI22X1 U13 ( .A(n3), .B(n15), .C(n16), .D(n14), .Y(n36) );
  OAI22X1 U14 ( .A(n3), .B(n17), .C(n18), .D(n14), .Y(n37) );
  NAND3X1 U15 ( .A(n3), .B(n5), .C(n6), .Y(n14) );
  NAND3X1 U16 ( .A(n19), .B(n20), .C(n21), .Y(n6) );
  NOR2X1 U17 ( .A(n22), .B(n23), .Y(n21) );
  XOR2X1 U18 ( .A(rollover_val[1]), .B(count_out[1]), .Y(n22) );
  XOR2X1 U19 ( .A(rollover_val[2]), .B(n15), .Y(n20) );
  INVX1 U20 ( .A(count_out[2]), .Y(n15) );
  XOR2X1 U21 ( .A(rollover_val[3]), .B(n17), .Y(n19) );
  MUX2X1 U22 ( .B(n24), .A(n25), .S(n3), .Y(n38) );
  OR2X1 U23 ( .A(count_enable), .B(clear), .Y(n3) );
  NAND3X1 U24 ( .A(n26), .B(n23), .C(n27), .Y(n25) );
  NOR2X1 U25 ( .A(n28), .B(n29), .Y(n27) );
  OAI21X1 U26 ( .A(n17), .B(n30), .C(n5), .Y(n29) );
  INVX1 U27 ( .A(clear), .Y(n5) );
  INVX1 U28 ( .A(count_out[3]), .Y(n17) );
  XNOR2X1 U29 ( .A(rollover_val[1]), .B(n8), .Y(n28) );
  XOR2X1 U30 ( .A(count_out[1]), .B(n1), .Y(n8) );
  INVX1 U31 ( .A(count_out[0]), .Y(n1) );
  XOR2X1 U32 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n23) );
  NOR2X1 U33 ( .A(n31), .B(n32), .Y(n26) );
  XNOR2X1 U34 ( .A(rollover_val[2]), .B(n16), .Y(n32) );
  XOR2X1 U35 ( .A(n33), .B(count_out[2]), .Y(n16) );
  NAND2X1 U36 ( .A(count_out[1]), .B(count_out[0]), .Y(n33) );
  XNOR2X1 U37 ( .A(rollover_val[3]), .B(n18), .Y(n31) );
  XOR2X1 U38 ( .A(n30), .B(count_out[3]), .Y(n18) );
  NAND3X1 U39 ( .A(count_out[1]), .B(count_out[0]), .C(count_out[2]), .Y(n30)
         );
  INVX1 U40 ( .A(rollover_flag), .Y(n24) );
endmodule


module timer ( clk, n_rst, enable_timer, shift_enable, packet_done );
  input clk, n_rst, enable_timer;
  output shift_enable, packet_done;


  flex_counter_1 flex_counter1 ( .clk(clk), .n_rst(n_rst), .clear(packet_done), 
        .count_enable(enable_timer), .rollover_val({1'b1, 1'b0, 1'b1, 1'b0}), 
        .rollover_flag(shift_enable) );
  flex_counter_0 flex_counter2 ( .clk(clk), .n_rst(n_rst), .clear(packet_done), 
        .count_enable(shift_enable), .rollover_val({1'b1, 1'b0, 1'b0, 1'b1}), 
        .rollover_flag(packet_done) );
endmodule


module flex_stp_sr_NUM_BITS9_SHIFT_MSB0 ( clk, n_rst, shift_enable, serial_in, 
        parallel_out );
  output [8:0] parallel_out;
  input clk, n_rst, shift_enable, serial_in;
  wire   n13, n15, n17, n19, n21, n23, n25, n27, n29, n1, n2, n3, n4, n5, n6,
         n7, n8, n9;

  DFFSR \parallel_out_reg[8]  ( .D(n29), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[8]) );
  DFFSR \parallel_out_reg[7]  ( .D(n27), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[7]) );
  DFFSR \parallel_out_reg[6]  ( .D(n25), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[6]) );
  DFFSR \parallel_out_reg[5]  ( .D(n23), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[5]) );
  DFFSR \parallel_out_reg[4]  ( .D(n21), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[4]) );
  DFFSR \parallel_out_reg[3]  ( .D(n19), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[3]) );
  DFFSR \parallel_out_reg[2]  ( .D(n17), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[2]) );
  DFFSR \parallel_out_reg[1]  ( .D(n15), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[1]) );
  DFFSR \parallel_out_reg[0]  ( .D(n13), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[0]) );
  INVX1 U2 ( .A(n1), .Y(n29) );
  MUX2X1 U3 ( .B(parallel_out[8]), .A(serial_in), .S(shift_enable), .Y(n1) );
  INVX1 U4 ( .A(n2), .Y(n27) );
  MUX2X1 U5 ( .B(parallel_out[7]), .A(parallel_out[8]), .S(shift_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n25) );
  MUX2X1 U7 ( .B(parallel_out[6]), .A(parallel_out[7]), .S(shift_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n23) );
  MUX2X1 U9 ( .B(parallel_out[5]), .A(parallel_out[6]), .S(shift_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n21) );
  MUX2X1 U11 ( .B(parallel_out[4]), .A(parallel_out[5]), .S(shift_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n19) );
  MUX2X1 U13 ( .B(parallel_out[3]), .A(parallel_out[4]), .S(shift_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n17) );
  MUX2X1 U15 ( .B(parallel_out[2]), .A(parallel_out[3]), .S(shift_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n15) );
  MUX2X1 U17 ( .B(parallel_out[1]), .A(parallel_out[2]), .S(shift_enable), .Y(
        n8) );
  INVX1 U18 ( .A(n9), .Y(n13) );
  MUX2X1 U19 ( .B(parallel_out[0]), .A(parallel_out[1]), .S(shift_enable), .Y(
        n9) );
endmodule


module sr_9bit ( clk, n_rst, shift_strobe, serial_in, packet_data );
  output [8:0] packet_data;
  input clk, n_rst, shift_strobe, serial_in;


  flex_stp_sr_NUM_BITS9_SHIFT_MSB0 CORE ( .clk(clk), .n_rst(n_rst), 
        .shift_enable(shift_strobe), .serial_in(serial_in), .parallel_out(
        packet_data) );
endmodule


module rx_data_buff ( clk, n_rst, load_buffer, packet_data, data_read, rx_data, 
        data_ready, overrun_error );
  input [7:0] packet_data;
  output [7:0] rx_data;
  input clk, n_rst, load_buffer, data_read;
  output data_ready, overrun_error;
  wire   n30, n31, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n15, n17, n19,
         n21, n23, n25, n27, n29;

  DFFSR \rx_data_reg[7]  ( .D(n15), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[7]) );
  DFFSR \rx_data_reg[6]  ( .D(n17), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[6]) );
  DFFSR \rx_data_reg[5]  ( .D(n19), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[5]) );
  DFFSR \rx_data_reg[4]  ( .D(n21), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[4]) );
  DFFSR \rx_data_reg[3]  ( .D(n23), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[3]) );
  DFFSR \rx_data_reg[2]  ( .D(n25), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[2]) );
  DFFSR \rx_data_reg[1]  ( .D(n27), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[1]) );
  DFFSR \rx_data_reg[0]  ( .D(n29), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[0]) );
  DFFSR data_ready_reg ( .D(n31), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_ready) );
  DFFSR overrun_error_reg ( .D(n30), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        overrun_error) );
  INVX1 U3 ( .A(n1), .Y(n15) );
  MUX2X1 U4 ( .B(rx_data[7]), .A(packet_data[7]), .S(load_buffer), .Y(n1) );
  INVX1 U5 ( .A(n2), .Y(n17) );
  MUX2X1 U6 ( .B(rx_data[6]), .A(packet_data[6]), .S(load_buffer), .Y(n2) );
  INVX1 U7 ( .A(n3), .Y(n19) );
  MUX2X1 U8 ( .B(rx_data[5]), .A(packet_data[5]), .S(load_buffer), .Y(n3) );
  INVX1 U9 ( .A(n4), .Y(n21) );
  MUX2X1 U10 ( .B(rx_data[4]), .A(packet_data[4]), .S(load_buffer), .Y(n4) );
  INVX1 U11 ( .A(n5), .Y(n23) );
  MUX2X1 U12 ( .B(rx_data[3]), .A(packet_data[3]), .S(load_buffer), .Y(n5) );
  INVX1 U13 ( .A(n6), .Y(n25) );
  MUX2X1 U14 ( .B(rx_data[2]), .A(packet_data[2]), .S(load_buffer), .Y(n6) );
  INVX1 U15 ( .A(n7), .Y(n27) );
  MUX2X1 U16 ( .B(rx_data[1]), .A(packet_data[1]), .S(load_buffer), .Y(n7) );
  INVX1 U17 ( .A(n8), .Y(n29) );
  MUX2X1 U18 ( .B(rx_data[0]), .A(packet_data[0]), .S(load_buffer), .Y(n8) );
  OAI21X1 U19 ( .A(data_read), .B(n9), .C(n10), .Y(n31) );
  INVX1 U20 ( .A(load_buffer), .Y(n10) );
  INVX1 U21 ( .A(data_ready), .Y(n9) );
  NOR2X1 U22 ( .A(data_read), .B(n11), .Y(n30) );
  AOI21X1 U23 ( .A(data_ready), .B(load_buffer), .C(overrun_error), .Y(n11) );
endmodule


module start_bit_det ( clk, n_rst, serial_in, start_bit_detected, 
        new_package_detected );
  input clk, n_rst, serial_in;
  output start_bit_detected, new_package_detected;
  wire   start_bit_detected, old_sample, new_sample, sync_phase, n4;
  assign new_package_detected = start_bit_detected;

  DFFSR sync_phase_reg ( .D(serial_in), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        sync_phase) );
  DFFSR new_sample_reg ( .D(sync_phase), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        new_sample) );
  DFFSR old_sample_reg ( .D(new_sample), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        old_sample) );
  NOR2X1 U6 ( .A(new_sample), .B(n4), .Y(start_bit_detected) );
  INVX1 U7 ( .A(old_sample), .Y(n4) );
endmodule


module stop_bit_chk ( clk, n_rst, sbc_clear, sbc_enable, stop_bit, 
        framing_error );
  input clk, n_rst, sbc_clear, sbc_enable, stop_bit;
  output framing_error;
  wire   n5, n2, n3;

  DFFSR framing_error_reg ( .D(n5), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        framing_error) );
  NOR2X1 U3 ( .A(sbc_clear), .B(n2), .Y(n5) );
  MUX2X1 U4 ( .B(framing_error), .A(n3), .S(sbc_enable), .Y(n2) );
  INVX1 U5 ( .A(stop_bit), .Y(n3) );
endmodule


module rcv_block ( clk, n_rst, serial_in, data_read, rx_data, data_ready, 
        overrun_error, framing_error );
  output [7:0] rx_data;
  input clk, n_rst, serial_in, data_read;
  output data_ready, overrun_error, framing_error;
  wire   new_packet_detected, packet_done, sbc_clear, sbc_enable, load_buffer,
         enable_timer, shift_enable;
  wire   [8:0] packet_data;

  rcu rec ( .clk(clk), .n_rst(n_rst), .new_packet_detected(new_packet_detected), .packet_done(packet_done), .framing_error(framing_error), .sbc_clear(
        sbc_clear), .sbc_enable(sbc_enable), .load_buffer(load_buffer), 
        .enable_timer(enable_timer) );
  timer tim ( .clk(clk), .n_rst(n_rst), .enable_timer(enable_timer), 
        .shift_enable(shift_enable), .packet_done(packet_done) );
  sr_9bit send ( .clk(clk), .n_rst(n_rst), .shift_strobe(shift_enable), 
        .serial_in(serial_in), .packet_data(packet_data) );
  rx_data_buff dat ( .clk(clk), .n_rst(n_rst), .load_buffer(load_buffer), 
        .packet_data(packet_data[7:0]), .data_read(data_read), .rx_data(
        rx_data), .data_ready(data_ready), .overrun_error(overrun_error) );
  start_bit_det sbd ( .clk(clk), .n_rst(n_rst), .serial_in(serial_in), 
        .start_bit_detected(new_packet_detected) );
  stop_bit_chk sbc ( .clk(clk), .n_rst(n_rst), .sbc_clear(sbc_clear), 
        .sbc_enable(sbc_enable), .stop_bit(packet_data[8]), .framing_error(
        framing_error) );
endmodule


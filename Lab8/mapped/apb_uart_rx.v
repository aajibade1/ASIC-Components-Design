/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Thu Mar 26 17:51:04 2020
/////////////////////////////////////////////////////////////


module apb_slave ( clk, n_rst, rx_data, data_ready, overrun_error, 
        framing_error, psel, paddr, penable, pwrite, pwdata, prdata, pslverr, 
        data_read, data_size, bit_period );
  input [7:0] rx_data;
  input [2:0] paddr;
  input [7:0] pwdata;
  output [7:0] prdata;
  output [3:0] data_size;
  output [13:0] bit_period;
  input clk, n_rst, data_ready, overrun_error, framing_error, psel, penable,
         pwrite;
  output pslverr, data_read;
  wire   n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82,
         n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96,
         n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108,
         n109, n110, n111, n112, n113, n114, n115, n116, n117, n118, n119,
         n120, n121, n122, n123, n124, n125, n126, n127, n128, n129, n130,
         n131, n132, n133, n134, n135, n136, n137, n138;
  wire   [3:0] next_data_size_temp;
  wire   [13:0] next_bit_period_temp;
  wire   [7:0] next_prdata;

  DFFSR \bit_period_temp_reg[13]  ( .D(n135), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[13]) );
  DFFSR \bit_period_temp_reg[12]  ( .D(n136), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[12]) );
  DFFSR \bit_period_temp_reg[11]  ( .D(next_bit_period_temp[11]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(bit_period[11]) );
  DFFSR \bit_period_temp_reg[10]  ( .D(next_bit_period_temp[10]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(bit_period[10]) );
  DFFSR \bit_period_temp_reg[9]  ( .D(next_bit_period_temp[9]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(bit_period[9]) );
  DFFSR \bit_period_temp_reg[8]  ( .D(next_bit_period_temp[8]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(bit_period[8]) );
  DFFSR \bit_period_temp_reg[7]  ( .D(next_bit_period_temp[7]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(bit_period[7]) );
  DFFSR \bit_period_temp_reg[6]  ( .D(next_bit_period_temp[6]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(bit_period[6]) );
  DFFSR \bit_period_temp_reg[5]  ( .D(n137), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[5]) );
  DFFSR \bit_period_temp_reg[4]  ( .D(n138), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[4]) );
  DFFSR \bit_period_temp_reg[3]  ( .D(next_bit_period_temp[3]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(bit_period[3]) );
  DFFSR \bit_period_temp_reg[2]  ( .D(next_bit_period_temp[2]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(bit_period[2]) );
  DFFSR \bit_period_temp_reg[1]  ( .D(next_bit_period_temp[1]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(bit_period[1]) );
  DFFSR \bit_period_temp_reg[0]  ( .D(next_bit_period_temp[0]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(bit_period[0]) );
  DFFSR \data_size_temp_reg[3]  ( .D(next_data_size_temp[3]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(data_size[3]) );
  DFFSR \data_size_temp_reg[2]  ( .D(next_data_size_temp[2]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(data_size[2]) );
  DFFSR \data_size_temp_reg[1]  ( .D(next_data_size_temp[1]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(data_size[1]) );
  DFFSR \data_size_temp_reg[0]  ( .D(next_data_size_temp[0]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(data_size[0]) );
  DFFSR \prdata_reg[5]  ( .D(next_prdata[5]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(prdata[5]) );
  DFFSR \prdata_reg[6]  ( .D(next_prdata[6]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(prdata[6]) );
  DFFSR \prdata_reg[7]  ( .D(next_prdata[7]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(prdata[7]) );
  DFFSR \prdata_reg[1]  ( .D(next_prdata[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(prdata[1]) );
  DFFSR \prdata_reg[2]  ( .D(next_prdata[2]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(prdata[2]) );
  DFFSR \prdata_reg[3]  ( .D(next_prdata[3]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(prdata[3]) );
  DFFSR \prdata_reg[4]  ( .D(next_prdata[4]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(prdata[4]) );
  DFFSR \prdata_reg[0]  ( .D(next_prdata[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(prdata[0]) );
  NOR2X1 U29 ( .A(n27), .B(n28), .Y(pslverr) );
  NAND2X1 U30 ( .A(n29), .B(n30), .Y(n28) );
  INVX1 U31 ( .A(n31), .Y(n29) );
  OAI21X1 U32 ( .A(n32), .B(n33), .C(n34), .Y(next_prdata[7]) );
  AOI22X1 U33 ( .A(rx_data[7]), .B(n35), .C(bit_period[7]), .D(n36), .Y(n34)
         );
  INVX1 U34 ( .A(prdata[7]), .Y(n33) );
  NAND2X1 U35 ( .A(n37), .B(n38), .Y(next_prdata[6]) );
  AOI22X1 U36 ( .A(n39), .B(n40), .C(rx_data[6]), .D(n35), .Y(n38) );
  INVX1 U37 ( .A(n41), .Y(n35) );
  AND2X1 U38 ( .A(data_read), .B(rx_data[7]), .Y(n39) );
  AOI22X1 U39 ( .A(bit_period[6]), .B(n36), .C(prdata[6]), .D(n42), .Y(n37) );
  NAND2X1 U40 ( .A(n43), .B(n44), .Y(next_prdata[5]) );
  AOI21X1 U41 ( .A(bit_period[13]), .B(n45), .C(n46), .Y(n44) );
  OAI21X1 U42 ( .A(n41), .B(n47), .C(n48), .Y(n46) );
  NAND3X1 U43 ( .A(n40), .B(data_read), .C(rx_data[6]), .Y(n48) );
  NAND2X1 U44 ( .A(data_read), .B(n49), .Y(n41) );
  AOI22X1 U45 ( .A(bit_period[5]), .B(n36), .C(prdata[5]), .D(n42), .Y(n43) );
  NAND2X1 U46 ( .A(n50), .B(n51), .Y(next_prdata[4]) );
  AOI22X1 U47 ( .A(data_read), .B(n52), .C(bit_period[12]), .D(n45), .Y(n51)
         );
  OAI21X1 U48 ( .A(n53), .B(n54), .C(n55), .Y(n52) );
  AOI22X1 U49 ( .A(rx_data[4]), .B(n49), .C(rx_data[5]), .D(n40), .Y(n55) );
  INVX1 U50 ( .A(rx_data[7]), .Y(n53) );
  AOI22X1 U51 ( .A(bit_period[4]), .B(n36), .C(prdata[4]), .D(n42), .Y(n50) );
  NAND3X1 U52 ( .A(n56), .B(n57), .C(n58), .Y(next_prdata[3]) );
  AOI22X1 U53 ( .A(bit_period[3]), .B(n36), .C(prdata[3]), .D(n42), .Y(n58) );
  NAND2X1 U54 ( .A(bit_period[11]), .B(n45), .Y(n57) );
  AOI22X1 U55 ( .A(data_size[3]), .B(n59), .C(data_read), .D(n60), .Y(n56) );
  OAI21X1 U56 ( .A(n61), .B(n54), .C(n62), .Y(n60) );
  AOI22X1 U57 ( .A(rx_data[3]), .B(n49), .C(rx_data[4]), .D(n40), .Y(n62) );
  INVX1 U58 ( .A(rx_data[6]), .Y(n61) );
  NAND3X1 U59 ( .A(n63), .B(n64), .C(n65), .Y(next_prdata[2]) );
  AOI22X1 U60 ( .A(bit_period[2]), .B(n36), .C(prdata[2]), .D(n42), .Y(n65) );
  NAND2X1 U61 ( .A(bit_period[10]), .B(n45), .Y(n64) );
  INVX1 U62 ( .A(n66), .Y(n45) );
  AOI22X1 U63 ( .A(n59), .B(data_size[2]), .C(data_read), .D(n67), .Y(n63) );
  OAI21X1 U64 ( .A(n47), .B(n54), .C(n68), .Y(n67) );
  AOI22X1 U65 ( .A(rx_data[2]), .B(n49), .C(rx_data[3]), .D(n40), .Y(n68) );
  INVX1 U66 ( .A(rx_data[5]), .Y(n47) );
  NAND3X1 U67 ( .A(n69), .B(n70), .C(n71), .Y(next_prdata[1]) );
  AOI21X1 U68 ( .A(prdata[1]), .B(n42), .C(n72), .Y(n71) );
  OAI22X1 U69 ( .A(n73), .B(n74), .C(n66), .D(n75), .Y(n72) );
  OAI21X1 U70 ( .A(n76), .B(n77), .C(data_read), .Y(n70) );
  INVX1 U71 ( .A(n78), .Y(n77) );
  AOI22X1 U72 ( .A(n40), .B(rx_data[2]), .C(n49), .D(rx_data[1]), .Y(n78) );
  AND2X1 U73 ( .A(rx_data[4]), .B(n79), .Y(n76) );
  AOI22X1 U74 ( .A(overrun_error), .B(n80), .C(n59), .D(data_size[1]), .Y(n69)
         );
  NAND3X1 U75 ( .A(n81), .B(n82), .C(n83), .Y(next_prdata[0]) );
  AOI21X1 U76 ( .A(prdata[0]), .B(n42), .C(n84), .Y(n83) );
  OAI22X1 U77 ( .A(n73), .B(n85), .C(n66), .D(n86), .Y(n84) );
  NAND3X1 U78 ( .A(n87), .B(n88), .C(n89), .Y(n66) );
  INVX1 U79 ( .A(n36), .Y(n73) );
  NOR2X1 U80 ( .A(n87), .B(n88), .Y(n36) );
  INVX1 U81 ( .A(n32), .Y(n42) );
  NAND3X1 U82 ( .A(n88), .B(n90), .C(n87), .Y(n32) );
  AOI22X1 U83 ( .A(n91), .B(n92), .C(framing_error), .D(n80), .Y(n82) );
  INVX1 U84 ( .A(n93), .Y(n80) );
  NAND3X1 U85 ( .A(n87), .B(n90), .C(n94), .Y(n93) );
  NOR2X1 U86 ( .A(n89), .B(n94), .Y(n92) );
  INVX1 U87 ( .A(n88), .Y(n94) );
  INVX1 U88 ( .A(n90), .Y(n89) );
  NOR2X1 U89 ( .A(n95), .B(n87), .Y(n91) );
  INVX1 U90 ( .A(data_ready), .Y(n95) );
  AOI22X1 U91 ( .A(n59), .B(data_size[0]), .C(data_read), .D(n96), .Y(n81) );
  OAI21X1 U92 ( .A(n54), .B(n97), .C(n98), .Y(n96) );
  AOI22X1 U93 ( .A(rx_data[0]), .B(n49), .C(rx_data[1]), .D(n40), .Y(n98) );
  NOR2X1 U94 ( .A(n40), .B(n79), .Y(n49) );
  NOR2X1 U95 ( .A(n99), .B(n100), .Y(n40) );
  INVX1 U96 ( .A(rx_data[3]), .Y(n97) );
  INVX1 U97 ( .A(n79), .Y(n54) );
  NOR2X1 U98 ( .A(n100), .B(data_size[1]), .Y(n79) );
  NAND3X1 U99 ( .A(data_size[0]), .B(n101), .C(data_size[2]), .Y(n100) );
  INVX1 U100 ( .A(data_size[3]), .Y(n101) );
  NOR2X1 U101 ( .A(n87), .B(n90), .Y(n59) );
  OAI21X1 U102 ( .A(n102), .B(n103), .C(n104), .Y(n87) );
  NOR2X1 U103 ( .A(paddr[0]), .B(paddr[1]), .Y(n102) );
  INVX1 U104 ( .A(n105), .Y(next_data_size_temp[3]) );
  MUX2X1 U105 ( .B(data_size[3]), .A(pwdata[3]), .S(n106), .Y(n105) );
  INVX1 U106 ( .A(n107), .Y(next_data_size_temp[2]) );
  MUX2X1 U107 ( .B(data_size[2]), .A(pwdata[2]), .S(n106), .Y(n107) );
  MUX2X1 U108 ( .B(n99), .A(n108), .S(n106), .Y(next_data_size_temp[1]) );
  INVX1 U109 ( .A(data_size[1]), .Y(n99) );
  INVX1 U110 ( .A(n109), .Y(next_data_size_temp[0]) );
  MUX2X1 U111 ( .B(data_size[0]), .A(pwdata[0]), .S(n106), .Y(n109) );
  NOR2X1 U112 ( .A(n110), .B(n111), .Y(n106) );
  MUX2X1 U113 ( .B(n75), .A(n108), .S(n112), .Y(next_bit_period_temp[9]) );
  INVX1 U114 ( .A(bit_period[9]), .Y(n75) );
  MUX2X1 U115 ( .B(n86), .A(n113), .S(n112), .Y(next_bit_period_temp[8]) );
  INVX1 U116 ( .A(bit_period[8]), .Y(n86) );
  INVX1 U117 ( .A(n114), .Y(next_bit_period_temp[7]) );
  MUX2X1 U118 ( .B(bit_period[7]), .A(pwdata[7]), .S(n115), .Y(n114) );
  INVX1 U119 ( .A(n116), .Y(next_bit_period_temp[6]) );
  MUX2X1 U120 ( .B(bit_period[6]), .A(pwdata[6]), .S(n115), .Y(n116) );
  INVX1 U121 ( .A(n117), .Y(next_bit_period_temp[3]) );
  MUX2X1 U122 ( .B(bit_period[3]), .A(pwdata[3]), .S(n115), .Y(n117) );
  INVX1 U123 ( .A(n118), .Y(next_bit_period_temp[2]) );
  MUX2X1 U124 ( .B(bit_period[2]), .A(pwdata[2]), .S(n115), .Y(n118) );
  MUX2X1 U125 ( .B(n74), .A(n108), .S(n115), .Y(next_bit_period_temp[1]) );
  INVX1 U126 ( .A(pwdata[1]), .Y(n108) );
  INVX1 U127 ( .A(bit_period[1]), .Y(n74) );
  INVX1 U128 ( .A(n119), .Y(next_bit_period_temp[11]) );
  MUX2X1 U129 ( .B(bit_period[11]), .A(pwdata[3]), .S(n112), .Y(n119) );
  INVX1 U130 ( .A(n120), .Y(next_bit_period_temp[10]) );
  MUX2X1 U131 ( .B(bit_period[10]), .A(pwdata[2]), .S(n112), .Y(n120) );
  MUX2X1 U132 ( .B(n85), .A(n113), .S(n115), .Y(next_bit_period_temp[0]) );
  INVX1 U133 ( .A(pwdata[0]), .Y(n113) );
  INVX1 U134 ( .A(bit_period[0]), .Y(n85) );
  INVX1 U135 ( .A(n121), .Y(n135) );
  MUX2X1 U136 ( .B(bit_period[13]), .A(pwdata[5]), .S(n112), .Y(n121) );
  INVX1 U137 ( .A(n122), .Y(n136) );
  MUX2X1 U138 ( .B(bit_period[12]), .A(pwdata[4]), .S(n112), .Y(n122) );
  AND2X1 U139 ( .A(n123), .B(n111), .Y(n112) );
  INVX1 U140 ( .A(n124), .Y(n137) );
  MUX2X1 U141 ( .B(bit_period[5]), .A(pwdata[5]), .S(n115), .Y(n124) );
  INVX1 U142 ( .A(n125), .Y(n138) );
  MUX2X1 U143 ( .B(bit_period[4]), .A(pwdata[4]), .S(n115), .Y(n125) );
  NOR2X1 U144 ( .A(n111), .B(n123), .Y(n115) );
  INVX1 U145 ( .A(n110), .Y(n123) );
  NAND2X1 U146 ( .A(n126), .B(n31), .Y(n110) );
  NAND2X1 U147 ( .A(n126), .B(n103), .Y(n111) );
  OAI21X1 U148 ( .A(paddr[0]), .B(n30), .C(n127), .Y(n103) );
  INVX1 U149 ( .A(n27), .Y(n126) );
  NAND3X1 U150 ( .A(psel), .B(penable), .C(pwrite), .Y(n27) );
  NOR2X1 U151 ( .A(n90), .B(n88), .Y(data_read) );
  NAND2X1 U152 ( .A(n128), .B(n104), .Y(n88) );
  MUX2X1 U153 ( .B(n129), .A(n130), .S(n131), .Y(n128) );
  NAND2X1 U154 ( .A(n132), .B(n130), .Y(n129) );
  OAI21X1 U155 ( .A(n133), .B(n31), .C(n104), .Y(n90) );
  NOR2X1 U156 ( .A(n134), .B(pwrite), .Y(n104) );
  INVX1 U157 ( .A(psel), .Y(n134) );
  OAI21X1 U158 ( .A(n30), .B(n131), .C(n127), .Y(n31) );
  NAND3X1 U159 ( .A(n131), .B(n130), .C(paddr[2]), .Y(n127) );
  INVX1 U160 ( .A(paddr[1]), .Y(n130) );
  INVX1 U161 ( .A(paddr[0]), .Y(n131) );
  NAND2X1 U162 ( .A(paddr[1]), .B(n132), .Y(n30) );
  NOR2X1 U163 ( .A(paddr[0]), .B(n132), .Y(n133) );
  INVX1 U164 ( .A(paddr[2]), .Y(n132) );
endmodule


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


module flex_counter_NUM_CNT_BITS14_DW01_inc_0 ( A, SUM );
  input [13:0] A;
  output [13:0] SUM;

  wire   [13:2] carry;

  HAX1 U1_1_12 ( .A(A[12]), .B(carry[12]), .YC(carry[13]), .YS(SUM[12]) );
  HAX1 U1_1_11 ( .A(A[11]), .B(carry[11]), .YC(carry[12]), .YS(SUM[11]) );
  HAX1 U1_1_10 ( .A(A[10]), .B(carry[10]), .YC(carry[11]), .YS(SUM[10]) );
  HAX1 U1_1_9 ( .A(A[9]), .B(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  HAX1 U1_1_8 ( .A(A[8]), .B(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  HAX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  HAX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[13]), .B(A[13]), .Y(SUM[13]) );
endmodule


module flex_counter_NUM_CNT_BITS14_DW01_inc_1 ( A, SUM );
  input [14:0] A;
  output [14:0] SUM;

  wire   [14:2] carry;

  HAX1 U1_1_13 ( .A(A[13]), .B(carry[13]), .YC(SUM[14]), .YS(SUM[13]) );
  HAX1 U1_1_12 ( .A(A[12]), .B(carry[12]), .YC(carry[13]), .YS(SUM[12]) );
  HAX1 U1_1_11 ( .A(A[11]), .B(carry[11]), .YC(carry[12]), .YS(SUM[11]) );
  HAX1 U1_1_10 ( .A(A[10]), .B(carry[10]), .YC(carry[11]), .YS(SUM[10]) );
  HAX1 U1_1_9 ( .A(A[9]), .B(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  HAX1 U1_1_8 ( .A(A[8]), .B(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  HAX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  HAX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module flex_counter_NUM_CNT_BITS14 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [13:0] rollover_val;
  output [13:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18,
         N23, N24, N25, N26, N27, N28, N29, N30, N31, N32, N33, N34, N35, N36,
         n59, n60, n1, n3, n4, n5, n6, n7, n8, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
         n58, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113;

  DFFSR \count_out_reg[0]  ( .D(n60), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[13]  ( .D(n113), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[13]) );
  DFFSR \count_out_reg[12]  ( .D(n112), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[12]) );
  DFFSR \count_out_reg[11]  ( .D(n111), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[11]) );
  DFFSR \count_out_reg[10]  ( .D(n110), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[10]) );
  DFFSR \count_out_reg[9]  ( .D(n109), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[9]) );
  DFFSR \count_out_reg[8]  ( .D(n108), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[8]) );
  DFFSR \count_out_reg[7]  ( .D(n107), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[7]) );
  DFFSR \count_out_reg[6]  ( .D(n106), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[6]) );
  DFFSR \count_out_reg[5]  ( .D(n105), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[5]) );
  DFFSR \count_out_reg[4]  ( .D(n104), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[4]) );
  DFFSR \count_out_reg[3]  ( .D(n103), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR \count_out_reg[2]  ( .D(n102), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[1]  ( .D(n101), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR rollover_flag_reg ( .D(n59), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  flex_counter_NUM_CNT_BITS14_DW01_inc_0 r315 ( .A(count_out), .SUM({N36, N35, 
        N34, N33, N32, N31, N30, N29, N28, N27, N26, N25, N24, N23}) );
  flex_counter_NUM_CNT_BITS14_DW01_inc_1 add_33 ( .A({1'b0, count_out}), .SUM(
        {N18, N17, N16, N15, N14, N13, N12, N11, N10, N9, N8, N7, N6, N5, N4})
         );
  INVX2 U5 ( .A(n76), .Y(n3) );
  OAI21X1 U7 ( .A(n1), .B(n3), .C(n4), .Y(n101) );
  NAND2X1 U21 ( .A(N24), .B(n5), .Y(n4) );
  OAI21X1 U22 ( .A(n6), .B(n3), .C(n7), .Y(n102) );
  NAND2X1 U23 ( .A(N25), .B(n5), .Y(n7) );
  OAI21X1 U24 ( .A(n8), .B(n3), .C(n24), .Y(n103) );
  NAND2X1 U25 ( .A(N26), .B(n5), .Y(n24) );
  INVX1 U26 ( .A(count_out[3]), .Y(n8) );
  OAI21X1 U27 ( .A(n25), .B(n3), .C(n26), .Y(n104) );
  NAND2X1 U28 ( .A(N27), .B(n5), .Y(n26) );
  INVX1 U29 ( .A(count_out[4]), .Y(n25) );
  OAI21X1 U30 ( .A(n27), .B(n3), .C(n28), .Y(n105) );
  NAND2X1 U31 ( .A(N28), .B(n5), .Y(n28) );
  OAI21X1 U32 ( .A(n29), .B(n3), .C(n30), .Y(n106) );
  NAND2X1 U33 ( .A(N29), .B(n5), .Y(n30) );
  OAI21X1 U34 ( .A(n31), .B(n3), .C(n32), .Y(n107) );
  NAND2X1 U35 ( .A(N30), .B(n5), .Y(n32) );
  OAI21X1 U36 ( .A(n33), .B(n3), .C(n34), .Y(n108) );
  NAND2X1 U37 ( .A(N31), .B(n5), .Y(n34) );
  OAI21X1 U38 ( .A(n35), .B(n3), .C(n36), .Y(n109) );
  NAND2X1 U39 ( .A(N32), .B(n5), .Y(n36) );
  OAI21X1 U40 ( .A(n37), .B(n3), .C(n38), .Y(n110) );
  NAND2X1 U41 ( .A(N33), .B(n5), .Y(n38) );
  INVX1 U42 ( .A(count_out[10]), .Y(n37) );
  OAI21X1 U43 ( .A(n39), .B(n3), .C(n40), .Y(n111) );
  NAND2X1 U44 ( .A(N34), .B(n5), .Y(n40) );
  INVX1 U45 ( .A(count_out[11]), .Y(n39) );
  OAI21X1 U46 ( .A(n41), .B(n3), .C(n42), .Y(n112) );
  NAND2X1 U47 ( .A(N35), .B(n5), .Y(n42) );
  INVX1 U48 ( .A(count_out[12]), .Y(n41) );
  OAI21X1 U49 ( .A(n43), .B(n3), .C(n44), .Y(n113) );
  NAND2X1 U50 ( .A(N36), .B(n5), .Y(n44) );
  INVX1 U51 ( .A(count_out[13]), .Y(n43) );
  OAI21X1 U52 ( .A(n45), .B(n3), .C(n46), .Y(n60) );
  AOI22X1 U53 ( .A(n47), .B(n48), .C(N23), .D(n5), .Y(n46) );
  NOR2X1 U54 ( .A(n49), .B(n47), .Y(n5) );
  AND2X1 U55 ( .A(n50), .B(n51), .Y(n47) );
  NOR2X1 U56 ( .A(n52), .B(n53), .Y(n51) );
  NAND3X1 U57 ( .A(n54), .B(n55), .C(n56), .Y(n53) );
  NOR2X1 U58 ( .A(n57), .B(n58), .Y(n56) );
  XOR2X1 U59 ( .A(rollover_val[13]), .B(count_out[13]), .Y(n58) );
  XOR2X1 U60 ( .A(rollover_val[12]), .B(count_out[12]), .Y(n57) );
  XOR2X1 U61 ( .A(n1), .B(rollover_val[1]), .Y(n55) );
  INVX1 U62 ( .A(count_out[1]), .Y(n1) );
  XOR2X1 U63 ( .A(n6), .B(rollover_val[2]), .Y(n54) );
  INVX1 U64 ( .A(count_out[2]), .Y(n6) );
  NAND3X1 U65 ( .A(n61), .B(n62), .C(n63), .Y(n52) );
  NOR2X1 U66 ( .A(n64), .B(n65), .Y(n63) );
  XOR2X1 U67 ( .A(rollover_val[11]), .B(count_out[11]), .Y(n65) );
  XOR2X1 U68 ( .A(rollover_val[10]), .B(count_out[10]), .Y(n64) );
  XOR2X1 U69 ( .A(n45), .B(rollover_val[0]), .Y(n61) );
  NOR2X1 U70 ( .A(n66), .B(n67), .Y(n50) );
  NAND3X1 U71 ( .A(n68), .B(n69), .C(n70), .Y(n67) );
  XOR2X1 U72 ( .A(n33), .B(rollover_val[8]), .Y(n70) );
  INVX1 U73 ( .A(count_out[8]), .Y(n33) );
  XOR2X1 U74 ( .A(n35), .B(rollover_val[9]), .Y(n69) );
  INVX1 U75 ( .A(count_out[9]), .Y(n35) );
  XOR2X1 U76 ( .A(n31), .B(rollover_val[7]), .Y(n68) );
  INVX1 U77 ( .A(count_out[7]), .Y(n31) );
  NAND3X1 U78 ( .A(n71), .B(n72), .C(n73), .Y(n66) );
  NOR2X1 U79 ( .A(n74), .B(n75), .Y(n73) );
  XOR2X1 U80 ( .A(rollover_val[4]), .B(count_out[4]), .Y(n75) );
  XOR2X1 U81 ( .A(rollover_val[3]), .B(count_out[3]), .Y(n74) );
  XOR2X1 U82 ( .A(n27), .B(rollover_val[5]), .Y(n72) );
  INVX1 U83 ( .A(count_out[5]), .Y(n27) );
  XOR2X1 U84 ( .A(n29), .B(rollover_val[6]), .Y(n71) );
  INVX1 U85 ( .A(count_out[6]), .Y(n29) );
  INVX1 U86 ( .A(count_out[0]), .Y(n45) );
  OAI21X1 U87 ( .A(n49), .B(n62), .C(n77), .Y(n59) );
  NAND2X1 U88 ( .A(rollover_flag), .B(n76), .Y(n77) );
  NAND2X1 U89 ( .A(n78), .B(n79), .Y(n62) );
  NOR2X1 U90 ( .A(n80), .B(n81), .Y(n79) );
  NAND3X1 U91 ( .A(n82), .B(n83), .C(n84), .Y(n81) );
  NOR2X1 U92 ( .A(n85), .B(n86), .Y(n84) );
  XOR2X1 U93 ( .A(rollover_val[10]), .B(N14), .Y(n86) );
  XOR2X1 U94 ( .A(rollover_val[9]), .B(N13), .Y(n85) );
  XNOR2X1 U95 ( .A(rollover_val[11]), .B(N15), .Y(n83) );
  XNOR2X1 U96 ( .A(rollover_val[12]), .B(N16), .Y(n82) );
  NAND3X1 U97 ( .A(n87), .B(n88), .C(n89), .Y(n80) );
  NOR2X1 U98 ( .A(N18), .B(n90), .Y(n89) );
  XOR2X1 U99 ( .A(rollover_val[6]), .B(N10), .Y(n90) );
  XNOR2X1 U100 ( .A(rollover_val[7]), .B(N11), .Y(n88) );
  XNOR2X1 U101 ( .A(rollover_val[8]), .B(N12), .Y(n87) );
  NOR2X1 U102 ( .A(n91), .B(n92), .Y(n78) );
  NAND3X1 U103 ( .A(n93), .B(n94), .C(n95), .Y(n92) );
  XNOR2X1 U104 ( .A(rollover_val[4]), .B(N8), .Y(n95) );
  XNOR2X1 U105 ( .A(rollover_val[5]), .B(N9), .Y(n94) );
  XNOR2X1 U106 ( .A(rollover_val[3]), .B(N7), .Y(n93) );
  NAND3X1 U107 ( .A(n96), .B(n97), .C(n98), .Y(n91) );
  NOR2X1 U108 ( .A(n99), .B(n100), .Y(n98) );
  XOR2X1 U109 ( .A(rollover_val[0]), .B(N4), .Y(n100) );
  XOR2X1 U110 ( .A(rollover_val[13]), .B(N17), .Y(n99) );
  XNOR2X1 U111 ( .A(rollover_val[1]), .B(N5), .Y(n97) );
  XNOR2X1 U112 ( .A(rollover_val[2]), .B(N6), .Y(n96) );
  INVX1 U113 ( .A(n48), .Y(n49) );
  NOR2X1 U114 ( .A(n76), .B(clear), .Y(n48) );
  NOR2X1 U115 ( .A(count_enable), .B(clear), .Y(n76) );
endmodule


module flex_counter ( clk, n_rst, clear, count_enable, rollover_val, count_out, 
        rollover_flag );
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


module timer ( clk, n_rst, data_size, bit_period, enable_timer, shift_enable, 
        packet_done );
  input [3:0] data_size;
  input [13:0] bit_period;
  input clk, n_rst, enable_timer;
  output shift_enable, packet_done;
  wire   \_0_net_[3] , \_0_net_[2] , \_0_net_[1] , n1, n2, n3, n4;

  flex_counter_NUM_CNT_BITS14 flex_counter1 ( .clk(clk), .n_rst(n_rst), 
        .clear(packet_done), .count_enable(enable_timer), .rollover_val(
        bit_period), .rollover_flag(shift_enable) );
  flex_counter flex_counter2 ( .clk(clk), .n_rst(n_rst), .clear(packet_done), 
        .count_enable(shift_enable), .rollover_val({\_0_net_[3] , \_0_net_[2] , 
        \_0_net_[1] , n4}), .rollover_flag(packet_done) );
  INVX1 U2 ( .A(data_size[0]), .Y(n4) );
  XOR2X1 U3 ( .A(data_size[3]), .B(n1), .Y(\_0_net_[3] ) );
  NOR2X1 U4 ( .A(n2), .B(n3), .Y(n1) );
  XOR2X1 U5 ( .A(n3), .B(n2), .Y(\_0_net_[2] ) );
  NAND2X1 U6 ( .A(data_size[1]), .B(data_size[0]), .Y(n2) );
  INVX1 U7 ( .A(data_size[2]), .Y(n3) );
  XOR2X1 U8 ( .A(data_size[1]), .B(data_size[0]), .Y(\_0_net_[1] ) );
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


module rcv_block ( clk, n_rst, data_size, bit_period, serial_in, data_read, 
        rx_data, data_ready, overrun_error, framing_error );
  input [3:0] data_size;
  input [13:0] bit_period;
  output [7:0] rx_data;
  input clk, n_rst, serial_in, data_read;
  output data_ready, overrun_error, framing_error;
  wire   new_packet_detected, packet_done, sbc_clear, sbc_enable, load_buffer,
         enable_timer, shift_enable;
  wire   [8:0] packet_data;

  rcu rec ( .clk(clk), .n_rst(n_rst), .new_packet_detected(new_packet_detected), .packet_done(packet_done), .framing_error(framing_error), .sbc_clear(
        sbc_clear), .sbc_enable(sbc_enable), .load_buffer(load_buffer), 
        .enable_timer(enable_timer) );
  timer tim ( .clk(clk), .n_rst(n_rst), .data_size(data_size), .bit_period(
        bit_period), .enable_timer(enable_timer), .shift_enable(shift_enable), 
        .packet_done(packet_done) );
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


module apb_uart_rx ( clk, n_rst, serial_in, psel, paddr, penable, pwrite, 
        pwdata, prdata, pslverr );
  input [2:0] paddr;
  input [7:0] pwdata;
  output [7:0] prdata;
  input clk, n_rst, serial_in, psel, penable, pwrite;
  output pslverr;
  wire   data_ready, overrun_error, framing_error, data_read;
  wire   [7:0] rx_data;
  wire   [3:0] data_size;
  wire   [13:0] bit_period;

  apb_slave apb ( .clk(clk), .n_rst(n_rst), .rx_data(rx_data), .data_ready(
        data_ready), .overrun_error(overrun_error), .framing_error(
        framing_error), .psel(psel), .paddr(paddr), .penable(penable), 
        .pwrite(pwrite), .pwdata(pwdata), .prdata(prdata), .pslverr(pslverr), 
        .data_read(data_read), .data_size(data_size), .bit_period(bit_period)
         );
  rcv_block uart ( .clk(clk), .n_rst(n_rst), .data_size(data_size), 
        .bit_period(bit_period), .serial_in(serial_in), .data_read(data_read), 
        .rx_data(rx_data), .data_ready(data_ready), .overrun_error(
        overrun_error), .framing_error(framing_error) );
endmodule


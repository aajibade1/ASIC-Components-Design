/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Wed Feb 12 20:22:21 2020
/////////////////////////////////////////////////////////////


module flex_counter_NUM_CNT_BITS16_DW01_inc_0 ( A, SUM );
  input [15:0] A;
  output [15:0] SUM;

  wire   [15:2] carry;

  HAX1 U1_1_14 ( .A(A[14]), .B(carry[14]), .YC(carry[15]), .YS(SUM[14]) );
  HAX1 U1_1_13 ( .A(A[13]), .B(carry[13]), .YC(carry[14]), .YS(SUM[13]) );
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
  XOR2X1 U2 ( .A(carry[15]), .B(A[15]), .Y(SUM[15]) );
endmodule


module flex_counter_NUM_CNT_BITS16_DW01_inc_1 ( A, SUM );
  input [16:0] A;
  output [16:0] SUM;

  wire   [16:2] carry;

  HAX1 U1_1_15 ( .A(A[15]), .B(carry[15]), .YC(SUM[16]), .YS(SUM[15]) );
  HAX1 U1_1_14 ( .A(A[14]), .B(carry[14]), .YC(carry[15]), .YS(SUM[14]) );
  HAX1 U1_1_13 ( .A(A[13]), .B(carry[13]), .YC(carry[14]), .YS(SUM[13]) );
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


module flex_counter_NUM_CNT_BITS16 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [15:0] rollover_val;
  output [15:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19,
         N20, N21, N26, N27, N28, N29, N30, N31, N32, N33, N34, N35, N36, N37,
         N38, N39, N40, N41, N60, N61, n71, n1, n3, n4, n5, n6, n7, n8, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83,
         n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97,
         n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109,
         n110, n111, n112, n113, n114, n115, n116, n117, n118, n119, n120,
         n121, n122, n123, n124, n125, n126, n127, n128, n129, n130, n131,
         n132, n133, n134;
  wire   [15:0] next_count;

  LATCH \next_count_reg[0]  ( .CLK(n1), .D(N61), .Q(next_count[0]) );
  DFFSR \count_out_reg[0]  ( .D(next_count[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[0]) );
  LATCH \next_count_reg[15]  ( .CLK(n1), .D(n134), .Q(next_count[15]) );
  DFFSR \count_out_reg[15]  ( .D(next_count[15]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[15]) );
  LATCH \next_count_reg[14]  ( .CLK(n1), .D(n133), .Q(next_count[14]) );
  DFFSR \count_out_reg[14]  ( .D(next_count[14]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[14]) );
  LATCH \next_count_reg[1]  ( .CLK(n1), .D(n120), .Q(next_count[1]) );
  DFFSR \count_out_reg[1]  ( .D(next_count[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[1]) );
  LATCH \next_count_reg[2]  ( .CLK(n1), .D(n121), .Q(next_count[2]) );
  DFFSR \count_out_reg[2]  ( .D(next_count[2]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[2]) );
  LATCH \next_count_reg[3]  ( .CLK(n1), .D(n122), .Q(next_count[3]) );
  DFFSR \count_out_reg[3]  ( .D(next_count[3]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[3]) );
  LATCH \next_count_reg[4]  ( .CLK(n1), .D(n123), .Q(next_count[4]) );
  DFFSR \count_out_reg[4]  ( .D(next_count[4]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[4]) );
  LATCH \next_count_reg[5]  ( .CLK(n1), .D(n124), .Q(next_count[5]) );
  DFFSR \count_out_reg[5]  ( .D(next_count[5]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[5]) );
  LATCH \next_count_reg[6]  ( .CLK(n1), .D(n125), .Q(next_count[6]) );
  DFFSR \count_out_reg[6]  ( .D(next_count[6]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[6]) );
  LATCH \next_count_reg[7]  ( .CLK(n1), .D(n126), .Q(next_count[7]) );
  DFFSR \count_out_reg[7]  ( .D(next_count[7]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[7]) );
  LATCH \next_count_reg[8]  ( .CLK(n1), .D(n127), .Q(next_count[8]) );
  DFFSR \count_out_reg[8]  ( .D(next_count[8]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[8]) );
  LATCH \next_count_reg[9]  ( .CLK(n1), .D(n128), .Q(next_count[9]) );
  DFFSR \count_out_reg[9]  ( .D(next_count[9]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[9]) );
  LATCH \next_count_reg[10]  ( .CLK(n1), .D(n129), .Q(next_count[10]) );
  DFFSR \count_out_reg[10]  ( .D(next_count[10]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[10]) );
  LATCH \next_count_reg[11]  ( .CLK(n1), .D(n130), .Q(next_count[11]) );
  DFFSR \count_out_reg[11]  ( .D(next_count[11]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[11]) );
  LATCH \next_count_reg[12]  ( .CLK(n1), .D(n131), .Q(next_count[12]) );
  DFFSR \count_out_reg[12]  ( .D(next_count[12]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[12]) );
  LATCH \next_count_reg[13]  ( .CLK(n1), .D(n132), .Q(next_count[13]) );
  DFFSR \count_out_reg[13]  ( .D(next_count[13]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[13]) );
  DFFSR rollover_flag_reg ( .D(n71), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  flex_counter_NUM_CNT_BITS16_DW01_inc_0 add_39 ( .A(count_out), .SUM({N41, 
        N40, N39, N38, N37, N36, N35, N34, N33, N32, N31, N30, N29, N28, N27, 
        N26}) );
  flex_counter_NUM_CNT_BITS16_DW01_inc_1 add_31 ( .A({1'b0, count_out}), .SUM(
        {N21, N20, N19, N18, N17, N16, N15, N14, N13, N12, N11, N10, N9, N8, 
        N7, N6, N5}) );
  INVX2 U5 ( .A(n52), .Y(n3) );
  BUFX2 U7 ( .A(N60), .Y(n1) );
  OAI21X1 U23 ( .A(n3), .B(n4), .C(n5), .Y(n120) );
  NAND2X1 U24 ( .A(N27), .B(n6), .Y(n5) );
  INVX1 U25 ( .A(count_out[1]), .Y(n4) );
  OAI21X1 U26 ( .A(n3), .B(n7), .C(n8), .Y(n121) );
  NAND2X1 U27 ( .A(N28), .B(n6), .Y(n8) );
  INVX1 U28 ( .A(count_out[2]), .Y(n7) );
  OAI21X1 U29 ( .A(n3), .B(n26), .C(n27), .Y(n122) );
  NAND2X1 U30 ( .A(N29), .B(n6), .Y(n27) );
  OAI21X1 U31 ( .A(n3), .B(n28), .C(n29), .Y(n123) );
  NAND2X1 U32 ( .A(N30), .B(n6), .Y(n29) );
  OAI21X1 U33 ( .A(n3), .B(n30), .C(n31), .Y(n124) );
  NAND2X1 U34 ( .A(N31), .B(n6), .Y(n31) );
  INVX1 U35 ( .A(count_out[5]), .Y(n30) );
  OAI21X1 U36 ( .A(n3), .B(n32), .C(n33), .Y(n125) );
  NAND2X1 U37 ( .A(N32), .B(n6), .Y(n33) );
  INVX1 U38 ( .A(count_out[6]), .Y(n32) );
  OAI21X1 U39 ( .A(n3), .B(n34), .C(n35), .Y(n126) );
  NAND2X1 U40 ( .A(N33), .B(n6), .Y(n35) );
  OAI21X1 U41 ( .A(n3), .B(n36), .C(n37), .Y(n127) );
  NAND2X1 U42 ( .A(N34), .B(n6), .Y(n37) );
  INVX1 U43 ( .A(count_out[8]), .Y(n36) );
  OAI21X1 U44 ( .A(n3), .B(n38), .C(n39), .Y(n128) );
  NAND2X1 U45 ( .A(N35), .B(n6), .Y(n39) );
  INVX1 U46 ( .A(count_out[9]), .Y(n38) );
  OAI21X1 U47 ( .A(n3), .B(n40), .C(n41), .Y(n129) );
  NAND2X1 U48 ( .A(N36), .B(n6), .Y(n41) );
  OAI21X1 U49 ( .A(n3), .B(n42), .C(n43), .Y(n130) );
  NAND2X1 U50 ( .A(N37), .B(n6), .Y(n43) );
  OAI21X1 U51 ( .A(n3), .B(n44), .C(n45), .Y(n131) );
  NAND2X1 U52 ( .A(N38), .B(n6), .Y(n45) );
  OAI21X1 U53 ( .A(n3), .B(n46), .C(n47), .Y(n132) );
  NAND2X1 U54 ( .A(N39), .B(n6), .Y(n47) );
  INVX1 U55 ( .A(count_out[13]), .Y(n46) );
  OAI21X1 U56 ( .A(n3), .B(n48), .C(n49), .Y(n133) );
  NAND2X1 U57 ( .A(N40), .B(n6), .Y(n49) );
  INVX1 U58 ( .A(count_out[14]), .Y(n48) );
  OAI21X1 U59 ( .A(n3), .B(n50), .C(n51), .Y(n134) );
  NAND2X1 U60 ( .A(N41), .B(n6), .Y(n51) );
  OAI21X1 U61 ( .A(n53), .B(n54), .C(n55), .Y(n71) );
  NAND2X1 U62 ( .A(rollover_flag), .B(n52), .Y(n55) );
  NAND2X1 U63 ( .A(count_enable), .B(n56), .Y(n54) );
  OAI21X1 U64 ( .A(n57), .B(n58), .C(n59), .Y(N61) );
  AOI21X1 U65 ( .A(count_out[0]), .B(n52), .C(n60), .Y(n59) );
  INVX1 U66 ( .A(N26), .Y(n58) );
  NAND3X1 U67 ( .A(n61), .B(n57), .C(n62), .Y(N60) );
  NOR2X1 U68 ( .A(clear), .B(n52), .Y(n62) );
  NOR2X1 U69 ( .A(clear), .B(count_enable), .Y(n52) );
  INVX1 U70 ( .A(n6), .Y(n57) );
  NOR2X1 U71 ( .A(n63), .B(n64), .Y(n6) );
  INVX1 U72 ( .A(n65), .Y(n64) );
  INVX1 U73 ( .A(n60), .Y(n61) );
  NOR2X1 U74 ( .A(n65), .B(n63), .Y(n60) );
  NAND3X1 U75 ( .A(n53), .B(n56), .C(count_enable), .Y(n63) );
  INVX1 U76 ( .A(clear), .Y(n56) );
  NAND2X1 U77 ( .A(n66), .B(n67), .Y(n53) );
  NOR2X1 U78 ( .A(n68), .B(n69), .Y(n67) );
  NAND3X1 U79 ( .A(n70), .B(n72), .C(n73), .Y(n69) );
  NOR2X1 U80 ( .A(n74), .B(n75), .Y(n73) );
  XOR2X1 U81 ( .A(rollover_val[12]), .B(N17), .Y(n75) );
  XOR2X1 U82 ( .A(rollover_val[11]), .B(N16), .Y(n74) );
  XNOR2X1 U83 ( .A(rollover_val[13]), .B(N18), .Y(n72) );
  XNOR2X1 U84 ( .A(rollover_val[14]), .B(N19), .Y(n70) );
  NAND3X1 U85 ( .A(n76), .B(n77), .C(n78), .Y(n68) );
  NOR2X1 U86 ( .A(n79), .B(n80), .Y(n78) );
  XOR2X1 U87 ( .A(rollover_val[10]), .B(N15), .Y(n80) );
  XOR2X1 U88 ( .A(rollover_val[9]), .B(N14), .Y(n79) );
  XNOR2X1 U89 ( .A(rollover_val[7]), .B(N12), .Y(n77) );
  NOR2X1 U90 ( .A(N21), .B(n81), .Y(n76) );
  XOR2X1 U91 ( .A(rollover_val[8]), .B(N13), .Y(n81) );
  NOR2X1 U92 ( .A(n82), .B(n83), .Y(n66) );
  NAND3X1 U93 ( .A(n84), .B(n85), .C(n86), .Y(n83) );
  NOR2X1 U94 ( .A(n87), .B(n88), .Y(n86) );
  XOR2X1 U95 ( .A(rollover_val[6]), .B(N11), .Y(n88) );
  XOR2X1 U96 ( .A(rollover_val[5]), .B(N10), .Y(n87) );
  XNOR2X1 U97 ( .A(rollover_val[3]), .B(N8), .Y(n85) );
  XNOR2X1 U98 ( .A(rollover_val[4]), .B(N9), .Y(n84) );
  NAND3X1 U99 ( .A(n89), .B(n90), .C(n91), .Y(n82) );
  NOR2X1 U100 ( .A(n92), .B(n93), .Y(n91) );
  XOR2X1 U101 ( .A(rollover_val[0]), .B(N5), .Y(n93) );
  XOR2X1 U102 ( .A(rollover_val[15]), .B(N20), .Y(n92) );
  XNOR2X1 U103 ( .A(rollover_val[1]), .B(N6), .Y(n90) );
  XNOR2X1 U104 ( .A(rollover_val[2]), .B(N7), .Y(n89) );
  NAND2X1 U105 ( .A(n94), .B(n95), .Y(n65) );
  NOR2X1 U106 ( .A(n96), .B(n97), .Y(n95) );
  NAND3X1 U107 ( .A(n98), .B(n99), .C(n100), .Y(n97) );
  NOR2X1 U108 ( .A(n101), .B(n102), .Y(n100) );
  XNOR2X1 U109 ( .A(rollover_val[12]), .B(n44), .Y(n102) );
  INVX1 U110 ( .A(count_out[12]), .Y(n44) );
  XNOR2X1 U111 ( .A(rollover_val[11]), .B(n42), .Y(n101) );
  INVX1 U112 ( .A(count_out[11]), .Y(n42) );
  XNOR2X1 U113 ( .A(count_out[13]), .B(rollover_val[13]), .Y(n99) );
  XNOR2X1 U114 ( .A(count_out[14]), .B(rollover_val[14]), .Y(n98) );
  NAND3X1 U115 ( .A(n103), .B(n104), .C(n105), .Y(n96) );
  NOR2X1 U116 ( .A(n106), .B(n107), .Y(n105) );
  XNOR2X1 U117 ( .A(rollover_val[7]), .B(n34), .Y(n107) );
  INVX1 U118 ( .A(count_out[7]), .Y(n34) );
  XNOR2X1 U119 ( .A(rollover_val[10]), .B(n40), .Y(n106) );
  INVX1 U120 ( .A(count_out[10]), .Y(n40) );
  XNOR2X1 U121 ( .A(count_out[8]), .B(rollover_val[8]), .Y(n104) );
  XNOR2X1 U122 ( .A(count_out[9]), .B(rollover_val[9]), .Y(n103) );
  NOR2X1 U123 ( .A(n108), .B(n109), .Y(n94) );
  NAND3X1 U124 ( .A(n110), .B(n111), .C(n112), .Y(n109) );
  NOR2X1 U125 ( .A(n113), .B(n114), .Y(n112) );
  XNOR2X1 U126 ( .A(rollover_val[4]), .B(n28), .Y(n114) );
  INVX1 U127 ( .A(count_out[4]), .Y(n28) );
  XNOR2X1 U128 ( .A(rollover_val[3]), .B(n26), .Y(n113) );
  INVX1 U129 ( .A(count_out[3]), .Y(n26) );
  XNOR2X1 U130 ( .A(count_out[5]), .B(rollover_val[5]), .Y(n111) );
  XNOR2X1 U131 ( .A(count_out[6]), .B(rollover_val[6]), .Y(n110) );
  NAND3X1 U132 ( .A(n115), .B(n116), .C(n117), .Y(n108) );
  NOR2X1 U133 ( .A(n118), .B(n119), .Y(n117) );
  XNOR2X1 U134 ( .A(rollover_val[15]), .B(n50), .Y(n119) );
  INVX1 U135 ( .A(count_out[15]), .Y(n50) );
  XOR2X1 U136 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n118) );
  XNOR2X1 U137 ( .A(count_out[1]), .B(rollover_val[1]), .Y(n116) );
  XNOR2X1 U138 ( .A(count_out[2]), .B(rollover_val[2]), .Y(n115) );
endmodule


module flex_counter_16 ( clk, n_rst, clear, count_enable, rollover_val, 
        count_out, rollover_flag );
  input [15:0] rollover_val;
  output [15:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;


  flex_counter_NUM_CNT_BITS16 ebit ( .clk(clk), .n_rst(n_rst), .clear(clear), 
        .count_enable(count_enable), .rollover_val(rollover_val), .count_out(
        count_out), .rollover_flag(rollover_flag) );
endmodule


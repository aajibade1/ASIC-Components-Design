/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Wed Feb 12 21:21:12 2020
/////////////////////////////////////////////////////////////


module flex_counter ( clk, n_rst, clear, count_enable, rollover_val, count_out, 
        rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n72, n73, n74;

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
  MUX2X1 U43 ( .B(n47), .A(n48), .S(n49), .Y(n46) );
  OAI21X1 U44 ( .A(n50), .B(n47), .C(n51), .Y(n48) );
  INVX1 U45 ( .A(n52), .Y(n50) );
  OAI22X1 U46 ( .A(n49), .B(n53), .C(n54), .D(n55), .Y(n45) );
  INVX1 U47 ( .A(count_out[1]), .Y(n53) );
  OAI22X1 U48 ( .A(n49), .B(n56), .C(n57), .D(n55), .Y(n44) );
  OAI22X1 U49 ( .A(n49), .B(n58), .C(n59), .D(n55), .Y(n43) );
  NAND3X1 U50 ( .A(n49), .B(n51), .C(n52), .Y(n55) );
  NAND3X1 U51 ( .A(n60), .B(n61), .C(n62), .Y(n52) );
  NOR2X1 U52 ( .A(n63), .B(n64), .Y(n62) );
  XOR2X1 U53 ( .A(rollover_val[1]), .B(count_out[1]), .Y(n63) );
  XOR2X1 U54 ( .A(rollover_val[2]), .B(n56), .Y(n61) );
  INVX1 U55 ( .A(count_out[2]), .Y(n56) );
  XOR2X1 U56 ( .A(rollover_val[3]), .B(n58), .Y(n60) );
  MUX2X1 U57 ( .B(n65), .A(n66), .S(n49), .Y(n42) );
  OR2X1 U58 ( .A(count_enable), .B(clear), .Y(n49) );
  NAND3X1 U59 ( .A(n67), .B(n64), .C(n68), .Y(n66) );
  NOR2X1 U60 ( .A(n69), .B(n70), .Y(n68) );
  OAI21X1 U61 ( .A(n58), .B(n71), .C(n51), .Y(n70) );
  INVX1 U62 ( .A(clear), .Y(n51) );
  INVX1 U63 ( .A(count_out[3]), .Y(n58) );
  XNOR2X1 U64 ( .A(rollover_val[1]), .B(n54), .Y(n69) );
  XOR2X1 U65 ( .A(count_out[1]), .B(n47), .Y(n54) );
  INVX1 U66 ( .A(count_out[0]), .Y(n47) );
  XOR2X1 U67 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n64) );
  NOR2X1 U68 ( .A(n72), .B(n73), .Y(n67) );
  XNOR2X1 U69 ( .A(rollover_val[2]), .B(n57), .Y(n73) );
  XOR2X1 U70 ( .A(n74), .B(count_out[2]), .Y(n57) );
  NAND2X1 U71 ( .A(count_out[1]), .B(count_out[0]), .Y(n74) );
  XNOR2X1 U72 ( .A(rollover_val[3]), .B(n59), .Y(n72) );
  XOR2X1 U73 ( .A(n71), .B(count_out[3]), .Y(n59) );
  NAND3X1 U74 ( .A(count_out[1]), .B(count_out[0]), .C(count_out[2]), .Y(n71)
         );
  INVX1 U75 ( .A(rollover_flag), .Y(n65) );
endmodule


/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Tue Jan 28 22:55:22 2020
/////////////////////////////////////////////////////////////


module adder_1bit_15 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2;

  XOR2X1 U1 ( .A(carry_in), .B(n1), .Y(sum) );
  INVX1 U2 ( .A(n2), .Y(carry_out) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n1), .D(carry_in), .Y(n2) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n1) );
endmodule


module adder_1bit_0 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2;

  XOR2X1 U1 ( .A(carry_in), .B(n1), .Y(sum) );
  INVX1 U2 ( .A(n2), .Y(carry_out) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n1), .D(carry_in), .Y(n2) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n1) );
endmodule


module adder_1bit_1 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2;

  XOR2X1 U1 ( .A(carry_in), .B(n1), .Y(sum) );
  INVX1 U2 ( .A(n2), .Y(carry_out) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n1), .D(carry_in), .Y(n2) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n1) );
endmodule


module adder_1bit_2 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2;

  XOR2X1 U1 ( .A(carry_in), .B(n1), .Y(sum) );
  INVX1 U2 ( .A(n2), .Y(carry_out) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n1), .D(carry_in), .Y(n2) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n1) );
endmodule


module adder_1bit_3 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2;

  XOR2X1 U1 ( .A(carry_in), .B(n1), .Y(sum) );
  INVX1 U2 ( .A(n2), .Y(carry_out) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n1), .D(carry_in), .Y(n2) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n1) );
endmodule


module adder_1bit_4 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2;

  XOR2X1 U1 ( .A(carry_in), .B(n1), .Y(sum) );
  INVX1 U2 ( .A(n2), .Y(carry_out) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n1), .D(carry_in), .Y(n2) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n1) );
endmodule


module adder_1bit_5 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2;

  XOR2X1 U1 ( .A(carry_in), .B(n1), .Y(sum) );
  INVX1 U2 ( .A(n2), .Y(carry_out) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n1), .D(carry_in), .Y(n2) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n1) );
endmodule


module adder_1bit_6 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2;

  XOR2X1 U1 ( .A(carry_in), .B(n1), .Y(sum) );
  INVX1 U2 ( .A(n2), .Y(carry_out) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n1), .D(carry_in), .Y(n2) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n1) );
endmodule


module adder_1bit_7 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2;

  XOR2X1 U1 ( .A(carry_in), .B(n1), .Y(sum) );
  INVX1 U2 ( .A(n2), .Y(carry_out) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n1), .D(carry_in), .Y(n2) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n1) );
endmodule


module adder_1bit_8 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2;

  XOR2X1 U1 ( .A(carry_in), .B(n1), .Y(sum) );
  INVX1 U2 ( .A(n2), .Y(carry_out) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n1), .D(carry_in), .Y(n2) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n1) );
endmodule


module adder_1bit_9 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2;

  XOR2X1 U1 ( .A(carry_in), .B(n1), .Y(sum) );
  INVX1 U2 ( .A(n2), .Y(carry_out) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n1), .D(carry_in), .Y(n2) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n1) );
endmodule


module adder_1bit_10 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2;

  XOR2X1 U1 ( .A(carry_in), .B(n1), .Y(sum) );
  INVX1 U2 ( .A(n2), .Y(carry_out) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n1), .D(carry_in), .Y(n2) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n1) );
endmodule


module adder_1bit_11 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2;

  XOR2X1 U1 ( .A(carry_in), .B(n1), .Y(sum) );
  INVX1 U2 ( .A(n2), .Y(carry_out) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n1), .D(carry_in), .Y(n2) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n1) );
endmodule


module adder_1bit_12 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2;

  XOR2X1 U1 ( .A(carry_in), .B(n1), .Y(sum) );
  INVX1 U2 ( .A(n2), .Y(carry_out) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n1), .D(carry_in), .Y(n2) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n1) );
endmodule


module adder_1bit_13 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2;

  XOR2X1 U1 ( .A(carry_in), .B(n1), .Y(sum) );
  INVX1 U2 ( .A(n2), .Y(carry_out) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n1), .D(carry_in), .Y(n2) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n1) );
endmodule


module adder_1bit_14 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2;

  XOR2X1 U1 ( .A(carry_in), .B(n1), .Y(sum) );
  INVX1 U2 ( .A(n2), .Y(carry_out) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n1), .D(carry_in), .Y(n2) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n1) );
endmodule


module adder_nbit_BIT_WIDTH16 ( a, b, carry_in, sum, overflow );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input carry_in;
  output overflow;

  wire   [15:1] carrys;

  adder_1bit_15 \genblk1[0].IX  ( .a(a[0]), .b(b[0]), .carry_in(carry_in), 
        .sum(sum[0]), .carry_out(carrys[1]) );
  adder_1bit_14 \genblk1[1].IX  ( .a(a[1]), .b(b[1]), .carry_in(carrys[1]), 
        .sum(sum[1]), .carry_out(carrys[2]) );
  adder_1bit_13 \genblk1[2].IX  ( .a(a[2]), .b(b[2]), .carry_in(carrys[2]), 
        .sum(sum[2]), .carry_out(carrys[3]) );
  adder_1bit_12 \genblk1[3].IX  ( .a(a[3]), .b(b[3]), .carry_in(carrys[3]), 
        .sum(sum[3]), .carry_out(carrys[4]) );
  adder_1bit_11 \genblk1[4].IX  ( .a(a[4]), .b(b[4]), .carry_in(carrys[4]), 
        .sum(sum[4]), .carry_out(carrys[5]) );
  adder_1bit_10 \genblk1[5].IX  ( .a(a[5]), .b(b[5]), .carry_in(carrys[5]), 
        .sum(sum[5]), .carry_out(carrys[6]) );
  adder_1bit_9 \genblk1[6].IX  ( .a(a[6]), .b(b[6]), .carry_in(carrys[6]), 
        .sum(sum[6]), .carry_out(carrys[7]) );
  adder_1bit_8 \genblk1[7].IX  ( .a(a[7]), .b(b[7]), .carry_in(carrys[7]), 
        .sum(sum[7]), .carry_out(carrys[8]) );
  adder_1bit_7 \genblk1[8].IX  ( .a(a[8]), .b(b[8]), .carry_in(carrys[8]), 
        .sum(sum[8]), .carry_out(carrys[9]) );
  adder_1bit_6 \genblk1[9].IX  ( .a(a[9]), .b(b[9]), .carry_in(carrys[9]), 
        .sum(sum[9]), .carry_out(carrys[10]) );
  adder_1bit_5 \genblk1[10].IX  ( .a(a[10]), .b(b[10]), .carry_in(carrys[10]), 
        .sum(sum[10]), .carry_out(carrys[11]) );
  adder_1bit_4 \genblk1[11].IX  ( .a(a[11]), .b(b[11]), .carry_in(carrys[11]), 
        .sum(sum[11]), .carry_out(carrys[12]) );
  adder_1bit_3 \genblk1[12].IX  ( .a(a[12]), .b(b[12]), .carry_in(carrys[12]), 
        .sum(sum[12]), .carry_out(carrys[13]) );
  adder_1bit_2 \genblk1[13].IX  ( .a(a[13]), .b(b[13]), .carry_in(carrys[13]), 
        .sum(sum[13]), .carry_out(carrys[14]) );
  adder_1bit_1 \genblk1[14].IX  ( .a(a[14]), .b(b[14]), .carry_in(carrys[14]), 
        .sum(sum[14]), .carry_out(carrys[15]) );
  adder_1bit_0 \genblk1[15].IX  ( .a(a[15]), .b(b[15]), .carry_in(carrys[15]), 
        .sum(sum[15]), .carry_out(overflow) );
endmodule


module adder_16bit ( a, b, carry_in, sum, overflow );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input carry_in;
  output overflow;


  adder_nbit_BIT_WIDTH16 nb ( .a(a), .b(b), .carry_in(carry_in), .sum(sum), 
        .overflow(overflow) );
endmodule


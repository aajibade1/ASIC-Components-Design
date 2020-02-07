/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Fri Feb  7 12:30:46 2020
/////////////////////////////////////////////////////////////


module sync_high ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   stable;

  DFFSR stable_reg ( .D(async_in), .CLK(clk), .R(1'b1), .S(n_rst), .Q(stable)
         );
  DFFSR sync_out_reg ( .D(stable), .CLK(clk), .R(1'b1), .S(n_rst), .Q(sync_out) );
endmodule


// $Id: $
// File name:   edge_detect.sv
// Created:     4/22/2020
// Author:      Abdulrahman Ajibade
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Edge Detect Module.


module edge_detect (
                    input wire clk, input wire n_rst,
                    input wire d_plus, output reg d_edge
                );
 reg nextDplus;
 reg prevDplus;
 reg nextDedge;

 assign  d_edge = nextDplus ^ prevDplus;

 always_ff @ (posedge clk, negedge n_rst) begin
    if (n_rst == 1'b0) begin
        nextDplus <= '1;
        prevDplus <= '1;
    end
    else begin
        prevDplus <= d_plus;
        nextDplus <= prevDplus;
    end
 
 end
endmodule




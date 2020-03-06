// $Id: $
// File name:   sync_low.sv
// Created:     2/6/2020
// Author:      Abdulrahman Ajibade
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Logic Low Synchronizer


module sync_low (input wire clk, input wire n_rst, input wire async_in, output reg sync_out);

reg stable;
always_ff @(posedge clk, negedge n_rst)
begin 
    if(1'b0 == n_rst) begin
        stable <= 1'b0;
        sync_out <= 1'b0;
    end
    else begin
        stable <= async_in;
        sync_out <=stable;
    end
end
      

endmodule

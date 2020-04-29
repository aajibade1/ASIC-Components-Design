// $Id: $
// File name:   decode.sv
// Created:     4/22/2020
// Author:      Abdulrahman Ajibade
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Decode Module.


module decode (
                input wire clk, input wire n_rst, 
                input wire d_plus, input wire shift_enable,
                input wire eop, output reg d_orig
            );

            reg currNext;
            reg curr;
            reg prev;
            reg prevNext;
always_ff @ (posedge clk, negedge n_rst) begin
    if (n_rst == 1'b0) begin 
        curr <= '1;
        prev <= '1;
    end
    else begin
        curr <= currNext;
        prev <= prevNext;
    end

end

always_comb begin
    d_orig = '1;
    if (curr != prev) begin
        d_orig = '0;
    end
end
 
always_comb begin
    prevNext = prev;
    currNext = curr;
    if (shift_enable == 1'b1 && eop == 1'b1) begin
        currNext = '1;
        prevNext = '1;
    end
    else if (shift_enable == 1'b1) begin
        prevNext = curr;
        currNext = d_plus;
    end
    else begin
        currNext = d_plus;
    end

end
endmodule

// $Id: $
// File name:   magnitude.sv
// Created:     3/4/2020
// Author:      Abdulrahman Ajibade
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Magnitude block module.


module magnitude (input wire[16:0] in, output reg[15:0] out);

    
    
    always_comb begin
        out = '0;
        if (in[16] == 1'b1) begin
            out = ~in[15:0] + 1;
        end
        else if (in[16] == 1'b0) begin
            out = in[15:0];
        end
    end
endmodule


// $Id: $
// File name:   eop_detect.sv
// Created:     4/22/2020
// Author:      Abdulrahman Ajibade
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: EOP Detect Block.


module eop_detect (
                    input wire d_plus, input wire d_minus,
                    output reg eop
                  );

     always_comb begin
         eop = '0;
         if ((d_plus ==1'b0) && (d_minus == 1'b0)) begin
            eop = 1'b1;
         end
     end
 endmodule

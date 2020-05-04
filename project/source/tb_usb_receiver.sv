// $Id: $
// File name:   tb_usb_receiver.sv
// Created:     4/23/2020
// Author:      Abdulrahman Ajibade
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: USB Receiver Module TestBench.

`timescale 1ns / 10ps

module tb_usb_receiver();

  // Define parameters
  parameter CLK_PERIOD        = 10.42;
  parameter NORM_DATA_PERIOD  = (8 * CLK_PERIOD);
  
  localparam OUTPUT_CHECK_DELAY = (CLK_PERIOD - 0.2);
  localparam WORST_FAST_DATA_PERIOD = (NORM_DATA_PERIOD * 0.965);
  localparam WORST_SLOW_DATA_PERIOD = (NORM_DATA_PERIOD * 1.035);

  //  DUT inputs
  reg tb_clk;
  reg tb_n_rst;
  reg tb_d_plus;
  reg tb_d_minus;
  reg tb_r_enable;
  
  // DUT outputs
  wire [7:0] tb_r_data;
  wire tb_empty;
  wire tb_full;
  wire tb_rcving;
  wire tb_r_error;

  // Test bench debug signals
  // Overall test case number for reference
  integer tb_test_num;
  string  tb_test_case;
  // Test case 'inputs' used for test stimulus
  reg [8:0] tb_test_d_plus;
  reg [8:0] tb_test_d_minus;
  time      tb_test_bit_period;
  // Test case expected output values for the test case
  reg [7:0] tb_expected_r_data;
  reg       tb_expected_empty;
  reg       tb_expected_r_error;
  reg       tb_expected_rcving;
  
  // DUT portmap
  usb_receiver DUT
  (
    .clk(tb_clk),
    .n_rst(tb_n_rst),
    .d_plus(tb_d_plus),
    .d_minus(tb_d_minus),
    .r_enable(r_enable),
    .r_data(tb_r_data),
    .empty(tb_empty),
    .full(tb_full),
    .r_error(tb_r_error),
    .rcving(tb_rcving)
  );
    // Tasks for regulating the timing of input stimulus to the design
  task send_packet;
    input  [7:0] data_plus;
    input  [7:0] data_minus;
    input  time data_period;
    
    integer i;
  begin
    // First synchronize to away from clock's rising edge
    @(negedge tb_clk)
    
    // Send data bits
    for(i = 0; i < 8; i = i + 1)
    begin
      tb_d_plus = data_plus[i];
      tb_d_minus = ~data_minus[i];
      #data_period;
    end
    
  end
  endtask
  
  task send_packet2;
    input  [8:0] data_plus;
    input  [8:0] data_minus;
    input  time data_period;
    
    integer i;
  begin
    // First synchronize to away from clock's rising edge
    @(negedge tb_clk)
    
    // Send data bits
    for(i = 0; i < 9; i = i + 1)
    begin
      tb_d_plus = data_plus[i];
      tb_d_minus = ~data_minus[i];
      #data_period;
    end
    
  end
  endtask 
  task reset_dut;
  begin
    // Activate the design's reset (does not need to be synchronize with clock)
    tb_n_rst = 1'b0;
    
    // Wait for a couple clock cycles
    @(posedge tb_clk);
    @(posedge tb_clk);
    
    // Release the reset
    @(negedge tb_clk);
    tb_n_rst = 1;
    
    // Wait for a while before activating the design
    @(posedge tb_clk);
    @(posedge tb_clk);
  end
  endtask

  always
  begin : CLK_GEN
    tb_clk = 1'b0;
    #(CLK_PERIOD / 2);
    tb_clk = 1'b1;
    #(CLK_PERIOD / 2);
  end

  // Actual test bench process
  initial
  begin : TEST_PROC
    // Initialize all test bench signals
    tb_test_num               = -1;
    tb_test_case              = "TB Init";
    tb_test_d_plus              = '1;
    tb_test_d_minus             = '0;
    tb_expected_r_data       = '0;
    tb_expected_empty    = 1'b0; 
    tb_expected_rcving = 1'b0;
    tb_expected_r_error       = 1'b0;
    tb_test_bit_period        = NORM_DATA_PERIOD;
    // Initilize all inputs to inactive/idle values
    tb_n_rst      = 1'b1; // Initially inactive
    tb_d_plus    = 1'b1;
    tb_d_minus  = 1'b0;
    tb_r_enable = 1'b0;
    // Get away from Time = 0
    #0.1; 
    
    // Test case 0: Basic Power on Reset
    tb_test_num  = 0;
    tb_test_case = "Power-on-Reset";

    reset_dut;

   // check_outputs();

    #tb_test_bit_period;
    // Test case 1: Sync Byte Test
    // Synchronize to falling edge of clock to prevent timing shifts from prior test case(s)
    @(negedge tb_clk);
    tb_test_num  += 1;
    tb_test_case = "SYNC BYTE";

    // Setup packet info for debugging/verificaton signals
    tb_test_d_plus    = 8'b00101010;
    tb_test_d_minus   = 8'b00101010;
    tb_test_bit_period = NORM_DATA_PERIOD;

    // Define expected ouputs for this test case
    tb_expected_r_data       = '0;
    tb_expected_rcving    = 1'b1; 
    tb_expected_r_error = 1'b0;
    tb_expected_empty       = 1'b0;

    // DUT Reset
    reset_dut;

    // Send packet
    send_packet(tb_test_d_plus, tb_test_d_minus, tb_test_bit_period);

    // Test case 2: Sync Byte and EOP Test
    // Synchronize to falling edge of clock to prevent timing shifts from prior test case(s)
    @(negedge tb_clk);
    tb_test_num  += 1;
    tb_test_case = "SYNC BYTE & EOP";
    tb_test_d_plus = '1;
    tb_test_d_minus = '1;

    // Setup packet info for debugging/verificaton signals
    tb_test_d_plus    = 8'b00101010;
    tb_test_d_minus   = 8'b00101010;
    tb_test_bit_period = NORM_DATA_PERIOD;

    // Define expected ouputs for this test case
    tb_expected_r_data       = '0;
    tb_expected_rcving    = 1'b1; 
    tb_expected_r_error = 1'b0;
    tb_expected_empty       = 1'b0;

    // DUT Reset
    reset_dut;
    tb_d_plus    = 1'b1;
    tb_d_minus  = 1'b0;
    tb_r_enable = 1'b0;

    // Send packet
    send_packet(tb_test_d_plus, tb_test_d_minus, tb_test_bit_period);

    tb_test_d_plus    = 8'b11111100;
    tb_test_d_minus   = 8'b11111111;

     send_packet(tb_test_d_plus, tb_test_d_minus, tb_test_bit_period);

    // Test case 3:Sync Byte normal byte then EOP
    // Synchronize to falling edge of clock to prevent timing shifts from prior test case(s)
    @(negedge tb_clk);
    tb_test_num  += 1;
    tb_test_case = "SYNC BYTE -> 3 NORMAL BYTE -> EOP";
    tb_test_d_plus = '1;
    tb_test_d_minus = '1;

    // Setup packet info for debugging/verificaton signals
    tb_test_d_plus    = 8'b00101010;
    tb_test_d_minus   = 8'b00101010;
    tb_test_bit_period = NORM_DATA_PERIOD;

    // Define expected ouputs for this test case
    tb_expected_r_data       = '0;
    tb_expected_rcving    = 1'b1; 
    tb_expected_r_error = 1'b0;
    tb_expected_empty       = 1'b0;

    // DUT Reset
    reset_dut;
    tb_d_plus    = 1'b1;
    tb_d_minus  = 1'b0;
    tb_r_enable = 1'b0;

    // Send packet
    send_packet(tb_test_d_plus, tb_test_d_minus, tb_test_bit_period);

    tb_test_d_plus    = 8'b10101101;
    tb_test_d_minus   = 8'b10101101;

    send_packet(tb_test_d_plus, tb_test_d_minus, tb_test_bit_period);

    tb_test_d_plus    = 8'b01001011;
    tb_test_d_minus   = 8'b01001011;

    send_packet(tb_test_d_plus, tb_test_d_minus, tb_test_bit_period);

    tb_test_d_plus    = 8'b01111110;
    tb_test_d_minus   = 8'b01111110;
    

    send_packet(tb_test_d_plus, tb_test_d_minus, tb_test_bit_period);

    tb_test_d_plus    = 8'b11111100;
    tb_test_d_minus   = 8'b11111111;

    send_packet(tb_test_d_plus, tb_test_d_minus, tb_test_bit_period);



    // Test case 4:Sync Byte normal byte then EOP WORST-FAST
    // Synchronize to falling edge of clock to prevent timing shifts from prior test case(s)
    @(negedge tb_clk);
    tb_test_num  += 1;
    tb_test_case = "SYNC BYTE -> 3 NORMAL BYTE -> EOP WORST-FAST";
    tb_test_d_plus = '1;
    tb_test_d_minus = '1;

    // Setup packet info for debugging/verificaton signals
    tb_test_d_plus    = 8'b00101010;
    tb_test_d_minus   = 8'b00101010;
    tb_test_bit_period = WORST_FAST_DATA_PERIOD ;

    // Define expected ouputs for this test case
    tb_expected_r_data       = '0;
    tb_expected_rcving    = 1'b1; 
    tb_expected_r_error = 1'b0;
    tb_expected_empty       = 1'b0;

    // DUT Reset
    reset_dut;
    tb_d_plus    = 1'b1;
    tb_d_minus  = 1'b0;
    tb_r_enable = 1'b0;

    // Send packet
    send_packet(tb_test_d_plus, tb_test_d_minus, tb_test_bit_period);

    tb_test_d_plus    = 8'b11011010;
    tb_test_d_minus   = 8'b11011010;

    send_packet(tb_test_d_plus, tb_test_d_minus, tb_test_bit_period);

    tb_test_d_plus    = 8'b01001011;
    tb_test_d_minus   = 8'b01001011;

    send_packet(tb_test_d_plus, tb_test_d_minus, tb_test_bit_period);

    tb_test_d_plus    = 8'b01111110;
    tb_test_d_minus   = 8'b01111110;

    send_packet(tb_test_d_plus, tb_test_d_minus, tb_test_bit_period);

    tb_test_d_plus    = 8'b11111100;
    tb_test_d_minus   = 8'b11111111;

    send_packet(tb_test_d_plus, tb_test_d_minus, tb_test_bit_period);

    // Test case 5:Sync Byte normal byte then EOP WORST-SLOW
    // Synchronize to falling edge of clock to prevent timing shifts from prior test case(s)
    @(negedge tb_clk);
    tb_test_num  += 1;
    tb_test_case = "SYNC BYTE -> 3 NORMAL BYTE -> EOP WORST-SLOW";
    tb_test_d_plus = '1;
    tb_test_d_minus = '1;

    // Setup packet info for debugging/verificaton signals
    tb_test_d_plus    = 8'b00101010;
    tb_test_d_minus   = 8'b00101010;
    tb_test_bit_period = WORST_SLOW_DATA_PERIOD ;

    // Define expected ouputs for this test case
    tb_expected_r_data       = '0;
    tb_expected_rcving    = 1'b1; 
    tb_expected_r_error = 1'b0;
    tb_expected_empty       = 1'b0;

    // DUT Reset
    reset_dut;
    tb_d_plus    = 1'b1;
    tb_d_minus  = 1'b0;
    tb_r_enable = 1'b0;

    // Send packet
    send_packet(tb_test_d_plus, tb_test_d_minus, tb_test_bit_period);

    tb_test_d_plus    = 8'b11011010;
    tb_test_d_minus   = 8'b11011010;

    send_packet(tb_test_d_plus, tb_test_d_minus, tb_test_bit_period);

    tb_test_d_plus    = 8'b01001011;
    tb_test_d_minus   = 8'b01001011;

    send_packet(tb_test_d_plus, tb_test_d_minus, tb_test_bit_period);

    tb_test_d_plus    = 8'b01111110;
    tb_test_d_minus   = 8'b01111110;

    send_packet(tb_test_d_plus, tb_test_d_minus, tb_test_bit_period);

    tb_test_d_plus    = 8'b11111100;
    tb_test_d_minus   = 8'b11111111;

    send_packet(tb_test_d_plus, tb_test_d_minus, tb_test_bit_period);
    
    // Test case 6:Sync Byte incomplete byte then EOP 
    // Synchronize to falling edge of clock to prevent timing shifts from prior test case(s)
    @(negedge tb_clk);
    tb_test_num  += 1;
    tb_test_case = "SYNC BYTE -> 3 NORMAL BYTE -> EOP WORST-FAST";
    tb_test_d_plus = '1;
    tb_test_d_minus = '1;

    // Setup packet info for debugging/verificaton signals
    tb_test_d_plus    = 8'b00101010;
    tb_test_d_minus   = 8'b00101010;
    tb_test_bit_period =    NORM_DATA_PERIOD ;

    // Define expected ouputs for this test case
    tb_expected_r_data       = '0;
    tb_expected_rcving    = 1'b1; 
    tb_expected_r_error = 1'b0;
    tb_expected_empty       = 1'b0;

    // DUT Reset
    reset_dut;
    tb_d_plus    = 1'b1;
    tb_d_minus  = 1'b0;
    tb_r_enable = 1'b0;

    // Send packet
    send_packet(tb_test_d_plus, tb_test_d_minus, tb_test_bit_period);

    tb_test_d_plus    = 8'b11011010;
    tb_test_d_minus   = 8'b11111010;

    send_packet(tb_test_d_plus, tb_test_d_minus, tb_test_bit_period);
    tb_test_d_plus    = 8'b00101010;
    tb_test_d_minus   = 8'b00101010;

    send_packet(tb_test_d_plus, tb_test_d_minus, tb_test_bit_period);


    // Test case 7:Incorrect Sync Byte normal byte then EOP Then New packet
    // Synchronize to falling edge of clock to prevent timing shifts from prior test case(s)
    @(negedge tb_clk);
    tb_test_num  += 1;
    tb_test_case = "SYNC BYTE -> 3 NORMAL BYTE -> EOP";
    tb_test_d_plus = '1;
    tb_test_d_minus = '1;

    // Setup packet info for debugging/verificaton signals
    tb_test_d_plus    = 8'b10101010;
    tb_test_d_minus   = 8'b10101010;
    tb_test_bit_period = NORM_DATA_PERIOD ;

    // Define expected ouputs for this test case
    tb_expected_r_data       = '0;
    tb_expected_rcving    = 1'b1; 
    tb_expected_r_error = 1'b0;
    tb_expected_empty       = 1'b0;

    // DUT Reset
    reset_dut;
    tb_d_plus    = 1'b1;
    tb_d_minus  = 1'b0;
    tb_r_enable = 1'b0;

    // Send packet
    send_packet(tb_test_d_plus, tb_test_d_minus, tb_test_bit_period);

    tb_test_d_plus    = 8'b11011010;
    tb_test_d_minus   = 8'b11011010;

    send_packet(tb_test_d_plus, tb_test_d_minus, tb_test_bit_period);

    tb_test_d_plus    = 8'b01001011;
    tb_test_d_minus   = 8'b01001011;

    send_packet(tb_test_d_plus, tb_test_d_minus, tb_test_bit_period);

    tb_test_d_plus    = 8'b01111110;
    tb_test_d_minus   = 8'b01111110;

    send_packet(tb_test_d_plus, tb_test_d_minus, tb_test_bit_period);

    tb_test_d_plus    = 8'b11111100;
    tb_test_d_minus   = 8'b11111111;

    send_packet(tb_test_d_plus, tb_test_d_minus, tb_test_bit_period);

    tb_test_d_plus    = 8'b00101010;
    tb_test_d_minus   = 8'b00101010;

    send_packet(tb_test_d_plus, tb_test_d_minus, tb_test_bit_period);

    // Test case 8: MULTIPLE PACKETS
    // Synchronize to falling edge of clock to prevent timing shifts from prior test case(s)
    @(negedge tb_clk);
    tb_test_num  += 1;
    tb_test_case = "SYNC BYTE -> 3 NORMAL BYTE -> EOP WORST-SLOW";
    tb_test_d_plus = '1;
    tb_test_d_minus = '1;

    // Setup packet info for debugging/verificaton signals
    tb_test_d_plus    = 8'b00101010;
    tb_test_d_minus   = 8'b00101010;

    tb_test_bit_period = NORM_DATA_PERIOD ;

    // Define expected ouputs for this test case
    tb_expected_r_data       = '0;
    tb_expected_rcving    = 1'b1; 
    tb_expected_r_error = 1'b0;
    tb_expected_empty       = 1'b0;

    // DUT Reset
    reset_dut;
    tb_d_plus    = 1'b1;
    tb_d_minus  = 1'b0;
    tb_r_enable = 1'b0;

    // Send packet
    send_packet(tb_test_d_plus, tb_test_d_minus, tb_test_bit_period);

    tb_test_d_plus    = 8'b11011010;
    tb_test_d_minus   = 8'b11011010;

    send_packet(tb_test_d_plus, tb_test_d_minus, tb_test_bit_period);

    tb_test_d_plus    = 8'b01001011;
    tb_test_d_minus   = 8'b01001011;

    send_packet(tb_test_d_plus, tb_test_d_minus, tb_test_bit_period);

    tb_test_d_plus    = 8'b01111110;
    tb_test_d_minus   = 8'b01111110;

    send_packet(tb_test_d_plus, tb_test_d_minus, tb_test_bit_period);

    tb_test_d_plus    = 8'b11111100;
    tb_test_d_minus   = 8'b11111111;

    send_packet(tb_test_d_plus, tb_test_d_minus, tb_test_bit_period);
    
    tb_test_d_plus    = 8'b00101010;
    tb_test_d_minus   = 8'b00101010;

    send_packet(tb_test_d_plus, tb_test_d_minus, tb_test_bit_period);

    tb_test_d_plus    = 8'b01001011;
    tb_test_d_minus   = 8'b01001011;

    send_packet(tb_test_d_plus, tb_test_d_minus, tb_test_bit_period);

    tb_test_d_plus    = 8'b01111110;
    tb_test_d_minus   = 8'b01111110;

    send_packet(tb_test_d_plus, tb_test_d_minus, tb_test_bit_period);

    tb_test_d_plus    = 8'b11111100;
    tb_test_d_minus   = 8'b11111111;

    send_packet(tb_test_d_plus, tb_test_d_minus, tb_test_bit_period); 
   
    // Test case 9: BIT STUFFING
    // Synchronize to falling edge of clock to prevent timing shifts from prior test case(s)
    @(negedge tb_clk);
    tb_test_num  += 1;
    tb_test_case = "SYNC BYTE -> 3 NORMAL BYTE -> EOP WORST-SLOW";
    tb_test_d_plus = '1;
    tb_test_d_minus = '1;

    // Setup packet info for debugging/verificaton signals
    tb_test_d_plus    = 8'b00101010;
    tb_test_d_minus   = 8'b00101010;

    tb_test_bit_period = NORM_DATA_PERIOD ;

    // Define expected ouputs for this test case
    tb_expected_r_data       = '0;
    tb_expected_rcving    = 1'b1; 
    tb_expected_r_error = 1'b0;
    tb_expected_empty       = 1'b0;

    // DUT Reset
    reset_dut;
    tb_d_plus    = 1'b1;
    tb_d_minus  = 1'b0;
    tb_r_enable = 1'b0;

    // Send packet
    send_packet(tb_test_d_plus, tb_test_d_minus, tb_test_bit_period);

    tb_test_d_plus    = 9'b101111111;
    tb_test_d_minus   = 9'b101111111;

    send_packet2(tb_test_d_plus, tb_test_d_minus, tb_test_bit_period);

    tb_test_d_plus    = 9'b110000000;
    tb_test_d_minus   = 9'b110000000;

    send_packet2(tb_test_d_plus, tb_test_d_minus, tb_test_bit_period);

    tb_test_d_plus    = 9'b011111110;
    tb_test_d_minus   = 9'b011111110;

    send_packet2(tb_test_d_plus, tb_test_d_minus, tb_test_bit_period);

    tb_test_d_plus    = 9'b000101010;
    tb_test_d_minus   = 9'b100101010;

    send_packet2(tb_test_d_plus, tb_test_d_minus, tb_test_bit_period);

    tb_test_d_plus    = 9'b111111110;
    tb_test_d_minus   = 9'b111111111;
   
    send_packet2(tb_test_d_plus, tb_test_d_minus, tb_test_bit_period);

end
endmodule

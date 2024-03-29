// 337 TA Provided Lab 4 Testbench
// This code serves as a starer test bench for the synchronizer design
// STUDENT: Replace this message and the above header section with an
// appropriate header based on your other code files

// 0.5um D-FlipFlop Timing Data Estimates:
// Data Propagation delay (clk->Q): 670ps
// Setup time for data relative to clock: 190ps
// Hold time for data relative to clock: 10ps

`timescale 1ns / 10ps

module tb_flex_counter();

  // Define local parameters used by the test bench
  localparam  CLK_PERIOD    = 10;
  localparam  FF_SETUP_TIME = 0.190;
  localparam  FF_HOLD_TIME  = 0.100;
  localparam  CHECK_DELAY   = (CLK_PERIOD - FF_SETUP_TIME); // Check right before the setup time starts
  
  localparam  INACTIVE_VALUE     = 1'b0;
  localparam  RESET_OUTPUT_VALUE = INACTIVE_VALUE;
  localparam NUM_CNT_BITS = 4;

  
  // Declare DUT portmap signals
  reg tb_clk;
  reg tb_n_rst;
  reg tb_clear;
  reg tb_count_enable;
  reg tb_rollover_flag;
  reg [NUM_CNT_BITS-1:0]tb_count_out;
  reg [NUM_CNT_BITS-1:0]tb_rollover_val;
  
  // Declare test bench signals
  integer tb_test_num;
  string tb_test_case;
  integer tb_stream_test_num;
  string tb_stream_check_tag;
  
  // Task for standard DUT reset procedure
  task reset_dut;
  begin
    // Activate the reset
    tb_n_rst = 1'b0;

    // Maintain the reset for more than one cycle
    @(posedge tb_clk);
    @(posedge tb_clk);

    // Wait until safely away from rising edge of the clock before releasing
    @(negedge tb_clk);
    tb_n_rst = 1'b1;

    // Leave out of reset for a couple cycles before allowing other stimulus
    // Wait for negative clock edges, 
    // since inputs to DUT should normally be applied away from rising clock edges
    @(negedge tb_clk);
    @(negedge tb_clk);
  end
  endtask
  
  task clear;
  begin
    // Activate the reset
    @(negedge tb_clk);
    tb_clear = 1'b1;

    // Maintain the reset for more than one cycle
    @(posedge tb_clk);
    @(posedge tb_clk);

    // Wait until safely away from rising edge of the clock before releasing
    @(negedge tb_clk);
    tb_clear = 1'b0;

  end
  endtask
  // Task to cleanly and consistently check DUT output values
  task check_rollover;
    input logic expected_value;
    input string check_rollover;
  begin
    if(expected_value == tb_rollover_flag) begin // Check passed
      $info("Correct Rollover Value", check_rollover, tb_test_case);
    end
    else begin // Check failed
      $error("Incorrect Rollover Value", check_rollover, tb_test_case);
    end
  end
  endtask

  task check_count_out;
    input logic [NUM_CNT_BITS-1:0]expected_value;
    input string check_tag;
  begin
    if(expected_value == tb_count_out) begin // Check passed
      $info("Correct Count Value", check_tag, tb_test_case);
    end
    else begin // Check failed
      $error("Incorrect Count Value", check_tag, tb_test_case);
    end
  end
  endtask 
  
  // Task to cleanly and consistently check for correct values during MetaStability Test Cases
  task check_clear;
    input string check_tag;
  begin
    // Only need to check that it's not a metastable value since decays are random
      if((1'b1 == tb_clear) && (4'b0 == tb_count_out) && (1'b0 == tb_rollover_flag)) begin // Check passed
      $info("Clear test case Passed", check_tag, tb_test_case);
    end
    else begin // Check failed
        $error("Clear test case failed", check_tag, tb_test_case);
    end
  end
  endtask

  // Clock generation block
  always
  begin
    // Start with clock low to avoid false rising edge events at t=0
    tb_clk = 1'b0;
    // Wait half of the clock period before toggling clock value (maintain 50% duty cycle)
    #(CLK_PERIOD/2.0);
    tb_clk = 1'b1;
    // Wait half of the clock period before toggling clock value via rerunning the block (maintain 50% duty cycle)
    #(CLK_PERIOD/2.0);
  end
  
  // DUT Port map
  flex_counter DUT(.clk(tb_clk), .n_rst(tb_n_rst), .clear(tb_clear), .count_enable(tb_count_enable), .rollover_val(tb_rollover_val), .count_out(tb_count_out), .rollover_flag(tb_rollover_flag));
  
  // Test bench main process
  initial
  begin
    // Initialize all of the test inputs
    tb_n_rst  = 1'b1;              // Initialize to be inactive
   // tb_async_in  = INACTIVE_VALUE; // Initialize input to inactive  value
    tb_clear = INACTIVE_VALUE;
    tb_count_enable = INACTIVE_VALUE;
    tb_rollover_val = '0;
    tb_test_num = 0;               // Initialize test case counter
    tb_test_case = "Test bench initializaton";
    tb_stream_test_num = 0;
    tb_stream_check_tag = "N/A";
    // Wait some time before starting first test case
    #(0.1);
    
    // ************************************************************************
    // Test Case 1: Power-on Reset of the DUT
    // ************************************************************************
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Power on Reset";
    // Note: Do not use reset task during reset test case since we need to specifically check behavior during reset
    // Wait some time before applying test case stimulus
    #(0.1);
    // Apply test case initial stimulus
    tb_n_rst = INACTIVE_VALUE;
    tb_clear  = INACTIVE_VALUE;
    tb_count_enable = INACTIVE_VALUE;
 
    // Set to be the the non-reset value
    tb_n_rst  = 1'b0;    // Activate reset
    // Wait for a bit before checking for correct functionality
    #(CLK_PERIOD * 0.5);

    // Check that internal state was correctly reset
    check_count_out(4'b0, 
                  "after reset applied");
    
    // Check that the reset value is maintained during a clock cycle
    #(CLK_PERIOD);
    check_count_out(4'b0, 
                  "after clock cycle while in reset");
    
    // Release the reset away from a clock edge
    @(posedge tb_clk);
    #(2 * FF_HOLD_TIME);
    tb_n_rst  = 1'b1;   // Deactivate the chip reset
    #0.1;
    // Check that internal state was correctly keep after reset release
   // check_output( RESET_OUTPUT_VALUE, 
     //             "after reset was released");

    // ************************************************************************
    // Test Case 2: Rollover for a rollover value that is not a power of two
    // ************************************************************************    
    @(negedge tb_clk); 
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Rollover for a rollover value that is not a power of two";
    // Start out with inactive value and reset the DUT to isolate from prior tests
    tb_rollover_val = INACTIVE_VALUE;
    tb_clear = INACTIVE_VALUE;
    tb_count_enable = INACTIVE_VALUE;

    reset_dut();

    // Assign test case stimulus
    @(negedge tb_clk); 
    tb_count_enable = 1'b1;
    tb_rollover_val = 4'd15;

    repeat(27)
        @(posedge tb_clk); 
    // Check results
    #(CHECK_DELAY);
    check_rollover(1'b1,"Checking Rollover Flag");

    // ************************************************************************    
    // Test Case 3: Continuos counting
    // ************************************************************************
    @(negedge tb_clk); 
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Continuous counting";
    // Start out with inactive value and reset the DUT to isolate from prior test
    tb_rollover_val = INACTIVE_VALUE;
    tb_clear = INACTIVE_VALUE;
    tb_count_enable = INACTIVE_VALUE;
    
    reset_dut();

    // Handle setup violation test case stimulus
    // Timing violations require value transisitions on input
    // -> Need to start with input at oppositte value of main stimulus
    //tb_async_in = 1'b1;
    // Allow value to feed in to design
    @(posedge tb_clk);
    // Wait until test is inside the setup time before the next rising clock edge
    #(CLK_PERIOD - (FF_SETUP_TIME * 0.5)); 
    // Change the input value
    @(negedge tb_clk); 
    tb_count_enable = 1'b1;
    tb_rollover_val = 4'd4;

   
    repeat(16)
        @(posedge tb_clk);
   // #(CHECK_DELAY);
    @(negedge tb_clk);
    check_rollover(1'd1,"check Continuous Rollover");
    check_clear("Checking if cleared");
   // @(posedge tb_clk);
    @(negedge tb_clk);
    check_count_out(4'd1, "Check Countinuos count");
    
    // ************************************************************************
    // Test Case 4: Discontinuos Counting
    // ************************************************************************
    @(negedge tb_clk); 
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Discontinuous counting";
    // Start out with inactive value and reset the DUT to isolate from prior test
    tb_rollover_val = INACTIVE_VALUE;
    tb_clear = INACTIVE_VALUE;
    tb_count_enable = INACTIVE_VALUE;
    
    reset_dut();

    // Handle setup violation test case stimulus
    // Timing violations require value transisitions on input
    // -> Need to start with input at oppositte value of main stimulus
    //tb_async_in = 1'b1;
    // Allow value to feed in to design
    @(posedge tb_clk);
    // Wait until test is inside the setup time before the next rising clock edge
    #(CLK_PERIOD - (FF_SETUP_TIME * 0.5)); 
    // Change the input value
    @(negedge tb_clk);
    tb_count_enable = 1'b1;
    tb_rollover_val = 4'd4;
 
    @(posedge tb_clk); 
    @(posedge tb_clk); 
    //@(posedge tb_clk); 
  //  #(CHECK_DELAY)
    @(negedge tb_clk);
    check_count_out(4'd2,"Discontinuos Counting");
    tb_count_enable = 1'b0;
    
    //#(CHECK_DELAY);
    @(negedge tb_clk);
    check_count_out(4'd2,"Discontinuos Counting");  
    // ************************************************************************
    // Test Case 5: Clearing while counting to check clear vs count_enable priority
    // ************************************************************************    
    @(negedge tb_clk); 
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Clearing while counting to check clear vs count_enable priority";
    tb_rollover_val = INACTIVE_VALUE;
    tb_clear = INACTIVE_VALUE;
    tb_count_enable = INACTIVE_VALUE;
     
    // Start out with inactive value and reset the DUT to isolate from prior tests
  //  tb_async_in = INACTIVE_VALUE;
    reset_dut();

    // Assign test case stimulus
    @(negedge tb_clk);
    tb_count_enable = 1'b1;
    tb_rollover_val = 4'd3;

    @(posedge tb_clk); 
    @(posedge tb_clk); 
   // #(CHECK_DELAY);
    clear();
    check_clear("Checking clear");
    @(posedge tb_clk);
    #(CHECK_DELAY);
    check_count_out( 4'd1,"Clear while counting");
    check_count_out( 4'd2, "Clear while counting");

  end
endmodule

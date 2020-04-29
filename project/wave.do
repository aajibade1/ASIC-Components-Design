onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_usb_receiver/tb_clk
add wave -noupdate /tb_usb_receiver/tb_n_rst
add wave -noupdate /tb_usb_receiver/tb_test_num
add wave -noupdate -group tb_inputs /tb_usb_receiver/tb_d_plus
add wave -noupdate -group tb_inputs /tb_usb_receiver/tb_d_minus
add wave -noupdate -group tb_inputs /tb_usb_receiver/tb_r_enable
add wave -noupdate -group tb_outputs /tb_usb_receiver/tb_r_data
add wave -noupdate -group tb_outputs /tb_usb_receiver/tb_empty
add wave -noupdate -group tb_outputs /tb_usb_receiver/tb_full
add wave -noupdate -group tb_outputs /tb_usb_receiver/tb_rcving
add wave -noupdate -group tb_outputs /tb_usb_receiver/tb_r_error
add wave -noupdate -group tb_test_data /tb_usb_receiver/tb_test_d_plus
add wave -noupdate -group tb_test_data /tb_usb_receiver/tb_test_d_minus
add wave -noupdate -group tb_test_data /tb_usb_receiver/tb_test_bit_period
add wave -noupdate -group tb_expected_data /tb_usb_receiver/tb_expected_r_data
add wave -noupdate -group tb_expected_data /tb_usb_receiver/tb_expected_empty
add wave -noupdate -group tb_expected_data /tb_usb_receiver/tb_expected_r_error
add wave -noupdate -group tb_expected_data /tb_usb_receiver/tb_expected_rcving
add wave -noupdate -group {eop signals} /tb_usb_receiver/DUT/ep/d_plus
add wave -noupdate -group {eop signals} /tb_usb_receiver/DUT/ep/d_minus
add wave -noupdate -group {eop signals} /tb_usb_receiver/DUT/ep/eop
add wave -noupdate -group {Decoded signals} /tb_usb_receiver/DUT/unc/d_plus
add wave -noupdate -group {Decoded signals} /tb_usb_receiver/DUT/unc/shift_enable
add wave -noupdate -group {Decoded signals} /tb_usb_receiver/DUT/unc/eop
add wave -noupdate -group {Decoded signals} /tb_usb_receiver/DUT/unc/d_orig
add wave -noupdate -group {Timer signals} /tb_usb_receiver/DUT/tim/d_edge
add wave -noupdate -group {Timer signals} /tb_usb_receiver/DUT/tim/rcving
add wave -noupdate -group {Timer signals} /tb_usb_receiver/DUT/tim/shift_enable
add wave -noupdate -group {Timer signals} /tb_usb_receiver/DUT/tim/byte_received
add wave -noupdate -group {Timer signals} /tb_usb_receiver/DUT/tim/count
add wave -noupdate -group {Timer signals} /tb_usb_receiver/DUT/tim/count_out1
add wave -noupdate -group {RCU Signals} /tb_usb_receiver/DUT/rc/d_edge
add wave -noupdate -group {RCU Signals} /tb_usb_receiver/DUT/rc/eop
add wave -noupdate -group {RCU Signals} /tb_usb_receiver/DUT/rc/shift_enable
add wave -noupdate -group {RCU Signals} /tb_usb_receiver/DUT/rc/rcv_data
add wave -noupdate -group {RCU Signals} /tb_usb_receiver/DUT/rc/byte_received
add wave -noupdate -group {RCU Signals} /tb_usb_receiver/DUT/rc/rcving
add wave -noupdate -group {RCU Signals} /tb_usb_receiver/DUT/rc/w_enable
add wave -noupdate -group {RCU Signals} /tb_usb_receiver/DUT/rc/r_error
add wave -noupdate -group {RCU Signals} /tb_usb_receiver/DUT/rc/bit_count
add wave -noupdate -group {RCU Signals} /tb_usb_receiver/DUT/rc/state
add wave -noupdate -group {RCU Signals} /tb_usb_receiver/DUT/rc/next_state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {443 ps}

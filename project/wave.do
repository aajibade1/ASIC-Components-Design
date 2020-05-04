onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_usb_receiver/tb_clk
add wave -noupdate /tb_usb_receiver/tb_n_rst
add wave -noupdate /tb_usb_receiver/tb_test_num
add wave -noupdate -group tb_inputs -color {Green Yellow} /tb_usb_receiver/tb_d_plus
add wave -noupdate -group tb_inputs -color {Green Yellow} /tb_usb_receiver/tb_d_minus
add wave -noupdate -group tb_inputs -color {Green Yellow} /tb_usb_receiver/tb_r_enable
add wave -noupdate -group tb_outputs -color {Spring Green} /tb_usb_receiver/tb_r_data
add wave -noupdate -group tb_outputs -color {Spring Green} /tb_usb_receiver/tb_empty
add wave -noupdate -group tb_outputs -color {Spring Green} /tb_usb_receiver/tb_full
add wave -noupdate -group tb_outputs -color {Spring Green} /tb_usb_receiver/tb_rcving
add wave -noupdate -group tb_outputs -color {Spring Green} /tb_usb_receiver/tb_r_error
add wave -noupdate -group tb_test_data -color Pink /tb_usb_receiver/tb_test_d_plus
add wave -noupdate -group tb_test_data -color Pink /tb_usb_receiver/tb_test_d_minus
add wave -noupdate -group tb_test_data -color Pink /tb_usb_receiver/tb_test_bit_period
add wave -noupdate -group tb_expected_data -color Goldenrod /tb_usb_receiver/tb_expected_r_data
add wave -noupdate -group tb_expected_data -color Goldenrod /tb_usb_receiver/tb_expected_empty
add wave -noupdate -group tb_expected_data -color Goldenrod /tb_usb_receiver/tb_expected_r_error
add wave -noupdate -group tb_expected_data -color Goldenrod /tb_usb_receiver/tb_expected_rcving
add wave -noupdate -group {eop signals} -color Cyan /tb_usb_receiver/DUT/ep/d_plus
add wave -noupdate -group {eop signals} -color Cyan /tb_usb_receiver/DUT/ep/d_minus
add wave -noupdate -group {eop signals} -color Cyan /tb_usb_receiver/DUT/ep/eop
add wave -noupdate -group {Decoded signals} -color Magenta /tb_usb_receiver/DUT/unc/d_plus
add wave -noupdate -group {Decoded signals} -color Magenta /tb_usb_receiver/DUT/unc/shift_enable
add wave -noupdate -group {Decoded signals} -color Magenta /tb_usb_receiver/DUT/unc/eop
add wave -noupdate -group {Decoded signals} -color Magenta /tb_usb_receiver/DUT/unc/d_orig
add wave -noupdate -group {Timer signals} -color Gold /tb_usb_receiver/DUT/tim/d_edge
add wave -noupdate -group {Timer signals} -color Gold /tb_usb_receiver/DUT/tim/rcving
add wave -noupdate -group {Timer signals} -color Gold /tb_usb_receiver/DUT/tim/shift_enable
add wave -noupdate -group {Timer signals} -color Gold /tb_usb_receiver/DUT/tim/new_shift_enable
add wave -noupdate -group {Timer signals} -color Gold /tb_usb_receiver/DUT/tim/byte_received
add wave -noupdate -group {Timer signals} -color Gold /tb_usb_receiver/DUT/tim/count
add wave -noupdate -group {Timer signals} -color Gold /tb_usb_receiver/DUT/tim/count_out1
add wave -noupdate -group {RCU Signals} -color {Medium Violet Red} /tb_usb_receiver/DUT/rc/d_edge
add wave -noupdate -group {RCU Signals} -color {Medium Violet Red} /tb_usb_receiver/DUT/rc/eop
add wave -noupdate -group {RCU Signals} -color {Medium Violet Red} /tb_usb_receiver/DUT/rc/shift_enable
add wave -noupdate -group {RCU Signals} -color {Medium Violet Red} /tb_usb_receiver/DUT/rc/rcv_data
add wave -noupdate -group {RCU Signals} -color {Medium Violet Red} /tb_usb_receiver/DUT/rc/PID
add wave -noupdate -group {RCU Signals} -color {Medium Violet Red} /tb_usb_receiver/DUT/rc/byte_received
add wave -noupdate -group {RCU Signals} -color {Medium Violet Red} /tb_usb_receiver/DUT/rc/rcving
add wave -noupdate -group {RCU Signals} -color {Medium Violet Red} /tb_usb_receiver/DUT/rc/w_enable
add wave -noupdate -group {RCU Signals} -color {Medium Violet Red} /tb_usb_receiver/DUT/rc/r_error
add wave -noupdate -group {RCU Signals} -color {Medium Violet Red} /tb_usb_receiver/DUT/rc/bit_count
add wave -noupdate -group {RCU Signals} -color {Medium Violet Red} /tb_usb_receiver/DUT/rc/state
add wave -noupdate -group {RCU Signals} -color {Medium Violet Red} /tb_usb_receiver/DUT/rc/next_state
add wave -noupdate -expand -group {Bit Stuff SIgnals} -color {Dark Orchid} /tb_usb_receiver/DUT/sbd/d_orig
add wave -noupdate -expand -group {Bit Stuff SIgnals} -color {Dark Orchid} /tb_usb_receiver/DUT/sbd/shift_enable
add wave -noupdate -expand -group {Bit Stuff SIgnals} -color {Dark Orchid} /tb_usb_receiver/DUT/sbd/bit_stuff
add wave -noupdate -expand -group {Bit Stuff SIgnals} -color {Dark Orchid} /tb_usb_receiver/DUT/sbd/state
add wave -noupdate -expand -group {Bit Stuff SIgnals} -color {Dark Orchid} /tb_usb_receiver/DUT/sbd/next_state
add wave -noupdate -expand -group {Shift register} -color Yellow /tb_usb_receiver/DUT/sr/d_orig
add wave -noupdate -expand -group {Shift register} -color Yellow /tb_usb_receiver/DUT/sr/shift_enable
add wave -noupdate -expand -group {Shift register} -color Yellow /tb_usb_receiver/DUT/sr/rcv_data
add wave -noupdate -expand -group {Shift register} -color Yellow /tb_usb_receiver/DUT/sr/bit_stuff
add wave -noupdate -expand -group {Shift register} -color Yellow /tb_usb_receiver/DUT/sr/new_shift_enable
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {17670831 ps} 0}
quietly wave cursor active 1
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
WaveRestoreZoom {15404058 ps} {29289742 ps}

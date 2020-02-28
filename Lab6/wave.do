onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_rcv_block/tb_clk
add wave -noupdate /tb_rcv_block/tb_n_rst
add wave -noupdate /tb_rcv_block/tb_serial_in
add wave -noupdate -color {Medium Violet Red} /tb_rcv_block/DUT/new_packet_detected
add wave -noupdate -group TIMER -color Coral /tb_rcv_block/DUT/shift_enable
add wave -noupdate -group TIMER -color Coral /tb_rcv_block/DUT/packet_done
add wave -noupdate -group TB_data -color Magenta /tb_rcv_block/tb_rx_data
add wave -noupdate -group TB_data -color Magenta /tb_rcv_block/tb_data_read
add wave -noupdate -group TB_data -color Magenta /tb_rcv_block/tb_data_ready
add wave -noupdate -group TB_error -color Blue /tb_rcv_block/tb_overrun_error
add wave -noupdate -group TB_error -color Blue /tb_rcv_block/tb_framing_error
add wave -noupdate -group TB_Expected -color Yellow /tb_rcv_block/tb_expected_rx_data
add wave -noupdate -group TB_Expected -color Yellow /tb_rcv_block/tb_expected_framing_error
add wave -noupdate -group TB_Expected -color Yellow /tb_rcv_block/tb_expected_data_ready
add wave -noupdate -group TB_Expected -color Yellow /tb_rcv_block/tb_expected_overrun
add wave -noupdate -group TB_Test -color Cyan /tb_rcv_block/tb_test_num
add wave -noupdate -group TB_Test -color Cyan /tb_rcv_block/tb_test_data
add wave -noupdate -group TB_Test -color Cyan /tb_rcv_block/tb_test_stop_bit
add wave -noupdate -group TB_Test -color Cyan /tb_rcv_block/tb_test_bit_period
add wave -noupdate -group TB_Test -color Cyan /tb_rcv_block/tb_test_data_read
add wave -noupdate -group RCV_Output -color Magenta /tb_rcv_block/DUT/rx_data
add wave -noupdate -group RCV_Output -color Magenta /tb_rcv_block/DUT/data_ready
add wave -noupdate -group RCV_Output -color Magenta /tb_rcv_block/DUT/overrun_error
add wave -noupdate -group RCV_Output -color Magenta /tb_rcv_block/DUT/framing_error
add wave -noupdate -group RCU -color {Medium Violet Red} /tb_rcv_block/DUT/enable_timer
add wave -noupdate -group RCU -color {Medium Violet Red} /tb_rcv_block/DUT/load_buffer
add wave -noupdate -group RCU -color {Medium Violet Red} /tb_rcv_block/DUT/sbc_clear
add wave -noupdate -group RCU -color {Medium Violet Red} /tb_rcv_block/DUT/sbc_enable
add wave -noupdate /tb_rcv_block/DUT/packet_data
add wave -noupdate -expand -group RCU_State /tb_rcv_block/DUT/rec/state
add wave -noupdate -expand -group RCU_State /tb_rcv_block/DUT/rec/next_state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {9888 ps} 0}
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
WaveRestoreZoom {2342536 ps} {2462418 ps}

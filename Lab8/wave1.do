onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_apb_uart_rx/tb_clk
add wave -noupdate /tb_apb_uart_rx/tb_n_rst
add wave -noupdate /tb_apb_uart_rx/tb_test_case_num
add wave -noupdate -group TB_DATA -color Magenta /tb_apb_uart_rx/tb_serial_in
add wave -noupdate -group TB_DATA -color Magenta /tb_apb_uart_rx/tb_stop_bit
add wave -noupdate -group TB_DATA -color Magenta /tb_apb_uart_rx/tb_test_data
add wave -noupdate -group TB_DATA -color Magenta /tb_apb_uart_rx/tb_rx_data
add wave -noupdate -group TB_DATA -color Magenta /tb_apb_uart_rx/tb_test_data_size
add wave -noupdate -group TB_DATA -color Magenta /tb_apb_uart_rx/tb_data_size
add wave -noupdate -group TB_DATA -color Magenta /tb_apb_uart_rx/tb_test_bit_period
add wave -noupdate -group TB_DATA -color Magenta /tb_apb_uart_rx/tb_bit_period
add wave -noupdate -group TB_DATA -color Magenta /tb_apb_uart_rx/tb_data_read
add wave -noupdate -group TB_DATA -color Magenta /tb_apb_uart_rx/tb_data_ready
add wave -noupdate -group TB_DATA -color Magenta /tb_apb_uart_rx/tb_overrun_error
add wave -noupdate -group TB_DATA -color Magenta /tb_apb_uart_rx/tb_framing_error
add wave -noupdate -group TB_ADDRESS -color Sienna /tb_apb_uart_rx/tb_psel
add wave -noupdate -group TB_ADDRESS -color Sienna /tb_apb_uart_rx/tb_paddr
add wave -noupdate -group TB_ADDRESS -color Sienna /tb_apb_uart_rx/tb_penable
add wave -noupdate -group TB_ADDRESS -color Sienna /tb_apb_uart_rx/tb_pwrite
add wave -noupdate -group TB_ADDRESS -color Sienna /tb_apb_uart_rx/tb_pwdata
add wave -noupdate -group TB_ADDRESS -color Sienna /tb_apb_uart_rx/tb_prdata
add wave -noupdate -group TB_ADDRESS -color Sienna /tb_apb_uart_rx/tb_pslverr
add wave -noupdate -group DUT_ADDRESS_MAPPING -color {Dark Orchid} /tb_apb_uart_rx/DUT/psel
add wave -noupdate -group DUT_ADDRESS_MAPPING -color {Dark Orchid} /tb_apb_uart_rx/DUT/penable
add wave -noupdate -group DUT_ADDRESS_MAPPING -color {Dark Orchid} /tb_apb_uart_rx/DUT/pwrite
add wave -noupdate -group DUT_ADDRESS_MAPPING -color {Dark Orchid} /tb_apb_uart_rx/DUT/paddr
add wave -noupdate -group DUT_ADDRESS_MAPPING -color {Dark Orchid} /tb_apb_uart_rx/DUT/pwdata
add wave -noupdate -group DUT_ADDRESS_MAPPING -color {Dark Orchid} /tb_apb_uart_rx/DUT/prdata
add wave -noupdate -group DUT_ADDRESS_MAPPING -color {Dark Orchid} /tb_apb_uart_rx/DUT/pslverr
add wave -noupdate -group DUT_DATA -color {Medium Violet Red} /tb_apb_uart_rx/DUT/serial_in
add wave -noupdate -group DUT_DATA -color {Medium Violet Red} /tb_apb_uart_rx/DUT/data_size
add wave -noupdate -group DUT_DATA -color {Medium Violet Red} /tb_apb_uart_rx/DUT/bit_period
add wave -noupdate -group DUT_DATA -color {Medium Violet Red} /tb_apb_uart_rx/DUT/data_read
add wave -noupdate -group DUT_DATA -color {Medium Violet Red} /tb_apb_uart_rx/DUT/rx_data
add wave -noupdate -group DUT_DATA -color {Medium Violet Red} /tb_apb_uart_rx/DUT/data_ready
add wave -noupdate -group DUT_DATA -color {Medium Violet Red} /tb_apb_uart_rx/DUT/overrun_error
add wave -noupdate -group DUT_DATA -color {Medium Violet Red} /tb_apb_uart_rx/DUT/framing_error
add wave -noupdate -group UART_DATA -color Gold /tb_apb_uart_rx/DUT/uart/enable_timer
add wave -noupdate -group UART_DATA -color Gold /tb_apb_uart_rx/DUT/uart/shift_enable
add wave -noupdate -group UART_DATA -color Gold /tb_apb_uart_rx/DUT/uart/load_buffer
add wave -noupdate -group UART_DATA -color Gold /tb_apb_uart_rx/DUT/uart/sbc_clear
add wave -noupdate -group UART_DATA -color Gold /tb_apb_uart_rx/DUT/uart/sbc_enable
add wave -noupdate -group UART_DATA -color Gold /tb_apb_uart_rx/DUT/uart/packet_done
add wave -noupdate -group UART_DATA -color Gold /tb_apb_uart_rx/DUT/uart/new_packet_detected
add wave -noupdate -group UART_DATA -color Gold /tb_apb_uart_rx/DUT/uart/packet_data
add wave -noupdate -group UART_DATA -color Gold /tb_apb_uart_rx/DUT/uart/new_package
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {280086 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 190
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
WaveRestoreZoom {0 ps} {2047079 ps}

onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_apb_slave/tb_clk
add wave -noupdate /tb_apb_slave/tb_n_rst
add wave -noupdate -group TB_TESTS -color Blue /tb_apb_slave/tb_test_case_num
add wave -noupdate -group TB_TESTS -color Blue /tb_apb_slave/tb_test_data
add wave -noupdate -group TB_TESTS -color Blue /tb_apb_slave/tb_test_bit_period
add wave -noupdate -group TB_APB_SIGNALS -color Gold /tb_apb_slave/tb_psel
add wave -noupdate -group TB_APB_SIGNALS -color Gold /tb_apb_slave/tb_paddr
add wave -noupdate -group TB_APB_SIGNALS -color Gold /tb_apb_slave/tb_penable
add wave -noupdate -group TB_APB_SIGNALS -color Gold /tb_apb_slave/tb_pwrite
add wave -noupdate -group TB_APB_SIGNALS -color Gold /tb_apb_slave/tb_pwdata
add wave -noupdate -group TB_APB_SIGNALS -color Gold /tb_apb_slave/tb_prdata
add wave -noupdate -group TB_ERROR -color Coral /tb_apb_slave/tb_pslverr
add wave -noupdate -group TB_ERROR -color Coral /tb_apb_slave/tb_overrun_error
add wave -noupdate -group TB_ERROR -color Coral /tb_apb_slave/tb_framing_error
add wave -noupdate -group TB_DATA -color Turquoise /tb_apb_slave/tb_rx_data
add wave -noupdate -group TB_DATA -color Turquoise /tb_apb_slave/tb_data_ready
add wave -noupdate -group TB_DATA -color Turquoise /tb_apb_slave/tb_data_read
add wave -noupdate -group TB_DATA -color Turquoise /tb_apb_slave/tb_expected_data_read
add wave -noupdate -group TB_CONFIG_REGS -color Magenta /tb_apb_slave/tb_data_size
add wave -noupdate -group TB_CONFIG_REGS -color Magenta /tb_apb_slave/tb_bit_period
add wave -noupdate -group TB_CONFIG_REGS -color Magenta /tb_apb_slave/tb_expected_data_size
add wave -noupdate -group TB_CONFIG_REGS -color Magenta /tb_apb_slave/tb_expected_bit_period
add wave -noupdate -group APB_SLAVE_INPUTS -color Cyan /tb_apb_slave/DUT/rx_data
add wave -noupdate -group APB_SLAVE_INPUTS -color Cyan /tb_apb_slave/DUT/data_ready
add wave -noupdate -group APB_SLAVE_INPUTS -color Cyan /tb_apb_slave/DUT/overrun_error
add wave -noupdate -group APB_SLAVE_INPUTS -color Cyan /tb_apb_slave/DUT/framing_error
add wave -noupdate -group APB_SLAVE_INPUTS -color Cyan /tb_apb_slave/DUT/psel
add wave -noupdate -group APB_SLAVE_INPUTS -color Cyan /tb_apb_slave/DUT/paddr
add wave -noupdate -group APB_SLAVE_INPUTS -color Cyan /tb_apb_slave/DUT/penable
add wave -noupdate -group APB_SLAVE_INPUTS -color Cyan /tb_apb_slave/DUT/pwrite
add wave -noupdate -group APB_SLAVE_INPUTS -color Cyan /tb_apb_slave/DUT/pwdata
add wave -noupdate -group APB_SLAVE_OUTPUTS -color Orange /tb_apb_slave/DUT/prdata
add wave -noupdate -group APB_SLAVE_OUTPUTS -color Orange /tb_apb_slave/DUT/pslverr
add wave -noupdate -group APB_SLAVE_OUTPUTS -color Orange /tb_apb_slave/DUT/data_read
add wave -noupdate -group APB_SLAVE_OUTPUTS -color Orange /tb_apb_slave/DUT/data_size
add wave -noupdate -group APB_SLAVE_OUTPUTS -color Orange /tb_apb_slave/DUT/bit_period
add wave -noupdate -expand -group APB_SLAVE_REGS -color {Blue Violet} /tb_apb_slave/DUT/write_select
add wave -noupdate -expand -group APB_SLAVE_REGS -color {Blue Violet} /tb_apb_slave/DUT/read_select
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2972514 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 251
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
WaveRestoreZoom {22263 ps} {54282 ps}

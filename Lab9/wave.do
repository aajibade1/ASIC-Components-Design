onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_ahb_lite_slave/tb_clk
add wave -noupdate /tb_ahb_lite_slave/tb_n_rst
add wave -noupdate /tb_ahb_lite_slave/tb_test_case_num
add wave -noupdate -group TB_ADDRESS -color Gold /tb_ahb_lite_slave/tb_hsel
add wave -noupdate -group TB_ADDRESS -color Gold /tb_ahb_lite_slave/tb_htrans
add wave -noupdate -group TB_ADDRESS -color Gold /tb_ahb_lite_slave/tb_hwrite
add wave -noupdate -group TB_ADDRESS -color Gold /tb_ahb_lite_slave/tb_haddr
add wave -noupdate -group TB_ADDRESS -color Gold /tb_ahb_lite_slave/tb_hsize
add wave -noupdate -group TB_DATA -color {Orange Red} /tb_ahb_lite_slave/tb_test_data
add wave -noupdate -group TB_DATA -color {Orange Red} /tb_ahb_lite_slave/tb_hwdata
add wave -noupdate -group TB_DATA -color {Orange Red} /tb_ahb_lite_slave/tb_hrdata
add wave -noupdate -group TB_DATA -color {Orange Red} /tb_ahb_lite_slave/tb_hresp
add wave -noupdate -group TB_DATA -color {Orange Red} /tb_ahb_lite_slave/tb_fir_out
add wave -noupdate -group TB_DATA -color {Orange Red} /tb_ahb_lite_slave/tb_coeff_num
add wave -noupdate -group TB_DATA -color {Orange Red} /tb_ahb_lite_slave/tb_sample_data
add wave -noupdate -group TB_DATA -color {Orange Red} /tb_ahb_lite_slave/tb_fir_coefficient
add wave -noupdate -group DUT_COEFF -color {Violet Red} /tb_ahb_lite_slave/DUT/f_zero
add wave -noupdate -group DUT_COEFF -color {Violet Red} /tb_ahb_lite_slave/DUT/next_f_zero
add wave -noupdate -group DUT_COEFF -color {Violet Red} /tb_ahb_lite_slave/DUT/f_one
add wave -noupdate -group DUT_COEFF -color {Violet Red} /tb_ahb_lite_slave/DUT/next_f_one
add wave -noupdate -group DUT_COEFF -color {Violet Red} /tb_ahb_lite_slave/DUT/f_two
add wave -noupdate -group DUT_COEFF -color {Violet Red} /tb_ahb_lite_slave/DUT/next_f_two
add wave -noupdate -group DUT_COEFF -color {Violet Red} /tb_ahb_lite_slave/DUT/f_three
add wave -noupdate -group DUT_COEFF -color {Violet Red} /tb_ahb_lite_slave/DUT/next_f_three
add wave -noupdate -group DUT_ADD_OUT -color {Green Yellow} /tb_ahb_lite_slave/DUT/data_ready
add wave -noupdate -group DUT_ADD_OUT -color {Green Yellow} /tb_ahb_lite_slave/DUT/hresp
add wave -noupdate -group DUT_ADD_OUT -color {Green Yellow} /tb_ahb_lite_slave/DUT/read_select
add wave -noupdate -group DUT_ADD_OUT -color {Green Yellow} /tb_ahb_lite_slave/DUT/write_select
add wave -noupdate -group DUT_ADD_OUT -color {Green Yellow} /tb_ahb_lite_slave/DUT/next_write_select
add wave -noupdate -group TB_EXPECTED -color Blue /tb_ahb_lite_slave/tb_expected_data_ready
add wave -noupdate -group TB_EXPECTED -color Blue /tb_ahb_lite_slave/tb_expected_sample
add wave -noupdate -group TB_EXPECTED -color Blue /tb_ahb_lite_slave/tb_expected_new_coeff_set
add wave -noupdate -group TB_EXPECTED -color Blue /tb_ahb_lite_slave/tb_expected_coeff
add wave -noupdate -group TB_STATUS -color Yellow /tb_ahb_lite_slave/tb_modwait
add wave -noupdate -group TB_STATUS -color Yellow /tb_ahb_lite_slave/tb_err
add wave -noupdate -group TB_STATUS -color Yellow /tb_ahb_lite_slave/tb_data_ready
add wave -noupdate -group TB_STATUS -color Yellow /tb_ahb_lite_slave/tb_new_coeff_set
add wave -noupdate -group DUT_DATA -color Magenta -itemcolor White /tb_ahb_lite_slave/DUT/coefficient_num
add wave -noupdate -group DUT_DATA -color Magenta -itemcolor White /tb_ahb_lite_slave/DUT/modwait
add wave -noupdate -group DUT_DATA -color Magenta -itemcolor White /tb_ahb_lite_slave/DUT/fir_out
add wave -noupdate -group DUT_DATA -color Magenta -itemcolor White /tb_ahb_lite_slave/DUT/err
add wave -noupdate -group DUT_DATA -color Magenta -itemcolor White /tb_ahb_lite_slave/DUT/sample_data
add wave -noupdate -group DUT_DATA -color Magenta -itemcolor White /tb_ahb_lite_slave/DUT/new_coefficient_set
add wave -noupdate -group DUT_DATA -color Magenta -itemcolor White /tb_ahb_lite_slave/DUT/fir_coefficient
add wave -noupdate -group DUT_DATA -color Magenta -itemcolor White /tb_ahb_lite_slave/DUT/hrdata
add wave -noupdate -group DUT_DATA -color Magenta -itemcolor White /tb_ahb_lite_slave/DUT/next_hrdata
add wave -noupdate -group DUT_DATA -color Magenta /tb_ahb_lite_slave/DUT/hwdata
add wave -noupdate -group DUT_DATA -color Magenta -itemcolor White /tb_ahb_lite_slave/DUT/sample_data_temp
add wave -noupdate -group DUT_DATA -color Magenta -itemcolor White /tb_ahb_lite_slave/DUT/next_sample_data_temp
add wave -noupdate -group DUT_DATA -color Magenta -itemcolor White /tb_ahb_lite_slave/DUT/new_coff_set_temp
add wave -noupdate -group DUT_DATA -color Magenta -itemcolor White /tb_ahb_lite_slave/DUT/next_new_coff_set_temp
add wave -noupdate -group DUT_DATA -color Magenta -itemcolor White /tb_ahb_lite_slave/DUT/busy
add wave -noupdate -group DUT_DATA -color Magenta -itemcolor White /tb_ahb_lite_slave/DUT/next_busy
add wave -noupdate -group DUT_DATA -color Magenta -itemcolor White /tb_ahb_lite_slave/DUT/next_data_ready
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {131901 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 183
configure wave -valuecolwidth 117
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
WaveRestoreZoom {0 ps} {613203 ps}

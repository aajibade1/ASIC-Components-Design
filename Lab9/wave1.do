onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_ahb_lite_fir_filter/tb_clk
add wave -noupdate /tb_ahb_lite_fir_filter/tb_n_rst
add wave -noupdate /tb_ahb_lite_fir_filter/tb_test_case_num
add wave -noupdate -group TB_ADDRESS -color Yellow /tb_ahb_lite_fir_filter/tb_hsel
add wave -noupdate -group TB_ADDRESS -color Yellow /tb_ahb_lite_fir_filter/tb_htrans
add wave -noupdate -group TB_ADDRESS -color Yellow /tb_ahb_lite_fir_filter/tb_haddr
add wave -noupdate -group TB_ADDRESS -color Yellow /tb_ahb_lite_fir_filter/tb_hsize
add wave -noupdate -group TB_ADDRESS -color Yellow /tb_ahb_lite_fir_filter/tb_hwrite
add wave -noupdate -group TB_ADDRESS -color Yellow /tb_ahb_lite_fir_filter/tb_hwdata
add wave -noupdate -group TB_DATA -color Orange /tb_ahb_lite_fir_filter/tb_test_data
add wave -noupdate -group TB_DATA -color Orange /tb_ahb_lite_fir_filter/tb_hrdata
add wave -noupdate -group TB_DATA -color Orange /tb_ahb_lite_fir_filter/tb_expected_hrdata
add wave -noupdate -group TB_DATA -color Orange /tb_ahb_lite_fir_filter/tb_expected_hresp
add wave -noupdate -group TB_DATA -color Orange /tb_ahb_lite_fir_filter/tb_hresp
add wave -noupdate -group SLAVE_WRITE_REGS -color Blue /tb_ahb_lite_fir_filter/DUT/als/sample_data
add wave -noupdate -group SLAVE_WRITE_REGS -color Blue /tb_ahb_lite_fir_filter/DUT/als/new_coefficient_set
add wave -noupdate -group SLAVE_WRITE_REGS -color Blue /tb_ahb_lite_fir_filter/DUT/als/fir_coefficient
add wave -noupdate -group SLAVE_WRITE_REGS -color Blue /tb_ahb_lite_fir_filter/DUT/als/f_zero
add wave -noupdate -group SLAVE_WRITE_REGS -color Blue /tb_ahb_lite_fir_filter/DUT/als/next_f_zero
add wave -noupdate -group SLAVE_WRITE_REGS -color Blue /tb_ahb_lite_fir_filter/DUT/als/f_one
add wave -noupdate -group SLAVE_WRITE_REGS -color Blue /tb_ahb_lite_fir_filter/DUT/als/next_f_one
add wave -noupdate -group SLAVE_WRITE_REGS -color Blue /tb_ahb_lite_fir_filter/DUT/als/f_two
add wave -noupdate -group SLAVE_WRITE_REGS -color Blue /tb_ahb_lite_fir_filter/DUT/als/next_f_two
add wave -noupdate -group SLAVE_WRITE_REGS -color Blue /tb_ahb_lite_fir_filter/DUT/als/f_three
add wave -noupdate -group SLAVE_WRITE_REGS -color Blue /tb_ahb_lite_fir_filter/DUT/als/next_f_three
add wave -noupdate -group SLAVE_WRITE_REGS -color Blue /tb_ahb_lite_fir_filter/DUT/als/sample_data_temp
add wave -noupdate -group SLAVE_WRITE_REGS -color Blue /tb_ahb_lite_fir_filter/DUT/als/next_sample_data_temp
add wave -noupdate -group SLAVE_WRITE_REGS -color Blue /tb_ahb_lite_fir_filter/DUT/als/new_coff_set_temp
add wave -noupdate -group SLAVE_WRITE_REGS -color Blue /tb_ahb_lite_fir_filter/DUT/als/next_new_coff_set_temp
add wave -noupdate -group SLAVE_INPUT -color {Dark Orchid} /tb_ahb_lite_fir_filter/DUT/als/coefficient_num
add wave -noupdate -group SLAVE_INPUT -color {Dark Orchid} /tb_ahb_lite_fir_filter/DUT/als/modwait
add wave -noupdate -group SLAVE_INPUT -color {Dark Orchid} /tb_ahb_lite_fir_filter/DUT/als/fir_out
add wave -noupdate -group SLAVE_INPUT -color {Dark Orchid} /tb_ahb_lite_fir_filter/DUT/als/err
add wave -noupdate -group SLAVE_INPUT -color {Dark Orchid} /tb_ahb_lite_fir_filter/DUT/als/cl_done
add wave -noupdate -group SLAVE_INPUT -color {Dark Orchid} /tb_ahb_lite_fir_filter/DUT/als/cl_busy
add wave -noupdate -group SLAVE_INPUT -color {Dark Orchid} /tb_ahb_lite_fir_filter/DUT/als/ff_done
add wave -noupdate -group SLAVE_INPUT -color {Dark Orchid} /tb_ahb_lite_fir_filter/DUT/als/busy
add wave -noupdate -group SLAVE_ADDR -color Cyan /tb_ahb_lite_fir_filter/DUT/als/hsel
add wave -noupdate -group SLAVE_ADDR -color Cyan /tb_ahb_lite_fir_filter/DUT/als/haddr
add wave -noupdate -group SLAVE_ADDR -color Cyan /tb_ahb_lite_fir_filter/DUT/als/hsize
add wave -noupdate -group SLAVE_ADDR -color Cyan /tb_ahb_lite_fir_filter/DUT/als/htrans
add wave -noupdate -group SLAVE_ADDR -color Cyan /tb_ahb_lite_fir_filter/DUT/als/hwrite
add wave -noupdate -group SLAVE_ADDR -color Cyan /tb_ahb_lite_fir_filter/DUT/als/hwdata
add wave -noupdate -group SLAVE_DATA -color Magenta /tb_ahb_lite_fir_filter/DUT/als/data_ready
add wave -noupdate -group SLAVE_DATA -color Magenta -radix decimal /tb_ahb_lite_fir_filter/DUT/als/hrdata
add wave -noupdate -group SLAVE_DATA -color Magenta /tb_ahb_lite_fir_filter/DUT/als/hresp
add wave -noupdate -group SLAVE_DATA -color Magenta /tb_ahb_lite_fir_filter/DUT/als/next_data_ready
add wave -noupdate -group SLAVE_ADD_OUT -color Brown /tb_ahb_lite_fir_filter/DUT/als/read_select
add wave -noupdate -group SLAVE_ADD_OUT /tb_ahb_lite_fir_filter/DUT/als/next_read_select
add wave -noupdate -group SLAVE_ADD_OUT -color Brown /tb_ahb_lite_fir_filter/DUT/als/write_select
add wave -noupdate -group SLAVE_ADD_OUT -color Brown /tb_ahb_lite_fir_filter/DUT/als/next_write_select
add wave -noupdate -group FIR_DATA -color Salmon /tb_ahb_lite_fir_filter/DUT/ff/data_ready
add wave -noupdate -group FIR_DATA -color Salmon /tb_ahb_lite_fir_filter/DUT/ff/modwait
add wave -noupdate -group FIR_DATA -color Salmon /tb_ahb_lite_fir_filter/DUT/ff/err
add wave -noupdate -group FIR_DATA /tb_ahb_lite_fir_filter/DUT/ff/control/next_state
add wave -noupdate -group FIR_DATA /tb_ahb_lite_fir_filter/DUT/ff/control/state
add wave -noupdate -group FIR_DATA -color Salmon /tb_ahb_lite_fir_filter/DUT/ff/ff_done
add wave -noupdate -group FIR_DATA -color Salmon /tb_ahb_lite_fir_filter/DUT/ff/one_k_samples
add wave -noupdate -group FIR_DATA -color Salmon -radix decimal /tb_ahb_lite_fir_filter/DUT/ff/fir_out
add wave -noupdate -group FIR_DATA -color Salmon -radix decimal /tb_ahb_lite_fir_filter/DUT/ff/outreg_data
add wave -noupdate -group COEFF_LOADER -color {Steel Blue} /tb_ahb_lite_fir_filter/DUT/cl/new_coefficient_set
add wave -noupdate -group COEFF_LOADER -color {Steel Blue} /tb_ahb_lite_fir_filter/DUT/cl/load_coeff
add wave -noupdate -group COEFF_LOADER -color {Steel Blue} /tb_ahb_lite_fir_filter/DUT/cl/modwait
add wave -noupdate -group COEFF_LOADER -color {Steel Blue} /tb_ahb_lite_fir_filter/DUT/cl/coefficient_num
add wave -noupdate -group COEFF_LOADER -color {Steel Blue} /tb_ahb_lite_fir_filter/DUT/cl/next_state
add wave -noupdate -group COEFF_LOADER -color {Steel Blue} /tb_ahb_lite_fir_filter/DUT/cl/state
add wave -noupdate -group COEFF_LOADER -color {Steel Blue} /tb_ahb_lite_fir_filter/DUT/cl/next_coff_num
add wave -noupdate -group COEFF_LOADER -color {Steel Blue} /tb_ahb_lite_fir_filter/DUT/cl/next_load_coeff
add wave -noupdate -group COEFF_LOADER -color {Steel Blue} /tb_ahb_lite_fir_filter/DUT/cl/cl_done
add wave -noupdate -group COEFF_LOADER -color {Steel Blue} /tb_ahb_lite_fir_filter/DUT/cl/next_cl_busy
add wave -noupdate -group COEFF_LOADER -color {Steel Blue} /tb_ahb_lite_fir_filter/DUT/cl/cl_busy
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1729746 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 193
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
WaveRestoreZoom {1328705 ps} {2131295 ps}

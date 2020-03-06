onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group TB_Variables -color Gold -radix decimal /tb_fir_filter/tb_clk
add wave -noupdate -expand -group TB_Variables -color Gold -radix decimal /tb_fir_filter/tb_n_reset
add wave -noupdate -expand -group TB_Variables -color Gold -radix decimal /tb_fir_filter/tb_data_ready
add wave -noupdate -expand -group TB_Variables -color Gold -radix decimal /tb_fir_filter/tb_load_coeff
add wave -noupdate -expand -group TB_Variables -color Gold -radix decimal /tb_fir_filter/tb_sample
add wave -noupdate -expand -group TB_Variables -color Gold -radix decimal /tb_fir_filter/tb_coeff
add wave -noupdate -expand -group TB_Variables -color Gold -radix decimal /tb_fir_filter/tb_one_k_samples
add wave -noupdate -expand -group TB_Variables -color Gold -radix decimal /tb_fir_filter/tb_modwait
add wave -noupdate -expand -group TB_Variables -color Gold -radix decimal /tb_fir_filter/tb_err
add wave -noupdate -expand -group TB_Variables -color Gold -radix decimal /tb_fir_filter/tb_fir_out
add wave -noupdate -expand -group TB_Variables -color Gold -radix decimal /tb_fir_filter/tb_test_case_num
add wave -noupdate -expand -group TB_Variables -color Gold -radix decimal /tb_fir_filter/tb_test_sample_num
add wave -noupdate -expand -group TB_Variables -color Gold -radix decimal /tb_fir_filter/tb_std_test_case
add wave -noupdate -expand -group TB_Variables -color Gold -radix decimal /tb_fir_filter/tb_expected_fir_out
add wave -noupdate -expand -group TB_Variables -color Gold -radix decimal /tb_fir_filter/tb_expected_err
add wave -noupdate -expand -group TB_Variables -color Gold -radix decimal /tb_fir_filter/tb_expected_one_k_samples
add wave -noupdate -expand -group Datapath -color {Dark Orchid} -radix decimal /tb_fir_filter/DUT/dat/outreg_data
add wave -noupdate -expand -group Datapath -color {Dark Orchid} -radix decimal /tb_fir_filter/DUT/dat/overflow
add wave -noupdate -expand -group Datapath -color {Dark Orchid} -radix decimal /tb_fir_filter/DUT/dat/alu_op
add wave -noupdate -expand -group Datapath -color {Dark Orchid} -radix decimal /tb_fir_filter/DUT/dat/w_data_sel
add wave -noupdate -expand -group Datapath -color {Dark Orchid} -radix decimal /tb_fir_filter/DUT/dat/alu_result
add wave -noupdate -expand -group Datapath -color {Dark Orchid} -radix decimal /tb_fir_filter/DUT/dat/src1_data
add wave -noupdate -expand -group Datapath -color {Dark Orchid} -radix decimal /tb_fir_filter/DUT/dat/src2_data
add wave -noupdate -expand -group Datapath -color {Dark Orchid} -radix decimal /tb_fir_filter/DUT/dat/dest_data
add wave -noupdate -expand -group States -color Cyan -radix decimal /tb_fir_filter/DUT/control/state
add wave -noupdate -expand -group States -color Cyan -radix decimal /tb_fir_filter/DUT/control/next_state
add wave -noupdate -expand -group Counter -color {Medium Orchid} -radix decimal /tb_fir_filter/DUT/count/count_out
add wave -noupdate -expand -group Counter -color {Medium Orchid} -radix decimal /tb_fir_filter/DUT/count/one_k_samples
add wave -noupdate -expand -group Magnitude -color Goldenrod -radix decimal /tb_fir_filter/DUT/fir_out
add wave -noupdate -expand -group DUT -color {Cornflower Blue} -radix decimal -subitemconfig {{/tb_fir_filter/DUT/sample_data[15]} {-color {Cornflower Blue}} {/tb_fir_filter/DUT/sample_data[14]} {-color {Cornflower Blue}} {/tb_fir_filter/DUT/sample_data[13]} {-color {Cornflower Blue}} {/tb_fir_filter/DUT/sample_data[12]} {-color {Cornflower Blue}} {/tb_fir_filter/DUT/sample_data[11]} {-color {Cornflower Blue}} {/tb_fir_filter/DUT/sample_data[10]} {-color {Cornflower Blue}} {/tb_fir_filter/DUT/sample_data[9]} {-color {Cornflower Blue}} {/tb_fir_filter/DUT/sample_data[8]} {-color {Cornflower Blue}} {/tb_fir_filter/DUT/sample_data[7]} {-color {Cornflower Blue}} {/tb_fir_filter/DUT/sample_data[6]} {-color {Cornflower Blue}} {/tb_fir_filter/DUT/sample_data[5]} {-color {Cornflower Blue}} {/tb_fir_filter/DUT/sample_data[4]} {-color {Cornflower Blue}} {/tb_fir_filter/DUT/sample_data[3]} {-color {Cornflower Blue}} {/tb_fir_filter/DUT/sample_data[2]} {-color {Cornflower Blue}} {/tb_fir_filter/DUT/sample_data[1]} {-color {Cornflower Blue}} {/tb_fir_filter/DUT/sample_data[0]} {-color {Cornflower Blue}}} /tb_fir_filter/DUT/sample_data
add wave -noupdate -expand -group DUT -color {Cornflower Blue} -radix decimal /tb_fir_filter/DUT/fir_coefficient
add wave -noupdate -expand -group DUT -color {Cornflower Blue} -radix decimal /tb_fir_filter/DUT/load_coeff
add wave -noupdate -expand -group DUT -color {Cornflower Blue} -radix decimal /tb_fir_filter/DUT/data_ready
add wave -noupdate -expand -group DUT -color {Cornflower Blue} -radix decimal /tb_fir_filter/DUT/modwait
add wave -noupdate -expand -group DUT -color {Cornflower Blue} -radix decimal /tb_fir_filter/DUT/err
add wave -noupdate -expand -group DUT -color {Cornflower Blue} -radix decimal /tb_fir_filter/DUT/dr
add wave -noupdate -expand -group DUT -color {Cornflower Blue} -radix decimal /tb_fir_filter/DUT/lc
add wave -noupdate -expand -group DUT -color {Cornflower Blue} -radix decimal /tb_fir_filter/DUT/outreg_data
add wave -noupdate -expand -group DUT -color {Cornflower Blue} -radix decimal /tb_fir_filter/DUT/op
add wave -noupdate -expand -group DUT -color {Cornflower Blue} -radix decimal /tb_fir_filter/DUT/src1
add wave -noupdate -expand -group DUT -color {Cornflower Blue} -radix decimal /tb_fir_filter/DUT/src2
add wave -noupdate -expand -group DUT -color {Cornflower Blue} -radix decimal /tb_fir_filter/DUT/dest
add wave -noupdate -expand -group DUT -color {Cornflower Blue} -radix decimal /tb_fir_filter/DUT/overflow
add wave -noupdate -expand -group DUT -color {Cornflower Blue} -radix decimal /tb_fir_filter/DUT/clear
add wave -noupdate -expand -group DUT -color {Cornflower Blue} -radix decimal /tb_fir_filter/DUT/cnt_up
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1925000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 216
configure wave -valuecolwidth 146
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
WaveRestoreZoom {0 ps} {2970992 ps}

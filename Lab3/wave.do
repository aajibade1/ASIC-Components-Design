onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -color Gold -radix unsigned -subitemconfig {{/tb_adder_16bit/tb_test_case_num[31]} {-color Gold} {/tb_adder_16bit/tb_test_case_num[30]} {-color Gold} {/tb_adder_16bit/tb_test_case_num[29]} {-color Gold} {/tb_adder_16bit/tb_test_case_num[28]} {-color Gold} {/tb_adder_16bit/tb_test_case_num[27]} {-color Gold} {/tb_adder_16bit/tb_test_case_num[26]} {-color Gold} {/tb_adder_16bit/tb_test_case_num[25]} {-color Gold} {/tb_adder_16bit/tb_test_case_num[24]} {-color Gold} {/tb_adder_16bit/tb_test_case_num[23]} {-color Gold} {/tb_adder_16bit/tb_test_case_num[22]} {-color Gold} {/tb_adder_16bit/tb_test_case_num[21]} {-color Gold} {/tb_adder_16bit/tb_test_case_num[20]} {-color Gold} {/tb_adder_16bit/tb_test_case_num[19]} {-color Gold} {/tb_adder_16bit/tb_test_case_num[18]} {-color Gold} {/tb_adder_16bit/tb_test_case_num[17]} {-color Gold} {/tb_adder_16bit/tb_test_case_num[16]} {-color Gold} {/tb_adder_16bit/tb_test_case_num[15]} {-color Gold} {/tb_adder_16bit/tb_test_case_num[14]} {-color Gold} {/tb_adder_16bit/tb_test_case_num[13]} {-color Gold} {/tb_adder_16bit/tb_test_case_num[12]} {-color Gold} {/tb_adder_16bit/tb_test_case_num[11]} {-color Gold} {/tb_adder_16bit/tb_test_case_num[10]} {-color Gold} {/tb_adder_16bit/tb_test_case_num[9]} {-color Gold} {/tb_adder_16bit/tb_test_case_num[8]} {-color Gold} {/tb_adder_16bit/tb_test_case_num[7]} {-color Gold} {/tb_adder_16bit/tb_test_case_num[6]} {-color Gold} {/tb_adder_16bit/tb_test_case_num[5]} {-color Gold} {/tb_adder_16bit/tb_test_case_num[4]} {-color Gold} {/tb_adder_16bit/tb_test_case_num[3]} {-color Gold} {/tb_adder_16bit/tb_test_case_num[2]} {-color Gold} {/tb_adder_16bit/tb_test_case_num[1]} {-color Gold} {/tb_adder_16bit/tb_test_case_num[0]} {-color Gold}} /tb_adder_16bit/tb_test_case_num
add wave -noupdate -color Gold -radix unsigned /tb_adder_16bit/tb_test_case_err
add wave -noupdate -color Gold -radix unsigned -subitemconfig {{/tb_adder_16bit/tb_expected_outs[16]} {-color Gold} {/tb_adder_16bit/tb_expected_outs[15]} {-color Gold} {/tb_adder_16bit/tb_expected_outs[14]} {-color Gold} {/tb_adder_16bit/tb_expected_outs[13]} {-color Gold} {/tb_adder_16bit/tb_expected_outs[12]} {-color Gold} {/tb_adder_16bit/tb_expected_outs[11]} {-color Gold} {/tb_adder_16bit/tb_expected_outs[10]} {-color Gold} {/tb_adder_16bit/tb_expected_outs[9]} {-color Gold} {/tb_adder_16bit/tb_expected_outs[8]} {-color Gold} {/tb_adder_16bit/tb_expected_outs[7]} {-color Gold} {/tb_adder_16bit/tb_expected_outs[6]} {-color Gold} {/tb_adder_16bit/tb_expected_outs[5]} {-color Gold} {/tb_adder_16bit/tb_expected_outs[4]} {-color Gold} {/tb_adder_16bit/tb_expected_outs[3]} {-color Gold} {/tb_adder_16bit/tb_expected_outs[2]} {-color Gold} {/tb_adder_16bit/tb_expected_outs[1]} {-color Gold} {/tb_adder_16bit/tb_expected_outs[0]} {-color Gold}} /tb_adder_16bit/tb_expected_outs
add wave -noupdate -divider {DUT Signlas}
add wave -noupdate -radix unsigned /tb_adder_16bit/tb_a
add wave -noupdate -radix unsigned /tb_adder_16bit/tb_b
add wave -noupdate -radix unsigned /tb_adder_16bit/tb_carry_in
add wave -noupdate -expand -group Sum -color {Dark Orchid} -radix unsigned /tb_adder_16bit/tb_expected_sum
add wave -noupdate -expand -group Sum -color Turquoise -radix unsigned /tb_adder_16bit/tb_sum
add wave -noupdate -expand -group Overflow -color {Dark Orchid} -radix unsigned /tb_adder_16bit/tb_expected_overflow
add wave -noupdate -expand -group Overflow -color Turquoise -radix unsigned /tb_adder_16bit/tb_overflow
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {987 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 255
configure wave -valuecolwidth 39
configure wave -justifyvalue left
configure wave -signalnamewidth 0
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
WaveRestoreZoom {0 ps} {53550 ps}

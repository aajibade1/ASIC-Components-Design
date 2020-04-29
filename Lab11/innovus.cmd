#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Tue Apr 14 05:13:40 2020                
#                                                     
#######################################################

#@(#)CDS: Innovus v16.12-s051_1 (64bit) 08/17/2016 12:18 (Linux 2.6.18-194.el5)
#@(#)CDS: NanoRoute 16.12-s051_1 NR160816-1350/16_12-UB (database version 2.30, 347.6.1) {superthreading v1.30}
#@(#)CDS: AAE 16.12-s026 (64bit) 08/17/2016 (Linux 2.6.18-194.el5)
#@(#)CDS: CTE 16.12-s023_1 () Aug 12 2016 01:35:46 ( )
#@(#)CDS: SYNTECH 16.12-s009_1 () Aug 11 2016 01:33:09 ( )
#@(#)CDS: CPE v16.12-s054
#@(#)CDS: IQRC/TQRC 15.2.4-s467 (64bit) Wed Jul 20 17:12:38 PDT 2016 (Linux 2.6.18-194.el5)

set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
getDrawView
loadWorkspace -name Physical
win
set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
getDrawView
loadWorkspace -name Physical
win
set ::TimeLib::tsgMarkCellLatchConstructFlag 1
set conf_qxconf_file NULL
set conf_qxlib_file NULL
set defHierChar /
set delaycal_input_transition_delay 0.1ps
set distributed_client_message_echo 1
set distributed_mmmc_disable_reports_auto_redirection 0
set floorplan_default_site core
set fpIsMaxIoHeight 0
set init_gnd_net gnd
set init_io_file innovus.io
set init_lef_file {/package/eda/cells/OSU/v2.7/cadence/lib/ami05/lib/osu05_stdcells.lef /package/eda/cells/OSU/v2.7/cadence/lib/ami05/lib/osu05_stdcells.stacks.lef}
set init_mmmc_file osu05_MMMC.view
set init_oa_search_lib {}
set init_pwr_net vdd
set init_verilog mapped/layout_lab_design.v
set latch_time_borrow_mode max_borrow
set pegDefaultResScaleFactor 1
set pegDetailResScaleFactor 1
set report_inactive_arcs_format {from to when arc_type sense reason}
set timing_library_ccs_noise_vin_clip_points {}
set timing_library_ccs_noise_vout_clip_points {}
set timing_library_load_pin_cap_indices {}
set timing_library_write_library_to_directory {}
set tso_post_client_restore_command {update_timing ; write_eco_opt_db ;}
init_design
floorPlan -r 1.0 0.6 50 50 50 50
unfixAllIos
legalizePin
addRing -spacing_bottom 9.9 -width_left 9.9 -width_bottom 9.9 -width_top 9.9 -spacing_top 9.9 -layer_bottom metal1 -width_right 9.9 -around default_power_domain -center 1 -layer_top metal1 -spacing_right 9.9 -spacing_left 9.9 -layer_right metal2 -layer_left metal2 -offset 9.9 -nets { gnd vdd }
gui_select -rect {1185.000 681.923 1113.461 762.692}
zoomSelected
fit
gui_select -rect {1164.240 338.080 1164.240 317.194}
selectWire 310.3500 310.6500 320.2500 1180.3500 2 vdd
gui_select -rect {1122.468 683.861 1558.755 551.583}
zoomSelected
fit
fit
fit
fit
deselectAll
fit
fit
zoomIn
zoomIn
zoomOut
selectWire 1159.9500 330.4500 1169.8500 1160.5500 2 gnd
fit
zoomIn
deselectAll
selectWire 1159.9500 330.4500 1169.8500 1160.5500 2 gnd
deselectAll
selectWire 1159.9500 330.4500 1169.8500 1160.5500 2 gnd
zoomIn
deselectAll
selectWire 330.1500 330.4500 340.0500 1160.5500 2 gnd
deselectAll
selectWire 310.3500 310.6500 320.2500 1180.3500 2 vdd
deselectAll
zoomSelected
fit
selectWire 330.1500 330.4500 340.0500 1160.5500 2 gnd
zoomSelected
zoomSelected
zoomSelected
zoomSelected
zoomIn
zoomIn
zoomIn
deselectAll
selectWire 330.1500 330.4500 340.0500 1160.5500 2 gnd
deselectAll
selectWire 310.3500 310.6500 320.2500 1180.3500 2 vdd
setPlaceMode -congEffort medium
placeDesign -inPlaceOpt
checkPlace
zoomSelected
deselectAll
selectInst {I0/LD/T_SR_1/curr_val_reg[1]}
deselectAll
selectInst I0/LD/T_SR_0/U36
deselectAll
selectInst I0/LD/T_FIFO/IP_FIFO/UFIFORAM/U239
deselectAll
selectInst I0/LD/T_FIFO/IP_FIFO/UFIFORAM/U239
zoomIn
zoomIn
deselectAll
selectInst I0/LD/T_FIFO/IP_FIFO/UFIFORAM/U171
deselectAll
selectInst I0/LD/T_FIFO/IP_FIFO/UFIFORAM/U239
deselectAll
selectInst I0/LD/T_FIFO/IP_FIFO/UFIFORAM/U94
deselectAll
selectInst I0/LD/T_SR_1/U38
deselectAll
selectInst {I0/LD/T_SR_0/curr_val_reg[4]}
deselectAll
selectInst {I0/LD/T_FIFO/IP_FIFO/UFIFORAM/fiforeg_reg[3][3]}
sroute
deselectAll
selectInst G1
zoomSelected
deselectAll
selectInst I0/LD/T_SR_1/U31
deselectAll
selectInst I0/LD/T_SR_0/U34
zoomSelected
fit
deselectAll
trialRoute
timeDesign -preCTS
selectInst I0/LD/CTRL/FE_OFC42_n59
zoomSelected
deselectAll
zoomSelected
fit
selectInst I0/LD/ENC/last_bit_reg
fit
zoomIn
deselectAll
gui_select -rect {656.398 1001.579 676.607 780.974}
gui_select -append -rect {454.317 1107.672 1004.988 873.595}
zoomSelected
zoomSelected
deselectAll
selectWire 447.1500 973.0500 448.0500 1015.9500 2 {I0/LD/bus_mode_int[1]}
deselectAll
selectInst I0/LD/CTRL/U69
zoomIn
zoomOut
setOptMode -yieldEffort none
setOptMode -highEffort
setOptMode -maxDensity 0.95
setOptMode -drcMargin 0.0
setOptMode -holdTargetSlack 0.0 -setupTargetSlack 0.0
setOptMode -noSimplifyNetlist
optDesign -preCTS -drv
zoomSelected
deselectAll
fit
trialRoute
timeDesign -postCTS
setExtractRCMode -assumeMetFill
extractRC -outfile encounter.cap
setOptMode -yieldEffort none
setOptMode -highEffort
setOptMode -maxDensity 0.95
setOptMode -drcMargin 0.0
setOptMode -holdTargetSlack 0.0 -setupTargetSlack 0.0
setOptMode -noSimplifyNetlist
optDesign -postCTS -hold
optDesign -postCTS -drv
all_hold_analysis_views
all_setup_analysis_views
getPlaceMode -doneQuickCTS -quiet
selectInst G1
addFiller -cell FILL
globalNetConnect vdd -type tiehi
globalNetConnect vdd -type pgpin -pin vdd -all -override
globalNetConnect gnd -type tielo
globalNetConnect gnd -type pgpin -pin gnd -all -override
sroute
globalDetailRoute
deselectAll
selectInst U4
deselectAll
selectInst U4
deselectAll
selectInst c00
deselectAll
selectInst c00
setExtractRCMode -engine postRoute -effortLevel low -reduce 0.0
extractRC
setAnalysisMode -analysisType onChipVariation
setOptMode -yieldEffort none
setOptMode -effort high
setOptMode -maxDensity 0.95
setOptMode -drcMargin 0.0
setOptMode -holdTargetSlack 0.0 -setupTargetSlack 0.0
setOptMode -simplifyNetlist false
setOptMode -usefulSkew false
optDesign -postRoute -incr
addFiller -cell FILL -prefix FIL -fillBoundary
ecoRoute
redirect -quiet {set honorDomain [getAnalysisMode -honorClockDomains]} > /dev/null
timeDesign -postRoute -pathReports -drvReports -slackReports -numPaths 50 -prefix layout_lab_design_postRoute -outDir timingReports
get_time_unit
report_timing -machine_readable -max_points 10000 -max_slack 0.75 -path_exceptions all > top.mtarpt
load_timing_debug_report -name default_report top.mtarpt
uiKit::addWidget .dodo -type main
uiKit::addWidget gtd@frameOnly_detail -type main
uiKit::addWidget sgnviewer_tdg_frame -type main -closecmd {::sgn::quitApply sgnviewer_tdg_frame}
uiKit::addWidget sgnviewer_tdg_frame.ib -type statusbar -in sgnviewer_tdg_frame
uiKit::addWidget sgnviewer_tdg_frame.msg -type message -variable ::csv::infoMsg(sgnviewer_tdg_frame) -stretch 1
selectInst P1
selectInst {I0/LD/T_FIFO/IP_FIFO/UWFC/waddr_reg[1]}
zoomSelected
editSelect -net {I0/LD/T_FIFO/IP_FIFO/waddr[1]}
zoomSelected
selectInst I0/LD/T_FIFO/IP_FIFO/UFIFORAM/U71
zoomSelected
selectInst FE2
fit
uiKit::addWidget .dodo -type main
uiKit::addWidget gtd@frameOnly_detail -type main
uiKit::addWidget sgnviewer_tdg_frame -type main -closecmd {::sgn::quitApply sgnviewer_tdg_frame}
uiKit::addWidget sgnviewer_tdg_frame.ib -type statusbar -in sgnviewer_tdg_frame
uiKit::addWidget sgnviewer_tdg_frame.msg -type message -variable ::csv::infoMsg(sgnviewer_tdg_frame) -stretch 1
selectInst FE3
deselectAll
selectInst FE2

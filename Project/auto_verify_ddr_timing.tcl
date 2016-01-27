package require ::quartus::project


set project_name DGN-1
set current_revision [get_current_revision $project_name]


project_open -revision $current_revision $project_name

#SourceList
source verify_timing_for_ddr_sdram_component_classic_0.tcl
#EndSourceList

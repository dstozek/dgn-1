package require ::quartus::project


set project_name DGN-1
set current_revision [get_current_revision $project_name]


project_open -revision $current_revision $project_name

#SourceList
source add_constraints_for_ddr_sdram_component_classic_0.tcl
#EndSourceList
set_global_assignment -name PRE_FLOW_SCRIPT_FILE quartus_sh:auto_add_ddr_constraints.tcl -remove
export_assignments

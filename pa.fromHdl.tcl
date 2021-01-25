
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name BCDtoSevensegmentdisplay -dir "D:/ISE 14.7 PROJECT/ise 14.7/BCDtoSevensegmentdisplay/planAhead_run_2" -part xc6slx9tqg144-2
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "bcd.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {bcd.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set_property top bcd $srcset
add_files [list {bcd.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc6slx9tqg144-2


# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name TCP -dir "/home/amer/Nexys3/TCP/planAhead_run_2" -part xc6slx16csg324-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "/home/amer/Nexys3/TCP/NEXYS3.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {/home/amer/Nexys3/TCP} }
set_property target_constrs_file "/home/amer/Nexys3/TCP/xilinx_input/NEXYS3.ucf" [current_fileset -constrset]
add_files [list {/home/amer/Nexys3/TCP/xilinx_input/NEXYS3.ucf}] -fileset [get_property constrset [current_run]]
link_design

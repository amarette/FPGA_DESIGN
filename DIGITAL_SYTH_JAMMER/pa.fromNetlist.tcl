
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name DIGITAL_SYTH_JAMMER -dir "C:/Users/alexm_000/Documents/GitHub/FPGA_DESIGN/DIGITAL_SYTH_JAMMER/planAhead_run_1" -part xc3s200avq100-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/alexm_000/Documents/GitHub/FPGA_DESIGN/DIGITAL_SYTH_JAMMER/TOP_DAWG.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/alexm_000/Documents/GitHub/FPGA_DESIGN/DIGITAL_SYTH_JAMMER} {ipcore_dir} }
add_files [list {ipcore_dir/FIFO.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/PRE_FIFO.ncf}] -fileset [get_property constrset [current_run]]
set_param project.pinAheadLayout  yes
set_property target_constrs_file "TOP_DAWG.ucf" [current_fileset -constrset]
add_files [list {TOP_DAWG.ucf}] -fileset [get_property constrset [current_run]]
link_design

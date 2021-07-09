
# Inputs

##  B
set_property PACKAGE_PIN V17 [get_ports {B[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {B[0]}]
set_property PACKAGE_PIN V16 [get_ports {B[1]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {B[1]}]
set_property PACKAGE_PIN W16 [get_ports {B[2]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {B[2]}]
set_property PACKAGE_PIN W17 [get_ports {B[3]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {B[3]}]
##  A
set_property PACKAGE_PIN W2 [get_ports {A[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {A[0]}]
set_property PACKAGE_PIN U1 [get_ports {A[1]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {A[1]}]
set_property PACKAGE_PIN T1 [get_ports {A[2]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {A[2]}]
set_property PACKAGE_PIN R2 [get_ports {A[3]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {A[3]}]
	
# TRANSISTORS
set_property PACKAGE_PIN U2 [get_ports {SEL[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {SEL[0]}]
set_property PACKAGE_PIN U4 [get_ports {SEL[1]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {SEL[1]}]
set_property PACKAGE_PIN V4 [get_ports {SEL[2]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {SEL[2]}]
set_property PACKAGE_PIN W4 [get_ports {SEL[3]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {SEL[3]}]
	
# DISPLAY
set_property PACKAGE_PIN W7 [get_ports {seg_a}]
	set_property IOSTANDARD LVCMOS33 [get_ports {seg_a}]
set_property PACKAGE_PIN W6 [get_ports {seg_b}]
	set_property IOSTANDARD LVCMOS33 [get_ports {seg_b}]
set_property PACKAGE_PIN U8 [get_ports {seg_c}]
	set_property IOSTANDARD LVCMOS33 [get_ports {seg_c}]
set_property PACKAGE_PIN V8 [get_ports {seg_d}]
	set_property IOSTANDARD LVCMOS33 [get_ports {seg_d}]
set_property PACKAGE_PIN U5 [get_ports {seg_e}]
	set_property IOSTANDARD LVCMOS33 [get_ports {seg_e}]
set_property PACKAGE_PIN V5 [get_ports {seg_f}]
	set_property IOSTANDARD LVCMOS33 [get_ports {seg_f}]
set_property PACKAGE_PIN U7 [get_ports {seg_g}]
	set_property IOSTANDARD LVCMOS33 [get_ports {seg_g}]

# ENABLE
set_property PACKAGE_PIN U18 [get_ports enable]
	set_property IOSTANDARD LVCMOS33 [get_ports enable]
set_property PACKAGE_PIN T18 [get_ports rst]
	set_property IOSTANDARD LVCMOS33 [get_ports rst]
set_property PACKAGE_PIN W19 [get_ports sum_subs_sel]
	set_property IOSTANDARD LVCMOS33 [get_ports sum_subs_sel]

set_property PACKAGE_PIN W5 [get_ports clk]
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
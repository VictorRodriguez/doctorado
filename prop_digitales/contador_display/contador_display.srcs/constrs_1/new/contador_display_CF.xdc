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

# Cuando quieras conectar la señal de clk de un flip-flop o registro a un periférico que no corresponda al reloj maestro de la Basys 3, debe incluir la siguiente propiedad:
#set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets nclk]

# ENABLE
set_property PACKAGE_PIN U18 [get_ports enable]
	set_property IOSTANDARD LVCMOS33 [get_ports enable]
set_property PACKAGE_PIN T18 [get_ports rst]
	set_property IOSTANDARD LVCMOS33 [get_ports rst]
set_property PACKAGE_PIN W19 [get_ports nclk]
	set_property IOSTANDARD LVCMOS33 [get_ports nclk]

set_property PACKAGE_PIN W5 [get_ports nclk]
	set_property IOSTANDARD LVCMOS33 [get_ports nclk]
	
set_property PACKAGE_PIN V17 [get_ports {up}]
	set_property IOSTANDARD LVCMOS33 [get_ports {up}]
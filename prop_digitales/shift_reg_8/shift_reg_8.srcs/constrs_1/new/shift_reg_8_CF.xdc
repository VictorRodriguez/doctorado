set_property PACKAGE_PIN U18 [get_ports clk]
	set_property IOSTANDARD LVCMOS33 [get_ports clk]

#ponerlo o se queja	
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clk]
	
set_property PACKAGE_PIN T18 [get_ports rst]
	set_property IOSTANDARD LVCMOS33 [get_ports rst]

set_property PACKAGE_PIN V17 [get_ports {serin}]
	set_property IOSTANDARD LVCMOS33 [get_ports {serin}]

	
set_property PACKAGE_PIN T17 [get_ports enable]
	set_property IOSTANDARD LVCMOS33 [get_ports enable]
	
	
set_property PACKAGE_PIN U16 [get_ports {Q[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {Q[0]}]
set_property PACKAGE_PIN E19 [get_ports {Q[1]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {Q[1]}]
set_property PACKAGE_PIN U19 [get_ports {Q[2]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {Q[2]}]
set_property PACKAGE_PIN V19 [get_ports {Q[3]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {Q[3]}]
set_property PACKAGE_PIN W18 [get_ports {Q[4]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {Q[4]}]
set_property PACKAGE_PIN U15 [get_ports {Q[5]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {Q[5]}]
set_property PACKAGE_PIN U14 [get_ports {Q[6]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {Q[6]}]
set_property PACKAGE_PIN V14 [get_ports {Q[7]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {Q[7]}]
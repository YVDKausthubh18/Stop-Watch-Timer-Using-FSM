# Configuration voltage settings for Bank 0
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]

# Clock pin definition
set_property PACKAGE_PIN N13 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -name clk -period 10.000 [get_ports clk]  ; # for 100 MHz

# Pin assignments with IOSTANDARD LVCMOS33
set_property PACKAGE_PIN P8 [get_ports {an[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[3]}]

set_property PACKAGE_PIN R8 [get_ports {an[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[2]}]

set_property PACKAGE_PIN T7 [get_ports {an[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[1]}]

set_property PACKAGE_PIN T8 [get_ports {an[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[0]}]

set_property PACKAGE_PIN T9 [get_ports {seg[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[6]}]

set_property PACKAGE_PIN T10 [get_ports {seg[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[5]}]

set_property PACKAGE_PIN R5 [get_ports {seg[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[4]}]

set_property PACKAGE_PIN T5 [get_ports {seg[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[3]}]

set_property PACKAGE_PIN R6 [get_ports {seg[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[2]}]

set_property PACKAGE_PIN R7 [get_ports {seg[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[1]}]

set_property PACKAGE_PIN P6 [get_ports {seg[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[0]}]

set_property PACKAGE_PIN M6 [get_ports clear]
set_property IOSTANDARD LVCMOS33 [get_ports clear]

set_property PACKAGE_PIN P9 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]

set_property PACKAGE_PIN N9 [get_ports start_stop]
set_property IOSTANDARD LVCMOS33 [get_ports start_stop]

set_property PACKAGE_PIN N6 [get_ports status_led]
set_property IOSTANDARD LVCMOS33 [get_ports status_led]

# Optional user-defined port
set_property PACKAGE_PIN P7 [get_ports {LVCOM18}]
set_property IOSTANDARD LVCMOS33 [get_ports {LVCOM18}]

# Output delay constraints for 7-segment display and other outputs
set_output_delay -clock clk -max 5.000 [get_ports {seg[*]}]
set_output_delay -clock clk -min 0.000 [get_ports {seg[*]}]

set_output_delay -clock clk -max 5.000 [get_ports {an[*]}]
set_output_delay -clock clk -min 0.000 [get_ports {an[*]}]

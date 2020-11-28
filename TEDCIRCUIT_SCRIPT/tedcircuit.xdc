# Vivado does not support old UCF syntax
# must use XDC syntax

# input ports A,B,C,D are connected to Switches 0,1,2,3
# of the Nexys board
# output port E is connected to LED 0 of the Nexys board

# Ted Obuchowicz
# July 29, 2020
# XDC file for tedcircuit.vhd

set_property -dict { PACKAGE_PIN J15 IOSTANDARD LVCMOS33 } [ get_ports { A }  ] ;
set_property -dict { PACKAGE_PIN L16 IOSTANDARD LVCMOS33 } [ get_ports { B }  ] ;
set_property -dict { PACKAGE_PIN M13 IOSTANDARD LVCMOS33 } [ get_ports { C }  ] ;
set_property -dict { PACKAGE_PIN R15 IOSTANDARD LVCMOS33 } [ get_ports { D }  ] ;
set_property -dict { PACKAGE_PIN H17 IOSTANDARD LVCMOS33 } [ get_ports { E }  ] ;


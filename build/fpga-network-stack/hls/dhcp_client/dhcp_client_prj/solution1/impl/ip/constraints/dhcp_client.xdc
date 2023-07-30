set_false_path -through [get_ports dhcpEnable]
set_false_path -through [get_ports inputIpAddress[*]]
set_false_path -through [get_ports dhcpIpAddressOut[*]]
set_false_path -through [get_ports myMacAddress[*]]

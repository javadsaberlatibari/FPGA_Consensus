set clock_constraint { \
    name clk \
    module dhcp_client \
    port ap_clk \
    period 3.2 \
    uncertainty 0.864 \
}

set all_path {}

set false_path {}

set one_path { \
    name conx_path_0 \
    type single_source \
    source { \
            module dhcp_client \
            instance dhcpEnable \
            bitWidth 1 \
            type port \
           } \
}
lappend all_path $one_path
lappend false_path conx_path_0

set one_path { \
    name conx_path_1 \
    type single_source \
    source { \
            module dhcp_client \
            instance inputIpAddress \
            bitWidth 32 \
            type port \
           } \
}
lappend all_path $one_path
lappend false_path conx_path_1

set one_path { \
    name conx_path_2 \
    type single_source \
    source { \
            module dhcp_client \
            instance dhcpIpAddressOut \
            bitWidth 32 \
            type port \
           } \
}
lappend all_path $one_path
lappend false_path conx_path_2

set one_path { \
    name conx_path_3 \
    type single_source \
    source { \
            module dhcp_client \
            instance myMacAddress \
            bitWidth 48 \
            type port \
           } \
}
lappend all_path $one_path
lappend false_path conx_path_3


set clock_constraint { \
    name clk \
    module arp_server_subnet_top \
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
            module arp_server_subnet_top \
            instance myMacAddress \
            bitWidth 48 \
            type port \
           } \
}
lappend all_path $one_path
lappend false_path conx_path_0

set one_path { \
    name conx_path_1 \
    type single_source \
    source { \
            module arp_server_subnet_top \
            instance myIpAddress \
            bitWidth 32 \
            type port \
           } \
}
lappend all_path $one_path
lappend false_path conx_path_1


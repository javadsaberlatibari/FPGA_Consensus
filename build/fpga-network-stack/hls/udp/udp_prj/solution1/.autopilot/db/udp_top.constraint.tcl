set clock_constraint { \
    name clk \
    module udp_top \
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
            module udp_top \
            instance reg_ip_address \
            bitWidth 128 \
            type port \
           } \
}
lappend all_path $one_path
lappend false_path conx_path_0

set one_path { \
    name conx_path_1 \
    type single_source \
    source { \
            module udp_top \
            instance reg_listen_port \
            bitWidth 16 \
            type port \
           } \
}
lappend all_path $one_path
lappend false_path conx_path_1


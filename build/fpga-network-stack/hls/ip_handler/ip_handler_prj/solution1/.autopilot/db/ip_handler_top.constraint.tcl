set clock_constraint { \
    name clk \
    module ip_handler_top \
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
            module ip_handler_top \
            instance myIpAddress \
            bitWidth 32 \
            type port \
           } \
}
lappend all_path $one_path
lappend false_path conx_path_0


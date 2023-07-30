set clock_constraint { \
    name clk \
    module ipv4_top \
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
            module ipv4_top \
            instance local_ipv4_address \
            bitWidth 32 \
            type port \
           } \
}
lappend all_path $one_path
lappend false_path conx_path_0

set one_path { \
    name conx_path_1 \
    type single_source \
    source { \
            module ipv4_top \
            instance protocol \
            bitWidth 8 \
            type port \
           } \
}
lappend all_path $one_path
lappend false_path conx_path_1


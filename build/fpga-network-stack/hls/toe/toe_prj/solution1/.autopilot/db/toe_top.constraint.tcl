set clock_constraint { \
    name clk \
    module toe_top \
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
            module toe_top \
            instance axis_data_count \
            bitWidth 16 \
            type port \
           } \
}
lappend all_path $one_path
lappend false_path conx_path_0

set one_path { \
    name conx_path_1 \
    type single_source \
    source { \
            module toe_top \
            instance axis_max_data_count \
            bitWidth 16 \
            type port \
           } \
}
lappend all_path $one_path
lappend false_path conx_path_1

set one_path { \
    name conx_path_2 \
    type single_source \
    source { \
            module toe_top \
            instance myIpAddress \
            bitWidth 32 \
            type port \
           } \
}
lappend all_path $one_path
lappend false_path conx_path_2


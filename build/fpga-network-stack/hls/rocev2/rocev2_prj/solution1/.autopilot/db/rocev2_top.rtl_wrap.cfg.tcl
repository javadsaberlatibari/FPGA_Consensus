set lang "C"
set moduleName "rocev2_top"
set moduleIsExternC "1"
set rawDecl ""
set globalVariable ""
set PortList ""
set PortName "s_axis_rx_data"
set BitWidth "32"
set ArrayOpt ""
set Const "0"
set Volatile "0"
set Pointer "0"
set Reference "0"
set Dims [list 0]
set Interface "[list AP_STREAM 0]"
set DataType "int"
set Port [list $PortName $Interface $DataType $Pointer $Dims $Const    $Volatile $ArrayOpt]
lappend PortList $Port
set PortName "s_axis_tx_meta"
set BitWidth "32"
set ArrayOpt ""
set Const "0"
set Volatile "0"
set Pointer "0"
set Reference "0"
set Dims [list 0]
set Interface "[list AP_STREAM 0]"
set DataType "int"
set Port [list $PortName $Interface $DataType $Pointer $Dims $Const    $Volatile $ArrayOpt]
lappend PortList $Port
set PortName "s_axis_tx_data"
set BitWidth "32"
set ArrayOpt ""
set Const "0"
set Volatile "0"
set Pointer "0"
set Reference "0"
set Dims [list 0]
set Interface "[list AP_STREAM 0]"
set DataType "int"
set Port [list $PortName $Interface $DataType $Pointer $Dims $Const    $Volatile $ArrayOpt]
lappend PortList $Port
set PortName "m_axis_tx_data"
set BitWidth "32"
set ArrayOpt ""
set Const "0"
set Volatile "0"
set Pointer "0"
set Reference "0"
set Dims [list 0]
set Interface "[list AP_STREAM 0]"
set DataType "int"
set Port [list $PortName $Interface $DataType $Pointer $Dims $Const    $Volatile $ArrayOpt]
lappend PortList $Port
set PortName "m_axis_mem_write_cmd"
set BitWidth "32"
set ArrayOpt ""
set Const "0"
set Volatile "0"
set Pointer "0"
set Reference "0"
set Dims [list 0]
set Interface "[list AP_STREAM 0]"
set DataType "int"
set Port [list $PortName $Interface $DataType $Pointer $Dims $Const    $Volatile $ArrayOpt]
lappend PortList $Port
set PortName "m_axis_mem_read_cmd"
set BitWidth "32"
set ArrayOpt ""
set Const "0"
set Volatile "0"
set Pointer "0"
set Reference "0"
set Dims [list 0]
set Interface "[list AP_STREAM 0]"
set DataType "int"
set Port [list $PortName $Interface $DataType $Pointer $Dims $Const    $Volatile $ArrayOpt]
lappend PortList $Port
set PortName "m_axis_mem_write_data"
set BitWidth "32"
set ArrayOpt ""
set Const "0"
set Volatile "0"
set Pointer "0"
set Reference "0"
set Dims [list 0]
set Interface "[list AP_STREAM 0]"
set DataType "int"
set Port [list $PortName $Interface $DataType $Pointer $Dims $Const    $Volatile $ArrayOpt]
lappend PortList $Port
set PortName "s_axis_mem_read_data"
set BitWidth "32"
set ArrayOpt ""
set Const "0"
set Volatile "0"
set Pointer "0"
set Reference "0"
set Dims [list 0]
set Interface "[list AP_STREAM 0]"
set DataType "int"
set Port [list $PortName $Interface $DataType $Pointer $Dims $Const    $Volatile $ArrayOpt]
lappend PortList $Port
set PortName "s_axis_qp_interface"
set BitWidth "32"
set ArrayOpt ""
set Const "0"
set Volatile "0"
set Pointer "0"
set Reference "0"
set Dims [list 0]
set Interface "[list AP_STREAM 0]"
set DataType "int"
set Port [list $PortName $Interface $DataType $Pointer $Dims $Const    $Volatile $ArrayOpt]
lappend PortList $Port
set PortName "s_axis_qp_conn_interface"
set BitWidth "32"
set ArrayOpt ""
set Const "0"
set Volatile "0"
set Pointer "0"
set Reference "0"
set Dims [list 0]
set Interface "[list AP_STREAM 0]"
set DataType "int"
set Port [list $PortName $Interface $DataType $Pointer $Dims $Const    $Volatile $ArrayOpt]
lappend PortList $Port
set PortName "local_ip_address"
set BitWidth "128"
set ArrayOpt ""
set Const "0"
set Volatile "0"
set Pointer "0"
set Reference "0"
set Dims [list 0]
set Interface "wire"
set DataType "__cosim_s16__"
set Port [list $PortName $Interface $DataType $Pointer $Dims $Const    $Volatile $ArrayOpt]
lappend PortList $Port
set PortName "regCrcDropPkgCount"
set BitWidth "32"
set ArrayOpt ""
set Const "0"
set Volatile "1"
set Pointer "1"
set Reference "0"
set Dims [list 0]
set Interface "wire"
set DataType "void"
set Port [list $PortName $Interface $DataType $Pointer $Dims $Const    $Volatile $ArrayOpt]
lappend PortList $Port
set PortName "regInvalidPsnDropCount"
set BitWidth "32"
set ArrayOpt ""
set Const "0"
set Volatile "1"
set Pointer "1"
set Reference "0"
set Dims [list 0]
set Interface "wire"
set DataType "void"
set Port [list $PortName $Interface $DataType $Pointer $Dims $Const    $Volatile $ArrayOpt]
lappend PortList $Port
set globalAPint "" 
set returnAPInt "" 
set hasCPPAPInt 0 
set argAPInt "" 
set hasCPPAPFix 0 
set hasSCFix 0 
set hasCBool 0 
set hasCPPComplex 0 
set isTemplateTop 0
set hasHalf 0 
set dataPackList ""
set module [list $moduleName $PortList $rawDecl $argAPInt $returnAPInt $dataPackList]

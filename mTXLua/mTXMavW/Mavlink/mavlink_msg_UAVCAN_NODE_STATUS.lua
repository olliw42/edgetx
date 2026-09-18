local UAVCAN_NODE_STATUS = {}
UAVCAN_NODE_STATUS.id = 310
UAVCAN_NODE_STATUS.crc_extra = 28
UAVCAN_NODE_STATUS.fields = {
             { "time_usec", "<I8" },
             { "uptime_sec", "<I4" },
             { "vendor_specific_status_code", "<I2" },
             { "health", "<B" },
             { "mode", "<B" },
             { "sub_mode", "<B" },
             }
return UAVCAN_NODE_STATUS

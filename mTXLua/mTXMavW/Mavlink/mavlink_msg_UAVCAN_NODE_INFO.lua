local UAVCAN_NODE_INFO = {}
UAVCAN_NODE_INFO.id = 311
UAVCAN_NODE_INFO.crc_extra = 95
UAVCAN_NODE_INFO.fields = {
             { "time_usec", "<I8" },
             { "uptime_sec", "<I4" },
             { "sw_vcs_commit", "<I4" },
             { "name", "<c80" },
             { "hw_version_major", "<B" },
             { "hw_version_minor", "<B" },
             { "hw_unique_id", "<B", 16 },
             { "sw_version_major", "<B" },
             { "sw_version_minor", "<B" },
             }
return UAVCAN_NODE_INFO

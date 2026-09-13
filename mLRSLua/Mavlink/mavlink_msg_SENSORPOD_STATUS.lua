local SENSORPOD_STATUS = {}
SENSORPOD_STATUS.id = 8012
SENSORPOD_STATUS.crc_extra = 54
SENSORPOD_STATUS.fields = {
             { "timestamp", "<I8" },
             { "free_space", "<I2" },
             { "visensor_rate_1", "<B" },
             { "visensor_rate_2", "<B" },
             { "visensor_rate_3", "<B" },
             { "visensor_rate_4", "<B" },
             { "recording_nodes_count", "<B" },
             { "cpu_temp", "<B" },
             }
return SENSORPOD_STATUS

local ONBOARD_COMPUTER_STATUS = {}
ONBOARD_COMPUTER_STATUS.id = 390
ONBOARD_COMPUTER_STATUS.crc_extra = 156
ONBOARD_COMPUTER_STATUS.fields = {
             { "time_usec", "<I8" },
             { "uptime", "<I4" },
             { "ram_usage", "<I4" },
             { "ram_total", "<I4" },
             { "storage_type", "<I4", 4 },
             { "storage_usage", "<I4", 4 },
             { "storage_total", "<I4", 4 },
             { "link_type", "<I4", 6 },
             { "link_tx_rate", "<I4", 6 },
             { "link_rx_rate", "<I4", 6 },
             { "link_tx_max", "<I4", 6 },
             { "link_rx_max", "<I4", 6 },
             { "fan_speed", "<i2", 4 },
             { "type", "<B" },
             { "cpu_cores", "<B", 8 },
             { "cpu_combined", "<B", 10 },
             { "gpu_cores", "<B", 4 },
             { "gpu_combined", "<B", 10 },
             { "temperature_board", "<b" },
             { "temperature_core", "<b", 8 },
             { "status_flags", "<I2" },
             }
return ONBOARD_COMPUTER_STATUS

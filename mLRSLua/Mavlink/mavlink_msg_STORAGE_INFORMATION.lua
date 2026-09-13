local STORAGE_INFORMATION = {}
STORAGE_INFORMATION.id = 261
STORAGE_INFORMATION.crc_extra = 179
STORAGE_INFORMATION.fields = {
             { "time_boot_ms", "<I4" },
             { "total_capacity", "<f" },
             { "used_capacity", "<f" },
             { "available_capacity", "<f" },
             { "read_speed", "<f" },
             { "write_speed", "<f" },
             { "storage_id", "<B" },
             { "storage_count", "<B" },
             { "status", "<B" },
             { "type", "<B" },
             { "name", "<c32" },
             { "storage_usage", "<B" },
             }
return STORAGE_INFORMATION

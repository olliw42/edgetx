local LOG_ENTRY = {}
LOG_ENTRY.id = 118
LOG_ENTRY.crc_extra = 56
LOG_ENTRY.fields = {
             { "time_utc", "<I4" },
             { "size", "<I4" },
             { "id", "<I2" },
             { "num_logs", "<I2" },
             { "last_log_num", "<I2" },
             }
return LOG_ENTRY

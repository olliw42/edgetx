local LOG_REQUEST_LIST = {}
LOG_REQUEST_LIST.id = 117
LOG_REQUEST_LIST.crc_extra = 128
LOG_REQUEST_LIST.fields = {
             { "start", "<I2" },
             { "end", "<I2" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             }
return LOG_REQUEST_LIST

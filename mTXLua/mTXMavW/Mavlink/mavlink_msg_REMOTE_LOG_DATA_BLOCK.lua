local REMOTE_LOG_DATA_BLOCK = {}
REMOTE_LOG_DATA_BLOCK.id = 184
REMOTE_LOG_DATA_BLOCK.crc_extra = 159
REMOTE_LOG_DATA_BLOCK.fields = {
             { "seqno", "<I4" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "data", "<B", 200 },
             }
return REMOTE_LOG_DATA_BLOCK

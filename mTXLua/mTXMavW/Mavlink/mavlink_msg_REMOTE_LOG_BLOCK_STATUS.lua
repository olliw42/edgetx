local REMOTE_LOG_BLOCK_STATUS = {}
REMOTE_LOG_BLOCK_STATUS.id = 185
REMOTE_LOG_BLOCK_STATUS.crc_extra = 186
REMOTE_LOG_BLOCK_STATUS.fields = {
             { "seqno", "<I4" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "status", "<B" },
             }
return REMOTE_LOG_BLOCK_STATUS

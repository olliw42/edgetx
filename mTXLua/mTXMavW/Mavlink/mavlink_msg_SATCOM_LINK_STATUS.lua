local SATCOM_LINK_STATUS = {}
SATCOM_LINK_STATUS.id = 8015
SATCOM_LINK_STATUS.crc_extra = 23
SATCOM_LINK_STATUS.fields = {
             { "timestamp", "<I8" },
             { "last_heartbeat", "<I8" },
             { "failed_sessions", "<I2" },
             { "successful_sessions", "<I2" },
             { "signal_quality", "<B" },
             { "ring_pending", "<B" },
             { "tx_session_pending", "<B" },
             { "rx_session_pending", "<B" },
             }
return SATCOM_LINK_STATUS

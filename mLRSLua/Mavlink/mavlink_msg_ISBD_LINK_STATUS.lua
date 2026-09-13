local ISBD_LINK_STATUS = {}
ISBD_LINK_STATUS.id = 335
ISBD_LINK_STATUS.crc_extra = 225
ISBD_LINK_STATUS.fields = {
             { "timestamp", "<I8" },
             { "last_heartbeat", "<I8" },
             { "failed_sessions", "<I2" },
             { "successful_sessions", "<I2" },
             { "signal_quality", "<B" },
             { "ring_pending", "<B" },
             { "tx_session_pending", "<B" },
             { "rx_session_pending", "<B" },
             }
return ISBD_LINK_STATUS

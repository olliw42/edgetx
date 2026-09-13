local LINK_NODE_STATUS = {}
LINK_NODE_STATUS.id = 8
LINK_NODE_STATUS.crc_extra = 117
LINK_NODE_STATUS.fields = {
             { "timestamp", "<I8" },
             { "tx_rate", "<I4" },
             { "rx_rate", "<I4" },
             { "messages_sent", "<I4" },
             { "messages_received", "<I4" },
             { "messages_lost", "<I4" },
             { "rx_parse_err", "<I2" },
             { "tx_overflows", "<I2" },
             { "rx_overflows", "<I2" },
             { "tx_buf", "<B" },
             { "rx_buf", "<B" },
             }
return LINK_NODE_STATUS

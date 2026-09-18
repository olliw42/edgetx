local MLRS_RADIO_LINK_FLOW_CONTROL = {}
MLRS_RADIO_LINK_FLOW_CONTROL.id = 60047
MLRS_RADIO_LINK_FLOW_CONTROL.crc_extra = 55
MLRS_RADIO_LINK_FLOW_CONTROL.fields = {
             { "tx_ser_rate", "<I2" },
             { "rx_ser_rate", "<I2" },
             { "tx_used_ser_bandwidth", "<B" },
             { "rx_used_ser_bandwidth", "<B" },
             { "txbuf", "<B" },
             }
return MLRS_RADIO_LINK_FLOW_CONTROL

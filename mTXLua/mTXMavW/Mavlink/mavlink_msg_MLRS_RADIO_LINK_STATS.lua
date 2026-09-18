local MLRS_RADIO_LINK_STATS = {}
MLRS_RADIO_LINK_STATS.id = 60045
MLRS_RADIO_LINK_STATS.crc_extra = 14
MLRS_RADIO_LINK_STATS.fields = {
             { "flags", "<I2" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "rx_LQ_rc", "<B" },
             { "rx_LQ_ser", "<B" },
             { "rx_rssi1", "<B" },
             { "rx_snr1", "<b" },
             { "tx_LQ_ser", "<B" },
             { "tx_rssi1", "<B" },
             { "tx_snr1", "<b" },
             { "rx_rssi2", "<B" },
             { "rx_snr2", "<b" },
             { "tx_rssi2", "<B" },
             { "tx_snr2", "<b" },
             { "frequency1", "<f" },
             { "frequency2", "<f" },
             }
return MLRS_RADIO_LINK_STATS

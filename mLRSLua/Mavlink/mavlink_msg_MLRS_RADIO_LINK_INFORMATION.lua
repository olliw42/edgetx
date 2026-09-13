local MLRS_RADIO_LINK_INFORMATION = {}
MLRS_RADIO_LINK_INFORMATION.id = 60046
MLRS_RADIO_LINK_INFORMATION.crc_extra = 171
MLRS_RADIO_LINK_INFORMATION.fields = {
             { "tx_frame_rate", "<I2" },
             { "rx_frame_rate", "<I2" },
             { "tx_ser_data_rate", "<I2" },
             { "rx_ser_data_rate", "<I2" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "type", "<B" },
             { "mode", "<B" },
             { "tx_power", "<b" },
             { "rx_power", "<b" },
             { "mode_str", "<c6" },
             { "band_str", "<c6" },
             { "tx_receive_sensitivity", "<B" },
             { "rx_receive_sensitivity", "<B" },
             }
return MLRS_RADIO_LINK_INFORMATION

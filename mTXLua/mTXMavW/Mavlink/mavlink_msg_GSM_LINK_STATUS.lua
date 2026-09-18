local GSM_LINK_STATUS = {}
GSM_LINK_STATUS.id = 8014
GSM_LINK_STATUS.crc_extra = 200
GSM_LINK_STATUS.fields = {
             { "timestamp", "<I8" },
             { "gsm_modem_type", "<B" },
             { "gsm_link_type", "<B" },
             { "rssi", "<B" },
             { "rsrp_rscp", "<B" },
             { "sinr_ecio", "<B" },
             { "rsrq", "<B" },
             }
return GSM_LINK_STATUS

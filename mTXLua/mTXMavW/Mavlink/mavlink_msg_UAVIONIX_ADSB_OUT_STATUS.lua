local UAVIONIX_ADSB_OUT_STATUS = {}
UAVIONIX_ADSB_OUT_STATUS.id = 10008
UAVIONIX_ADSB_OUT_STATUS.crc_extra = 240
UAVIONIX_ADSB_OUT_STATUS.fields = {
             { "squawk", "<I2" },
             { "state", "<B" },
             { "NIC_NACp", "<B" },
             { "boardTemp", "<B" },
             { "fault", "<B" },
             { "flight_id", "<c8" },
             }
return UAVIONIX_ADSB_OUT_STATUS

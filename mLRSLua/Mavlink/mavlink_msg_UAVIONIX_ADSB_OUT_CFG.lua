local UAVIONIX_ADSB_OUT_CFG = {}
UAVIONIX_ADSB_OUT_CFG.id = 10001
UAVIONIX_ADSB_OUT_CFG.crc_extra = 209
UAVIONIX_ADSB_OUT_CFG.fields = {
             { "ICAO", "<I4" },
             { "stallSpeed", "<I2" },
             { "callsign", "<c9" },
             { "emitterType", "<B" },
             { "aircraftSize", "<B" },
             { "gpsOffsetLat", "<B" },
             { "gpsOffsetLon", "<B" },
             { "rfSelect", "<B" },
             }
return UAVIONIX_ADSB_OUT_CFG

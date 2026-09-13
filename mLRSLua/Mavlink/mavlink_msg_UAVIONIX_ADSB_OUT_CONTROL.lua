local UAVIONIX_ADSB_OUT_CONTROL = {}
UAVIONIX_ADSB_OUT_CONTROL.id = 10007
UAVIONIX_ADSB_OUT_CONTROL.crc_extra = 71
UAVIONIX_ADSB_OUT_CONTROL.fields = {
             { "baroAltMSL", "<i4" },
             { "squawk", "<I2" },
             { "state", "<B" },
             { "emergencyStatus", "<B" },
             { "flight_id", "<c8" },
             { "x_bit", "<B" },
             }
return UAVIONIX_ADSB_OUT_CONTROL

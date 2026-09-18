local UAVIONIX_ADSB_OUT_DYNAMIC = {}
UAVIONIX_ADSB_OUT_DYNAMIC.id = 10002
UAVIONIX_ADSB_OUT_DYNAMIC.crc_extra = 186
UAVIONIX_ADSB_OUT_DYNAMIC.fields = {
             { "utcTime", "<I4" },
             { "gpsLat", "<i4" },
             { "gpsLon", "<i4" },
             { "gpsAlt", "<i4" },
             { "baroAltMSL", "<i4" },
             { "accuracyHor", "<I4" },
             { "accuracyVert", "<I2" },
             { "accuracyVel", "<I2" },
             { "velVert", "<i2" },
             { "velNS", "<i2" },
             { "VelEW", "<i2" },
             { "state", "<I2" },
             { "squawk", "<I2" },
             { "gpsFix", "<B" },
             { "numSats", "<B" },
             { "emergencyStatus", "<B" },
             }
return UAVIONIX_ADSB_OUT_DYNAMIC

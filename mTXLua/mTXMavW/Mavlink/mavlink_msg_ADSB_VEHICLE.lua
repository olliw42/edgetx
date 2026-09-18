local ADSB_VEHICLE = {}
ADSB_VEHICLE.id = 246
ADSB_VEHICLE.crc_extra = 184
ADSB_VEHICLE.fields = {
             { "ICAO_address", "<I4" },
             { "lat", "<i4" },
             { "lon", "<i4" },
             { "altitude", "<i4" },
             { "heading", "<I2" },
             { "hor_velocity", "<I2" },
             { "ver_velocity", "<i2" },
             { "flags", "<I2" },
             { "squawk", "<I2" },
             { "altitude_type", "<B" },
             { "callsign", "<c9" },
             { "emitter_type", "<B" },
             { "tslc", "<B" },
             }
return ADSB_VEHICLE

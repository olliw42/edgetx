local AIS_VESSEL = {}
AIS_VESSEL.id = 301
AIS_VESSEL.crc_extra = 243
AIS_VESSEL.fields = {
             { "MMSI", "<I4" },
             { "lat", "<i4" },
             { "lon", "<i4" },
             { "COG", "<I2" },
             { "heading", "<I2" },
             { "velocity", "<I2" },
             { "dimension_bow", "<I2" },
             { "dimension_stern", "<I2" },
             { "tslc", "<I2" },
             { "flags", "<I2" },
             { "turn_rate", "<b" },
             { "navigational_status", "<B" },
             { "type", "<B" },
             { "dimension_port", "<B" },
             { "dimension_starboard", "<B" },
             { "callsign", "<c7" },
             { "name", "<c20" },
             }
return AIS_VESSEL

local GPS_STATUS = {}
GPS_STATUS.id = 25
GPS_STATUS.crc_extra = 23
GPS_STATUS.fields = {
             { "satellites_visible", "<B" },
             { "satellite_prn", "<B", 20 },
             { "satellite_used", "<B", 20 },
             { "satellite_elevation", "<B", 20 },
             { "satellite_azimuth", "<B", 20 },
             { "satellite_snr", "<B", 20 },
             }
return GPS_STATUS

local GPS_RTCM_DATA = {}
GPS_RTCM_DATA.id = 233
GPS_RTCM_DATA.crc_extra = 35
GPS_RTCM_DATA.fields = {
             { "flags", "<B" },
             { "len", "<B" },
             { "data", "<B", 180 },
             }
return GPS_RTCM_DATA

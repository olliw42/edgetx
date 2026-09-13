local UTM_GLOBAL_POSITION = {}
UTM_GLOBAL_POSITION.id = 340
UTM_GLOBAL_POSITION.crc_extra = 99
UTM_GLOBAL_POSITION.fields = {
             { "time", "<I8" },
             { "lat", "<i4" },
             { "lon", "<i4" },
             { "alt", "<i4" },
             { "relative_alt", "<i4" },
             { "next_lat", "<i4" },
             { "next_lon", "<i4" },
             { "next_alt", "<i4" },
             { "vx", "<i2" },
             { "vy", "<i2" },
             { "vz", "<i2" },
             { "h_acc", "<I2" },
             { "v_acc", "<I2" },
             { "vel_acc", "<I2" },
             { "update_rate", "<I2" },
             { "uas_id", "<B", 18 },
             { "flight_state", "<B" },
             { "flags", "<B" },
             }
return UTM_GLOBAL_POSITION

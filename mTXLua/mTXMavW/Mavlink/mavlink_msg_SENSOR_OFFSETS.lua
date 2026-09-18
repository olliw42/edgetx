local SENSOR_OFFSETS = {}
SENSOR_OFFSETS.id = 150
SENSOR_OFFSETS.crc_extra = 134
SENSOR_OFFSETS.fields = {
             { "mag_declination", "<f" },
             { "raw_press", "<i4" },
             { "raw_temp", "<i4" },
             { "gyro_cal_x", "<f" },
             { "gyro_cal_y", "<f" },
             { "gyro_cal_z", "<f" },
             { "accel_cal_x", "<f" },
             { "accel_cal_y", "<f" },
             { "accel_cal_z", "<f" },
             { "mag_ofs_x", "<i2" },
             { "mag_ofs_y", "<i2" },
             { "mag_ofs_z", "<i2" },
             }
return SENSOR_OFFSETS

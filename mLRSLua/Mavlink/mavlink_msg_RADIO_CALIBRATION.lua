local RADIO_CALIBRATION = {}
RADIO_CALIBRATION.id = 221
RADIO_CALIBRATION.crc_extra = 71
RADIO_CALIBRATION.fields = {
             { "aileron", "<I2", 3 },
             { "elevator", "<I2", 3 },
             { "rudder", "<I2", 3 },
             { "gyro", "<I2", 2 },
             { "pitch", "<I2", 5 },
             { "throttle", "<I2", 5 },
             }
return RADIO_CALIBRATION

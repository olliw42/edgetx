local HIL_STATE_QUATERNION = {}
HIL_STATE_QUATERNION.id = 115
HIL_STATE_QUATERNION.crc_extra = 4
HIL_STATE_QUATERNION.fields = {
             { "time_usec", "<I8" },
             { "attitude_quaternion", "<f", 4 },
             { "rollspeed", "<f" },
             { "pitchspeed", "<f" },
             { "yawspeed", "<f" },
             { "lat", "<i4" },
             { "lon", "<i4" },
             { "alt", "<i4" },
             { "vx", "<i2" },
             { "vy", "<i2" },
             { "vz", "<i2" },
             { "ind_airspeed", "<I2" },
             { "true_airspeed", "<I2" },
             { "xacc", "<i2" },
             { "yacc", "<i2" },
             { "zacc", "<i2" },
             }
return HIL_STATE_QUATERNION

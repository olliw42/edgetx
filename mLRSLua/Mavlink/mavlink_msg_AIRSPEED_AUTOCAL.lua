local AIRSPEED_AUTOCAL = {}
AIRSPEED_AUTOCAL.id = 174
AIRSPEED_AUTOCAL.crc_extra = 167
AIRSPEED_AUTOCAL.fields = {
             { "vx", "<f" },
             { "vy", "<f" },
             { "vz", "<f" },
             { "diff_pressure", "<f" },
             { "EAS2TAS", "<f" },
             { "ratio", "<f" },
             { "state_x", "<f" },
             { "state_y", "<f" },
             { "state_z", "<f" },
             { "Pax", "<f" },
             { "Pby", "<f" },
             { "Pcz", "<f" },
             }
return AIRSPEED_AUTOCAL

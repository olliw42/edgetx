local AIRSPEED = {}
AIRSPEED.id = 295
AIRSPEED.crc_extra = 234
AIRSPEED.fields = {
             { "airspeed", "<f" },
             { "raw_press", "<f" },
             { "temperature", "<i2" },
             { "id", "<B" },
             { "flags", "<B" },
             }
return AIRSPEED

local VFR_HUD = {}
VFR_HUD.id = 74
VFR_HUD.crc_extra = 20
VFR_HUD.fields = {
             { "airspeed", "<f" },
             { "groundspeed", "<f" },
             { "alt", "<f" },
             { "climb", "<f" },
             { "heading", "<i2" },
             { "throttle", "<I2" },
             }
return VFR_HUD

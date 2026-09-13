local SET_MAG_OFFSETS = {}
SET_MAG_OFFSETS.id = 151
SET_MAG_OFFSETS.crc_extra = 219
SET_MAG_OFFSETS.fields = {
             { "mag_ofs_x", "<i2" },
             { "mag_ofs_y", "<i2" },
             { "mag_ofs_z", "<i2" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             }
return SET_MAG_OFFSETS

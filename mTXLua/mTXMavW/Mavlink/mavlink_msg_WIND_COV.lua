local WIND_COV = {}
WIND_COV.id = 231
WIND_COV.crc_extra = 105
WIND_COV.fields = {
             { "time_usec", "<I8" },
             { "wind_x", "<f" },
             { "wind_y", "<f" },
             { "wind_z", "<f" },
             { "var_horiz", "<f" },
             { "var_vert", "<f" },
             { "wind_alt", "<f" },
             { "horiz_accuracy", "<f" },
             { "vert_accuracy", "<f" },
             }
return WIND_COV

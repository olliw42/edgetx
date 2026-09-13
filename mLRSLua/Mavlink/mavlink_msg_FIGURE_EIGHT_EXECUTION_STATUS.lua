local FIGURE_EIGHT_EXECUTION_STATUS = {}
FIGURE_EIGHT_EXECUTION_STATUS.id = 361
FIGURE_EIGHT_EXECUTION_STATUS.crc_extra = 93
FIGURE_EIGHT_EXECUTION_STATUS.fields = {
             { "time_usec", "<I8" },
             { "major_radius", "<f" },
             { "minor_radius", "<f" },
             { "orientation", "<f" },
             { "x", "<i4" },
             { "y", "<i4" },
             { "z", "<f" },
             { "frame", "<B" },
             }
return FIGURE_EIGHT_EXECUTION_STATUS

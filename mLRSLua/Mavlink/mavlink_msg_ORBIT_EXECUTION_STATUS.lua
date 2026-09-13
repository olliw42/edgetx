local ORBIT_EXECUTION_STATUS = {}
ORBIT_EXECUTION_STATUS.id = 360
ORBIT_EXECUTION_STATUS.crc_extra = 11
ORBIT_EXECUTION_STATUS.fields = {
             { "time_usec", "<I8" },
             { "radius", "<f" },
             { "x", "<i4" },
             { "y", "<i4" },
             { "z", "<f" },
             { "frame", "<B" },
             }
return ORBIT_EXECUTION_STATUS

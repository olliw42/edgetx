local DEBUG_VECT = {}
DEBUG_VECT.id = 250
DEBUG_VECT.crc_extra = 49
DEBUG_VECT.fields = {
             { "time_usec", "<I8" },
             { "x", "<f" },
             { "y", "<f" },
             { "z", "<f" },
             { "name", "<c10" },
             }
return DEBUG_VECT

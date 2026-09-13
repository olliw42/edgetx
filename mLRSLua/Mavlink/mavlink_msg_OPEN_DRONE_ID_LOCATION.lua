local OPEN_DRONE_ID_LOCATION = {}
OPEN_DRONE_ID_LOCATION.id = 12901
OPEN_DRONE_ID_LOCATION.crc_extra = 254
OPEN_DRONE_ID_LOCATION.fields = {
             { "latitude", "<i4" },
             { "longitude", "<i4" },
             { "altitude_barometric", "<f" },
             { "altitude_geodetic", "<f" },
             { "height", "<f" },
             { "timestamp", "<f" },
             { "direction", "<I2" },
             { "speed_horizontal", "<I2" },
             { "speed_vertical", "<i2" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "id_or_mac", "<B", 20 },
             { "status", "<B" },
             { "height_reference", "<B" },
             { "horizontal_accuracy", "<B" },
             { "vertical_accuracy", "<B" },
             { "barometer_accuracy", "<B" },
             { "speed_accuracy", "<B" },
             { "timestamp_accuracy", "<B" },
             }
return OPEN_DRONE_ID_LOCATION

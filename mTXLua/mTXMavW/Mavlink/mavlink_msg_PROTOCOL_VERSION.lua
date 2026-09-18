local PROTOCOL_VERSION = {}
PROTOCOL_VERSION.id = 300
PROTOCOL_VERSION.crc_extra = 217
PROTOCOL_VERSION.fields = {
             { "version", "<I2" },
             { "min_version", "<I2" },
             { "max_version", "<I2" },
             { "spec_version_hash", "<B", 8 },
             { "library_version_hash", "<B", 8 },
             }
return PROTOCOL_VERSION

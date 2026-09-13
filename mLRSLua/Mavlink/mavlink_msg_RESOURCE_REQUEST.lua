local RESOURCE_REQUEST = {}
RESOURCE_REQUEST.id = 142
RESOURCE_REQUEST.crc_extra = 72
RESOURCE_REQUEST.fields = {
             { "request_id", "<B" },
             { "uri_type", "<B" },
             { "uri", "<B", 120 },
             { "transfer_type", "<B" },
             { "storage", "<B", 120 },
             }
return RESOURCE_REQUEST

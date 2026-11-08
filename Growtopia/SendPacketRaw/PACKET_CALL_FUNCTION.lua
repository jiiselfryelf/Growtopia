-- PACKET_CALL_FUNCTION (type 1)
-- variant list
-- type 1 bawa VariantList yang udah di-encode.
local var = {[0] = "OnConsoleMessage", [1] = "Halo!", netid = -1}
SendVarlist(var)

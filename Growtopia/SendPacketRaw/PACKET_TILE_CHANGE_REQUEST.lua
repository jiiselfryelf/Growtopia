-- PACKET_TILE_CHANGE_REQUEST (type 3)
-- request tile
local packet = {
    type = 3, int_data = 2,
    pos_x = 64, pos_y = 64,
    int_x = 2, int_y = 2
}
-- SendPacketRaw(packet) -- cuma struktur, perlu validasi

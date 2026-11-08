-- PACKET_STATE (type 0)
-- state player
local p = GetLocal()
local packet = {
    type = 0,
    pos_x = p.pos_x,
    pos_y = p.pos_y,
    flags = 32 -- hadap kanan, 48 = kiri
}
SendPacketRaw(packet)

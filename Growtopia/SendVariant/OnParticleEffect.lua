-- OnParticleEffect
-- partikel di posisi player
local var = {
    [0] = "OnParticleEffect",
    [1] = 73,
    [2] = {GetLocal().pos_x + 10, GetLocal().pos_y + 15},
    [3] = 0,
    [4] = 0,
    netid = -1
}
SendVarlist(var)

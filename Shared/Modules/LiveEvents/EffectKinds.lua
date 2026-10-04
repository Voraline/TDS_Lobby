-- Script path: ReplicatedStorage.Shared.Modules.LiveEvents.EffectKinds
-- Decompile time: 0.77 ms

local v1 = {
    BlackHole = "black-hole",
    Blackout = "blackout",
    Dialogue = "dialogue",
    EventTeleportSequence = "event-teleport-sequence",
    Explosion = "explosion",
    Gubby = "gubby",
    Sticker = "sticker",
    TowerRain = "tower-rain",
}
local u1 = {}
for i, j in v1 do
    u1[j] = true
end
local v2 = table.clone(v1)

function v2.isKnown(a1) -- Line: 21 -- upvalues: u1 (val)
    local v1 = false
    if type(a1) == "string" then
        v1 = u1[a1] == true
    end
    return v1
end

function v2.list() -- Line: 25 -- upvalues: u1 (val)
    local v1 = {}
    for i in u1 do
        table.insert(v1, i)
    end
    table.sort(v1)
    return v1
end

return (table.freeze(v2))
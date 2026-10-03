-- Script path: ReplicatedStorage.Shared.Modules.SoundPool
-- Decompile time: 1.17 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local u10 = {}
u10.__index = u10

function u10.new(a1) -- Line: 28 -- upvalues: EasySound (val), u10 (val) -- types: a1: table
    local v1
    local v2 = a1.size or 4
    local v3 = table.create(v2)
    local v4 = a1
    for i = 1, v2 do
        v1 = EasySound.Create({
            name = "SoundPoolPlayer",
            looped = false,
            destroyOnEnd = false,
            playbackSpeed = 1,
            id = v4.id,
            parent = v4.parent,
            volume = v4.volume,
            audioGroup = v4.audioGroup or "Towers",
            timeScaled = v4.timeScaled ~= false,
        })
        v1.Looping = false
        v3[i] = v1
    end
    return (setmetatable({_playIndex = 1, _players = v3}, u10))
end

function u10.play(a1, a2) -- Line: 54 -- types: a1: table, a2: table?
    local v1 = a1._players[a1._playIndex]
    a1._playIndex = a1._playIndex + 1
    local _playIndex = a1._playIndex
    if #a1._players < _playIndex then
        a1._playIndex = 1
    end
    if a2 then
        if a2.playbackSpeed then
            v1:SetAttribute("PlaybackSpeed", a2.playbackSpeed)
        end
        if a2.volume then
            v1.Volume = a2.volume
        end
    end
    v1.TimePosition = 0
    v1:Play()
    return v1
end

function u10.destroy(a1) -- Line: 73 -- upvalues: EasySound (val)
    for i, j in a1._players do
        if j and j.Parent then
            EasySound.Destroy(j)
        end
    end
    a1._players = {}
end

return u10
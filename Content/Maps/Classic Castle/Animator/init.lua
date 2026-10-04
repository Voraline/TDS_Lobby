-- Script path: ReplicatedStorage.Content.Maps.Classic Castle.Animator
-- Decompile time: 2.43 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Network = require(ReplicatedStorage.Shared.Modules.Network)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local Map = Network.Channel("Map")
local u23 = {}

local function runEvent(a1, ...) -- Line: 15 -- upvalues: u23 (val)
    local v1 = u23[a1]
    if v1 then
        v1:start(...)
    end
end

local function cancelEvents() -- Line: 22 -- upvalues: u23 (val)
    for i, j in u23 do
        j:rewind()
    end
end

local u26 = {}
local v1 = {
    wave = 2,
    run = function() -- Line: 31 -- upvalues: runEvent (val)
        runEvent("Explosion")
        runEvent("SpreadCorruption", 5)
    end,
}
local v2 = {
    wave = 3,
    run = function() -- Line: 38 -- upvalues: runEvent (val)
        runEvent("SpreadCorruption", 15)
    end,
}
local v3 = {
    wave = 4,
    run = function() -- Line: 44 -- upvalues: runEvent (val)
        runEvent("Explosion")
        runEvent("SpreadCorruption", 25)
    end,
}
local v4 = {
    wave = 5,
    run = function() -- Line: 51 -- upvalues: runEvent (val)
        runEvent("Explosion")
        runEvent("SpreadCorruption", 35)
    end,
}
local v5 = {
    wave = 6,
    run = function() -- Line: 58 -- upvalues: runEvent (val)
        runEvent("Explosion")
        runEvent("SpreadCorruption", 50)
        runEvent("Rain")
    end,
}
local v6 = {
    wave = 7,
    run = function() -- Line: 66 -- upvalues: runEvent (val)
        runEvent("BeamSworm")
        runEvent("Explosion")
        runEvent("SpreadCorruption", 80)
        runEvent("ThunderStorm")
    end,
}
local v7 = {
    wave = 8,
    run = function() -- Line: 75 -- upvalues: runEvent (val)
        runEvent("SphereGlobe")
        runEvent("SpreadCorruption", 90)
        runEvent("Time")
    end,
}
local v8 = {
    wave = 9,
    run = function() -- Line: 83 -- upvalues: runEvent (val), TimescaleUtilities (val)
        runEvent("Explosion")
        TimescaleUtilities.Wait(1)
        runEvent("Explosion")
        TimescaleUtilities.Wait(1)
        runEvent("SpreadCorruption", 110)
    end,
}
local v9 = {
    wave = 10,
    run = function() -- Line: 93 -- upvalues: runEvent (val), TimescaleUtilities (val)
        for i = 1, 5 do
            runEvent("Explosion")
            TimescaleUtilities.Wait(0.03)
        end
        runEvent("SpreadCorruption", 200)
    end,
}
u26[1] = v1
u26[2] = v2
u26[3] = v3
u26[4] = v4
u26[5] = v5
u26[6] = v6
u26[7] = v7
u26[8] = v8
u26[9] = v9

local function onWaveChange(a1, a2) -- Line: 103 -- upvalues: u26 (val)
    for i, j in u26 do
        if a1 == j.wave then
            task.spawn(j.run)
            if not a2 then
                break
            end
        end
    end
end

return function(a1, a2) -- Line: 114
    -- upvalues: u23 (val), Map (val), onWaveChange (val), cancelEvents (val), GameState (val), u26 (val)
    local v1
    local v2, v3 = a2, a1
    for i, j in script.Events:GetChildren() do
        v1 = require(j)
        v1.map = v3
        v1.maid = v2
        if v1.init then
            v1:init()
        end
        u23[j.Name] = v1
    end
    v2:Mark((Map:On("TransitionScene", onWaveChange)))
    v2:Mark((Map:On("ResetMap", cancelEvents)))
    v2:Mark((Map:On("DestroyMap", function() -- Line: 126 -- upvalues: u23 (upval), onWaveChange (upval)
        u23.SpreadCorruption:corruptEverything()
        onWaveChange(10)
        u23.SpreadCorruption.started = false
    end)))
    local Wave = GameState.Wave
    if Wave and Wave > 0 then
        for k = 1, Wave do
            for n, m in u26 do
                if k == m.wave then
                    task.spawn(m.run)
                end
            end
        end
    end
end
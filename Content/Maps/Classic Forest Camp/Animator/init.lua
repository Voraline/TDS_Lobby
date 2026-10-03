-- Script path: ReplicatedStorage.Content.Maps.Classic Forest Camp.Animator
-- Decompile time: 2.25 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Map = require(ReplicatedStorage.Shared.Modules.Network).Channel("Map")
local u18 = {}

local function runEvent(a1, ...) -- Line: 13 -- upvalues: u18 (val)
    local v1 = u18[a1]
    if v1 then
        v1:start(...)
    end
end

local function cancelEvents() -- Line: 20 -- upvalues: u18 (val)
    for i, j in u18 do
        j:rewind()
    end
end

local u21 = {}
local v1 = {
    wave = 2,
    run = function() -- Line: 29 -- upvalues: runEvent (val)
        runEvent("SpreadCorruption", 5)
    end,
}
local v2 = {
    wave = 3,
    run = function() -- Line: 35 -- upvalues: runEvent (val)
        runEvent("SpreadCorruption", 15)
    end,
}
local v3 = {
    wave = 4,
    run = function() -- Line: 41 -- upvalues: runEvent (val)
        runEvent("SpreadCorruption", 25)
    end,
}
local v4 = {
    wave = 5,
    run = function() -- Line: 47 -- upvalues: runEvent (val)
        runEvent("SpreadCorruption", 35)
    end,
}
local v5 = {
    wave = 6,
    run = function() -- Line: 53 -- upvalues: runEvent (val)
        runEvent("SpreadCorruption", 50)
    end,
}
local v6 = {
    wave = 7,
    run = function() -- Line: 59 -- upvalues: runEvent (val)
        runEvent("SpreadCorruption", 80)
        runEvent("ThunderStorm")
    end,
}
local v7 = {
    wave = 8,
    run = function() -- Line: 66 -- upvalues: runEvent (val)
        runEvent("SpreadCorruption", 90)
        runEvent("Time")
    end,
}
local v8 = {
    wave = 9,
    run = function() -- Line: 73 -- upvalues: runEvent (val)
        runEvent("SpreadCorruption", 110)
    end,
}
local v9 = {
    wave = 10,
    run = function() -- Line: 79 -- upvalues: runEvent (val)
        runEvent("SpreadCorruption", 200)
    end,
}
u21[1] = v1
u21[2] = v2
u21[3] = v3
u21[4] = v4
u21[5] = v5
u21[6] = v6
u21[7] = v7
u21[8] = v8
u21[9] = v9

local function onWaveChange(a1, a2) -- Line: 85 -- upvalues: u21 (val)
    for i, j in u21 do
        if a1 == j.wave then
            task.spawn(j.run)
            if not a2 then
                break
            end
        end
    end
end

return function(a1, a2) -- Line: 96 -- upvalues: u18 (val), Map (val), onWaveChange (val), GameState (val), u21 (val)
    local v1
    local v2, v3 = a2, a1
    for i, j in script.Events:GetChildren() do
        v1 = require(j)
        v1.map = v3
        v1.maid = v2
        if v1.init then
            v1:init()
        end
        u18[j.Name] = v1
    end
    v2:Mark((Map:On("TransitionScene", onWaveChange)))
    v2:Mark((Map:On("DestroyMap", function() -- Line: 107 -- upvalues: u18 (upval), onWaveChange (upval)
        u18.SpreadCorruption:corruptEverything()
        onWaveChange(10)
        u18.SpreadCorruption.started = false
    end)))
    local Wave = GameState.Wave
    if Wave and Wave > 0 then
        for k = 1, Wave do
            for n, m in u21 do
                if k == m.wave then
                    task.spawn(m.run)
                end
            end
        end
    end
end
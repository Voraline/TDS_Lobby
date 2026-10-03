-- Script path: ReplicatedStorage.Content.Maps.Huevous Hunt.Animator
-- Decompile time: 4.23 ms

game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("RunService")
game:GetService("TweenService")
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Map = require(ReplicatedStorage.Shared.Modules.Network).Channel("Map")
local u33 = nil
local u34 = {}

local function runEvent(a1, ...) -- Line: 13 -- upvalues: u34 (val)
    local v1 = u34[a1]
    if v1 then
        v1:start(...)
    end
end

local function cancelEvents() -- Line: 20 -- upvalues: u34 (val)
    for i, j in u34 do
        j:rewind()
    end
end

local u38 = {}
u38.Easy = {
    {
        wave = 2,
        run = function() -- Line: 30 -- upvalues: runEvent (val)
            runEvent("TreeCorruption", 1)
            runEvent("SpreadCorruption", 5)
        end,
    },
    {
        wave = 3,
        run = function() -- Line: 37 -- upvalues: runEvent (val)
            runEvent("TreeCorruption", 3)
            runEvent("SpreadCorruption", 15)
        end,
    },
    {
        wave = 4,
        run = function() -- Line: 44 -- upvalues: runEvent (val)
            runEvent("TreeCorruption", 2)
            runEvent("SpreadCorruption", 25)
        end,
    },
    {
        wave = 5,
        run = function() -- Line: 51 -- upvalues: runEvent (val)
            runEvent("BeamSworm")
            runEvent("SpreadCorruption", 35)
            runEvent("TreeCorruption", 2)
        end,
    },
    {
        wave = 6,
        run = function() -- Line: 59 -- upvalues: runEvent (val)
            runEvent("TreeCorruption", 2)
            runEvent("SpreadCorruption", 50)
        end,
    },
    {
        wave = 7,
        run = function() -- Line: 66 -- upvalues: runEvent (val)
            runEvent("TreeCorruption", 2)
            runEvent("SpreadCorruption", 80)
        end,
    },
    {
        wave = 8,
        run = function() -- Line: 73 -- upvalues: runEvent (val)
            runEvent("TreeCorruption", 2)
            runEvent("SpreadCorruption", 90)
            runEvent("Time")
        end,
    },
    {
        wave = 9,
        run = function() -- Line: 81 -- upvalues: runEvent (val), u34 (val), u33 (ref)
            runEvent("TreeCorruption", 2)
            runEvent("SpreadCorruption", 110)
            u34.SpreadCorruption:spinModel(u33.Car)
            runEvent("SphereGlobe")
        end,
    },
    {
        wave = 10,
        run = function() -- Line: 90 -- upvalues: u34 (val), u33 (ref), runEvent (val)
            u34.SpreadCorruption:spinModel(u33.Environment.BridgeMain)
            u34.SpreadCorruption:spinModel(u33.Environment.LightHouse)
            u34.SpreadCorruption:corruptModel(u33.House)
            runEvent("HouseCorruption")
            runEvent("TreeCorruption", #u33.Trees:GetChildren())
            runEvent("SpreadCorruption", 200)
            runEvent("ThunderStorm")
        end,
    },
}
u38.Hard = {
    {
        wave = 2,
        run = function() -- Line: 104 -- upvalues: runEvent (val)
            runEvent("TreeCorruption", 1)
            runEvent("SpreadCorruption", 5)
        end,
    },
    {
        wave = 3,
        run = function() -- Line: 111 -- upvalues: runEvent (val)
            runEvent("TreeCorruption", 3)
            runEvent("SpreadCorruption", 15)
        end,
    },
    {
        wave = 4,
        run = function() -- Line: 118 -- upvalues: runEvent (val)
            runEvent("TreeCorruption", 2)
            runEvent("SpreadCorruption", 20)
        end,
    },
    {
        wave = 5,
        run = function() -- Line: 125 -- upvalues: runEvent (val)
            runEvent("BeamSworm")
            runEvent("SpreadCorruption", 35)
            runEvent("TreeCorruption", 2)
        end,
    },
    {
        wave = 6,
        run = function() -- Line: 133 -- upvalues: runEvent (val)
            runEvent("TreeCorruption", 2)
            runEvent("SpreadCorruption", 40)
        end,
    },
    {
        wave = 7,
        run = function() -- Line: 141 -- upvalues: runEvent (val)
            runEvent("TreeCorruption", 1)
            runEvent("SpreadCorruption", 55)
        end,
    },
    {
        wave = 8,
        run = function() -- Line: 148 -- upvalues: runEvent (val)
            runEvent("TreeCorruption", 3)
            runEvent("SpreadCorruption", 62)
        end,
    },
    {
        wave = 9,
        run = function() -- Line: 155 -- upvalues: runEvent (val)
            runEvent("TreeCorruption", 2)
            runEvent("SpreadCorruption", 70)
        end,
    },
    {
        wave = 10,
        run = function() -- Line: 162 -- upvalues: runEvent (val)
            runEvent("BeamSworm")
            runEvent("SpreadCorruption", 78)
            runEvent("TreeCorruption", 2)
        end,
    },
    {
        wave = 11,
        run = function() -- Line: 171 -- upvalues: runEvent (val)
            runEvent("SpreadCorruption", 80)
            runEvent("TreeCorruption", 3)
        end,
    },
    {
        wave = 12,
        run = function() -- Line: 179 -- upvalues: runEvent (val)
            runEvent("TreeCorruption", 2)
            runEvent("SpreadCorruption", 90)
        end,
    },
    {
        wave = 13,
        run = function() -- Line: 186 -- upvalues: runEvent (val)
            runEvent("TreeCorruption", 4)
            runEvent("SpreadCorruption", 98)
            runEvent("Time")
        end,
    },
    {
        wave = 14,
        run = function() -- Line: 194 -- upvalues: runEvent (val), u34 (val), u33 (ref)
            runEvent("TreeCorruption", 2)
            runEvent("SpreadCorruption", 110)
            u34.SpreadCorruption:spinModel(u33.Car)
            runEvent("SphereGlobe")
        end,
    },
    {
        wave = 15,
        run = function() -- Line: 203 -- upvalues: u34 (val), u33 (ref), runEvent (val)
            u34.SpreadCorruption:spinModel(u33.Environment.BridgeMain)
            u34.SpreadCorruption:spinModel(u33.Environment.LightHouse)
            u34.SpreadCorruption:corruptModel(u33.House)
            runEvent("HouseCorruption")
            runEvent("TreeCorruption", #u33.Trees:GetChildren())
            runEvent("SpreadCorruption", 200)
            runEvent("ThunderStorm")
        end,
    },
}

local function onWaveChange(a1, a2) -- Line: 216 -- upvalues: GameState (val), u38 (val)
    for i, j in u38[GameState.Difficulty or "Easy"] do
        if a1 == j.wave then
            task.spawn(j.run)
            if not a2 then
                break
            end
        end
    end
end

return function(a1, a2) -- Line: 229
    -- upvalues: u33 (ref), u34 (val), Map (val), onWaveChange (val), cancelEvents (val), GameState (val)
    -- upvalues: runEvent (val), u38 (val)
    local v1
    u33 = a1
    local v2, v3 = a2, a1
    for i, j in script.Events:GetChildren() do
        v1 = require(j)
        v1.map = v3
        v1.maid = v2
        if v1.init then
            v1:init()
        end
        u34[j.Name] = v1
    end
    v2:Mark((Map:On("TransitionScene", onWaveChange)))
    v2:Mark((Map:On("ResetMap", cancelEvents)))
    v2:Mark((Map:On("DestroyMap", function() -- Line: 243 -- upvalues: GameState (upval), u34 (upval), u33 (upval), runEvent (upval), onWaveChange (upval)
        local v1 = if GameState.Difficulty ~= "Easy" then 15 else 10
        u34.SpreadCorruption:spinModel(u33.Car)
        runEvent("SphereGlobe")
        u34.SpreadCorruption:corruptEverything()
        onWaveChange(v1)
        u34.SpreadCorruption.started = false
    end)))
    local Wave = GameState.Wave
    if Wave and Wave > 0 then
        for k = 1, Wave do
            for n, m in u38[GameState.Difficulty or "Easy"] do
                if k == m.wave then
                    task.spawn(m.run)
                end
            end
        end
    end
end
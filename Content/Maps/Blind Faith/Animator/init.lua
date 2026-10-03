-- Script path: ReplicatedStorage.Content.Maps.Blind Faith.Animator
-- Decompile time: 1.69 ms

local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local TagReplicator = require(ReplicatedStorage.Client.Modules.TagReplicator)
local Events = script:WaitForChild("Events")
local u30 = {}
local u31 = nil
local u32 = {}
for i, j in Events:GetChildren() do
    u32[j.Name] = (require(j))
end
TagReplicator.hook("Blind Faith", function(a1, a2) -- Line: 17 -- upvalues: u32 (val), u30 (val), u31 (ref)
    local function update() -- Line: 18 -- upvalues: a2 (val), u32 (upval), u30 (upval), u31 (upval)
        for i, j in a2:WaitForState("States") do
            if not j then
                if u30[i] then
                    u30[i](u31)
                    u30[i] = nil
                end
            elseif not u32[i].run then
                u30[i] = u32[i].cleanup
            elseif not u30[i] then
                u32[i].run(u31)
                u30[i] = u32[i].cleanup
            end
        end
    end

    ;(a2:GetStateChangedSignal("States")):Connect(update)
    task.defer(update)
end)
return function(a1, a2) -- Line: 42
    -- upvalues: u30 (val), u32 (val), RunService (val), GameState (val), Lighting (val), u31 (ref)
    for i, j in u30 do
        j(a1, a2)
    end
    for k, n in u32 do
        n.init(a1, a2)
    end
    a2:Mark((RunService.Heartbeat:Connect(function(a1) -- Line: 51 -- upvalues: GameState (upval), Lighting (upval)
        local v1 = a1 * GameState.TimeScale
        if Lighting:FindFirstChild("Sky") then
            local Sky = Lighting:WaitForChild("Sky")
            Sky.SkyboxOrientation = Sky.SkyboxOrientation + Vector3.new(0, v1 * 5, 0)
        end
    end)))
    a2:Mark(((GameState.Replicator:GetStateChangedSignal("Wave")):Connect(function() -- Line: 58 -- upvalues: GameState (upval), u32 (upval), a1 (val)
        local v1 = GameState.Replicator:Get("Wave") or 0
        local v2 = nil
        local v3 = nil
        for i, j in u32, v2, v3 do
            if j.onWave then
                j.onWave(a1, v1)
            end
            if j.waves and j.waves[v1] then
                j.waves[v1](a1)
            end
        end
    end)))
    u31 = a1
end
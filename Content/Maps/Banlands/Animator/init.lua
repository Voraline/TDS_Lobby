-- Script path: ReplicatedStorage.Content.Maps.Banlands.Animator
-- Decompile time: 2.24 ms

game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("RunService")
require(script.BlockArea)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local TagReplicator = require(ReplicatedStorage.Client.Modules.TagReplicator)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local Events = script:WaitForChild("Events")
local u49 = {}
local u50 = nil
local u51 = {}
TagReplicator.hook("Banlands", function(a1, a2) -- Line: 18 -- upvalues: u51 (val), u49 (val), u50 (ref)
    local function update() -- Line: 19 -- upvalues: a2 (val), u51 (upval), u49 (upval), u50 (upval)
        for i, j in a2:WaitForState("States") do
            if not j then
                if u49[i] then
                    u49[i](u50)
                    u49[i] = nil
                end
            elseif not u51[i].run then
                u49[i] = u51[i].cleanup
            elseif not u49[i] then
                u51[i].run(u50)
                u49[i] = u51[i].cleanup
            end
        end
    end

    ;(a2:GetStateChangedSignal("States")):Connect(update)
    task.defer(update)
end)
return function(a1, a2) -- Line: 43
    -- upvalues: u49 (val), Events (val), u51 (val), GameState (val), EmitterManager (val), TimescaleUtilities (val)
    -- upvalues: TweenService (val), u50 (ref)
    for i, j in u49 do
        j(a1)
    end
    for k, n in Events:GetChildren() do
        u51[n.Name] = (require(n))
        u51[n.Name].init(a1)
    end
    local u25 = false
    a2:Mark(((GameState.Replicator:GetStateChangedSignal("GameStarted")):Connect(function() -- Line: 55
        -- upvalues: u25 (ref), a1 (val), EmitterManager (upval), TimescaleUtilities (upval), TweenService (upval)
        if u25 then
            return
        end
        u25 = true
        for i, j in a1.Environment.Rifts:GetChildren() do
            j.Active.Open:Play()
            EmitterManager.manualEmit(j.Active)
            TimescaleUtilities.Delay(0.57, function() -- Line: 66 -- upvalues: j (val), TweenService (upval)
                local Brightness, v1, v2
                j.Active.Loop:Play()
                for i, j2 in j.PortalActive:GetDescendants() do
                    if j2:IsA("ParticleEmitter") then
                        j2.Enabled = true
                    end
                    if j2:IsA("Light") then
                        Brightness = j2.Brightness
                        j2.Brightness = 0
                        j2.Enabled = true
                        v1 = TweenService
                        v2 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
                        v1:Create(j2, v2, {Brightness = Brightness}):Play()
                    end
                end
            end)
            TimescaleUtilities.Wait(0.3)
        end
    end)))
    a2:Mark(((GameState.Replicator:GetStateChangedSignal("Wave")):Connect(function() -- Line: 90 -- upvalues: GameState (upval), u51 (upval), a1 (val)
        local v1 = GameState.Replicator:Get("Wave") or 0
        local v2 = nil
        local v3 = nil
        for i, j in u51, v2, v3 do
            if j.onWave then
                j.onWave(a1, v1)
            end
            if j.waves and j.waves[v1] then
                j.waves[v1](a1)
            end
        end
    end)))
    u50 = a1
end
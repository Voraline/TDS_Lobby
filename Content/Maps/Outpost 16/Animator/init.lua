-- Script path: ReplicatedStorage.Content.Maps.Outpost 16.Animator
-- Decompile time: 3.10 ms

local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("TweenService")
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local TagReplicator = require(ReplicatedStorage.Client.Modules.TagReplicator)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local Events = script:WaitForChild("Events")
local u45 = {}
local u46 = nil
local u47 = {}
TagReplicator.hook("Outpost16", function(a1, a2) -- Line: 17 -- upvalues: u47 (val), u45 (val), u46 (ref)
    local function update() -- Line: 18 -- upvalues: a2 (val), u47 (upval), u45 (upval), u46 (upval)
        for i, j in a2:WaitForState("States") do
            if not j then
                if u45[i] then
                    u45[i](u46)
                    u45[i] = nil
                end
            elseif not u47[i].run then
                u45[i] = u47[i].cleanup
            elseif not u45[i] then
                u47[i].run(u46)
                u45[i] = u47[i].cleanup
            end
        end
    end

    task.defer(function() -- Line: 38 -- upvalues: update (val)
        update()
    end)
    ;(a2:GetStateChangedSignal("States")):Connect(update)
end)
return function(a1, a2) -- Line: 44
    -- upvalues: u45 (val), Events (val), u47 (val), GameState (val), Lighting (val), EmitterManager (val)
    -- upvalues: TimescaleUtilities (val), TweenService (val), u46 (ref)
    for i, j in u45 do
        j(a1)
    end
    for k, n in Events:GetChildren() do
        u47[n.Name] = (require(n))
        u47[n.Name].init(a1)
    end
    local u25 = false
    local GodCubeCycle = a1.Environment:WaitForChild("GodCubeCycle")
    local u42 = (GodCubeCycle:WaitForChild("AnimationController")):LoadAnimation((GodCubeCycle:WaitForChild("Animation")))
    local IdleVFX = GodCubeCycle:WaitForChild("IdleVFX")
    local VFX = GodCubeCycle:WaitForChild("VFX")
    IdleVFX.Parent = nil
    VFX.Parent = nil

    local function update() -- Line: 66
        -- upvalues: u25 (ref), GameState (upval), Lighting (upval), GodCubeCycle (val), a1 (val), u42 (val)
        -- upvalues: IdleVFX (val), VFX (val), EmitterManager (upval), TimescaleUtilities (upval), TweenService (upval)
        if u25 then
            return
        end
        local v1 = GameState.Replicator:Get("CutScenePlayed") or {}
        if not v1.NullNight1Cutscene1 then
            return
        end
        Lighting.ClockTime = 18.1
        GodCubeCycle.Parent = a1.Environment
        u25 = true
        u42:Play(0)
        IdleVFX.Parent = GodCubeCycle
        VFX.Parent = GodCubeCycle
        for i, j in a1.Environment.Rifts:GetChildren() do
            EmitterManager.manualEmit(j.Rift.Active)
            TimescaleUtilities.Delay(0.57, function() -- Line: 88 -- upvalues: TweenService (upval), j (val)
                local Brightness, v1, v2
                TweenService:Create(j.Path.SurfaceGui.ImageLabel, TweenInfo.new(1), {ImageTransparency = 0}):Play()
                for i, j2 in j.Rift.PortalActive:GetDescendants() do
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
    end

    a2:Mark(((GameState.Replicator:GetStateChangedSignal("GameStarted")):Connect(update)))
    a2:Mark(((GameState.Replicator:GetStateChangedSignal("CutScenePlayed")):Connect(update)))
    a2:Mark(((GameState.Replicator:GetStateChangedSignal("Wave")):Connect(function() -- Line: 119 -- upvalues: GameState (upval), u47 (upval), a1 (val)
        local v1 = GameState.Replicator:Get("Wave") or 0
        for i, j in u47 do
            if j.waves and j.waves[v1] then
                j.waves[v1](a1)
            end
        end
    end)))
    u46 = a1
end
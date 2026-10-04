-- Script path: ReplicatedStorage.Content.NewEnemies.Gravestone.Animator
-- Decompile time: 0.78 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 10 -- upvalues: TimescaleUtilities (val), TweenService (val), EmitterManager (val)
    local CFrame = a1.Model.PrimaryPart.CFrame
    a1.Model:PivotTo(CFrame - Vector3.new(0, 10, 0))
    local v1 = TimescaleUtilities.GetScaledTime(2)
    local u18 = a1.Model.PrimaryPart:Clone()
    a1.Maid:Mark(((u18:GetPropertyChangedSignal("CFrame")):Connect(function() -- Line: 15 -- upvalues: a1 (val), u18 (val)
        a1.Model:PivotTo(u18.CFrame)
    end)))
    TweenService:Create(u18, TweenInfo.new(v1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {CFrame = CFrame}):Play()
    EmitterManager.toggle(a1.Model, true)
    TimescaleUtilities.Wait(v1)
    u18:Destroy()
    EmitterManager.toggle(a1.Model, false)
end

return v1
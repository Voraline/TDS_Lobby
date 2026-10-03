-- Script path: ReplicatedStorage.Content.Maps.Classic Island Chaos.Animator.Events.Rain
-- Decompile time: 0.89 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local u20 = {}

function u20.start(a1) -- Line: 10 -- upvalues: u20 (val), TweenService (val), RunService (val), GameState (val)
    u20.map.Rain.Effect.Enabled = true
    TweenService:Create(u20.map.Cloud, TweenInfo.new(5), {Transparency = 0}):Play()
    u20._connection = RunService.Heartbeat:Connect(function(a1) -- Line: 17 -- upvalues: GameState (upval), u20 (upval)
        local v1 = a1 * GameState.TimeScale
        local Cloud = u20.map.Cloud
        Cloud.CFrame = Cloud.CFrame * CFrame.Angles(0, math.rad(40 * v1), 0)
    end)
end

function u20.rewind(a1) -- Line: 23 -- upvalues: u20 (val), TweenService (val)
    u20.map.Rain.Effect.Enabled = false
    u20._connection:Disconnect()
    TweenService:Create(u20.map.Cloud, TweenInfo.new(2), {Transparency = 1}):Play()
end

return u20
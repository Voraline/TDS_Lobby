-- Script path: ReplicatedStorage.Content.NewEnemies.Void Portal.Animator
-- Decompile time: 0.93 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local spr = require(ReplicatedStorage.Shared.Modules.spr)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 10 -- upvalues: Create (val), spr (val), RunService (val)
    local u6 = Create("Sound", {
        Name = "SummonPortal",
        SoundId = "rbxassetid://126646478103778",
        Volume = 0.75,
        Parent = a1.Model.PrimaryPart,
    })
    local u7 = {value = 0.001}
    a1:Delay(0.2, function() -- Line: 22 -- upvalues: u6 (val), spr (upval), u7 (val)
        u6:Play()
        spr.target(u7, 0.2, 1, {value = 1})
    end)
    a1.Maid:Mark((RunService.Heartbeat:Connect(function() -- Line: 29 -- upvalues: a1 (val), u7 (val)
        a1.Model:ScaleTo(u7.value)
    end)))
    local Scalar = a1.Path:GetScalar(a1.PathDistance + 1)
    a1.Model.PrimaryPart.CFrame = CFrame.new(a1.Model.PrimaryPart.Position, Scalar * Vector3.new(1, 0, 1) + Vector3.new(0, 1, 0) * a1.Model.PrimaryPart.Position.Y)
    a1.Executables = {}
end

return v1
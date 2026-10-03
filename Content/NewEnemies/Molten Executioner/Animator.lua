-- Script path: ReplicatedStorage.Content.NewEnemies.Molten Executioner.Animator
-- Decompile time: 0.86 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 10 -- upvalues: Animation (val), GameState (val), EffectsController (val)
    local u10 = Animation.new({
        IgnorePriority = true,
        IsPersistent = true,
        Preload = true,
        Track = a1.Model.Animations.Attack,
        Target = a1.Model.AnimationController.Animator,
    })
    a1.Executables = {
        Swing = function(a1_2) -- Line: 20 -- upvalues: a1 (val), u10 (val), GameState (upval), EffectsController (upval)
            local Position = a1.Model.HumanoidRootPart.Position
            local v1 = CFrame.new(Position, (Vector3.new(a1_2.X, Position.Y, a1_2.Z)))
            a1.Model.HumanoidRootPart.CFrame = v1
            a1.Rotation = CFrame.new() * v1.Rotation
            u10:Play(0)
            a1:Wait(0.6)
            local Impact = a1.Model.HumanoidRootPart:FindFirstChild("Impact")
            if Impact then
                Impact.PlaybackSpeed = GameState.TimeScale
                Impact:Play()
            end
            EffectsController.GroundSmash(CFrame.new(a1_2), 20)
        end,
    }
end

return v1
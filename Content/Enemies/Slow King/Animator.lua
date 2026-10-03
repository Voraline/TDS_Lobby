-- Script path: ReplicatedStorage.Content.Enemies.Slow King.Animator
-- Decompile time: 0.61 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 10 -- upvalues: TweenService (val), Animation (val)
    a1.Model.HumanoidRootPart.Barrier.MaxVelocity = 0.025
    a1.Executables = {
        Shield = function() -- Line: 14 -- upvalues: TweenService (upval), a1 (val)
            TweenService:Create(
                a1.Model.Barrier,
                TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0),
                {Transparency = 1}
            ):Play()
            game.Debris:AddItem(a1.Model.Barrier, 1)
        end,
        Death = function() -- Line: 23 -- upvalues: Animation (upval), a1 (val)
            Animation.new({
                Track = a1.Model.Animations.Died,
                Target = a1.Model.AnimationController,
            }):Play()
            a1.Model.Head.Dead:Play()
        end,
    }
end

return v1
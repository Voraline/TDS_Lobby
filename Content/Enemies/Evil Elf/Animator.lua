-- Script path: ReplicatedStorage.Content.Enemies.Evil Elf.Animator
-- Decompile time: 0.82 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local v1 = {}
v1.__index = v1
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
require(ReplicatedStorage.Client.Controllers.Game.EffectsController)

function v1.Initialize(a1) -- Line: 13 -- upvalues: Animation (val), TweenService (val)
    function a1.Face(a1_2) -- Line: 16 -- upvalues: a1 (val)
        local HumanoidRootPart = a1.Model.HumanoidRootPart
        return CFrame.new(HumanoidRootPart.CFrame.Position, (Vector3.new(a1_2.X, HumanoidRootPart.Position.Y, a1_2.Z)))
    end

    a1.Executables = {
        Stab = function(a1_2) -- Line: 26 -- upvalues: Animation (upval), a1 (val), TweenService (upval)
            Animation.new({
                Track = a1.Model.Animations.Attack,
                Target = a1.Model.AnimationController,
            }):Play()
            local v1 = a1.Face(a1_2)
            TweenService:Create(
                a1.Model.HumanoidRootPart,
                TweenInfo.new(0.7, Enum.EasingStyle.Cubic, Enum.EasingDirection.In, 0, false, 0),
                {CFrame = v1}
            ):Play()
            a1:Delay(0.7)
            a1.Model.Head.Slash:Play()
        end,
    }
end

return v1
-- Script path: ReplicatedStorage.Content.NewEnemies.Knight Plush.Animator
-- Decompile time: 1.17 ms

game:GetService("ReplicatedStorage")
game:GetService("TweenService")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage_2.Shared.Modules.Animation)
local TweenService = require(ReplicatedStorage_2.Client.Modules.TweenService)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 15 -- upvalues: Animation (val), TweenService (val)
    a1.Name = "Knight"

    function a1.Face(a1_2) -- Line: 20 -- upvalues: a1 (val)
        local HumanoidRootPart = a1.Model.HumanoidRootPart
        return CFrame.new(HumanoidRootPart.CFrame.Position, (Vector3.new(a1_2.X, HumanoidRootPart.Position.Y, a1_2.Z)))
    end

    a1.Executables = {
        Attack = function(a1_2) -- Line: 29 -- upvalues: Animation (upval), a1 (val), TweenService (upval)
            Animation.new({
                Track = a1.Model.Animations.Attack,
                Target = a1.Model.AnimationController,
            }):Play()
            local v1 = a1.Face(a1_2)
            TweenService:Create(a1.Model.HumanoidRootPart, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {CFrame = v1}):Play()
            a1:Delay(1)
            a1.Model.Head.Swing:Play()
        end,
    }
end

return v1
-- Script path: ReplicatedStorage.Content.Enemies.Fallen Guardian.Animator
-- Decompile time: 0.68 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("TweenService")
local v1 = {}
v1.__index = v1
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)

function v1.Initialize(a1) -- Line: 12 -- upvalues: Animation (val)
    function a1.Face(a1_2) -- Line: 13 -- upvalues: a1 (val)
        local HumanoidRootPart = a1.Model.HumanoidRootPart
        HumanoidRootPart.CFrame = CFrame.new(HumanoidRootPart.CFrame.Position, (Vector3.new(a1_2.X, HumanoidRootPart.Position.Y, a1_2.Z)))
    end

    a1.Executables = {
        Stab = function(a1_2) -- Line: 22 -- upvalues: a1 (val), Animation (upval)
            a1.Face(a1_2)
            Animation.new({
                Track = a1.Model.Animations.Swing,
                Target = a1.Model.AnimationController,
            }):Play()
            a1.Model.Head.Slash:Play()
        end,
        Death = function() -- Line: 32 -- upvalues: Animation (upval), a1 (val)
            Animation.new({
                Track = a1.Model.Animations.Died,
                Target = a1.Model.AnimationController,
            }):Play()
        end,
    }
end

return v1
-- Script path: ReplicatedStorage.Content.Enemies.Buried.Animator
-- Decompile time: 0.53 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("TweenService")
local v1 = {}
v1.__index = v1
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)

function v1.Initialize(a1) -- Line: 12 -- upvalues: Animation (val)
    a1.Executables = {
        Fall = function(a1_2) -- Line: 14 -- upvalues: Animation (upval), a1 (val)
            Animation.new({
                Track = a1.Model.Animations.Fall,
                Target = a1.Model.AnimationController,
            }):Play()
            a1.Model.Head.Fall:Play()
        end,
        Rise = function(a1_2) -- Line: 22 -- upvalues: Animation (upval), a1 (val)
            Animation.new({
                Track = a1.Model.Animations.Rise,
                Target = a1.Model.AnimationController,
            }):Play()
            a1.Model.HumanoidRootPart.Node.Dirt.Enabled = true
            a1:Delay(0.65)
            a1.Model.HumanoidRootPart.Node.Dirt.Enabled = false
        end,
    }
end

return v1
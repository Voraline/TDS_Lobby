-- Script path: ReplicatedStorage.Content.Enemies.Headless Jaxe.Animator
-- Decompile time: 0.61 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("TweenService")
local v1 = {}
v1.__index = v1
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)

function v1.Initialize(a1) -- Line: 12 -- upvalues: Animation (val)
    a1.Executables = {
        Throw = function() -- Line: 14 -- upvalues: a1 (val)
            a1.Model:WaitForChild("Handle")
            a1.Model:WaitForChild("Head").Laugh:Play()
        end,
        Death = function() -- Line: 21 -- upvalues: Animation (upval), a1 (val)
            Animation.new({
                Track = a1.Model.Animations.Died,
                Target = a1.Model.AnimationController,
            }):Play()
            a1.Model.Head.Died:Play()
            a1.Model.Head.Flame.Fire.Enabled = false
        end,
    }
end

return v1
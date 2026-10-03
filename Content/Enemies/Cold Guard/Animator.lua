-- Script path: ReplicatedStorage.Content.Enemies.Cold Guard.Animator
-- Decompile time: 0.90 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = {}
v1.__index = v1
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)

function v1.Initialize(a1) -- Line: 11 -- upvalues: Animation (val)
    a1.Executables = {
        Stab = function() -- Line: 13 -- upvalues: Animation (upval), a1 (val)
            Animation.new({
                Track = a1.Model.Animations.Swing,
                Target = a1.Model.AnimationController,
            }):Play()
            a1:Delay(0.35)
            a1.Model.Sword.Trail.Enabled = true
            a1.Model.Head.Slash:Play()
            a1:Delay(0.3)
            a1.Model.Sword.Trail.Enabled = false
        end,
        Death = function() -- Line: 25 -- upvalues: Animation (upval), a1 (val)
            Animation.new({
                Track = a1.Model.Animations.Death,
                Target = a1.Model.AnimationController,
            }):Play()
            a1.Model.Head.Rattle:Play()
        end,
    }
end

return v1
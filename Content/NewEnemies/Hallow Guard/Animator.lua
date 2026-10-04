-- Script path: ReplicatedStorage.Content.NewEnemies.Hallow Guard.Animator
-- Decompile time: 0.40 ms

game:GetService("ReplicatedStorage")
game:GetService("TweenService")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage_2.Shared.Modules.Animation)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 14 -- upvalues: Animation (val)
    a1.Executables = {
        Death = function() -- Line: 16 -- upvalues: Animation (upval), a1 (val)
            Animation.new({
                Track = a1.Model.Animations.Death,
                Target = a1.Model.AnimationController,
            }):Play()
        end,
    }
end

return v1
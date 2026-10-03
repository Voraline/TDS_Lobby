-- Script path: ReplicatedStorage.Content.Enemies.Gold Guard.Animator
-- Decompile time: 0.49 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 10 -- upvalues: Animation (val)
    a1.Executables = {
        Stab = function() -- Line: 12 -- upvalues: Animation (upval), a1 (val)
            Animation.new({
                Track = a1.Model.Animations.Swing,
                Target = a1.Model.AnimationController,
            }):Play()
            a1.Model.Head.Slash:Play()
        end,
        Death = function() -- Line: 20 -- upvalues: Animation (upval), a1 (val)
            Animation.new({
                Track = a1.Model.Animations.Died,
                Target = a1.Model.AnimationController,
            }):Play()
        end,
    }
end

return v1
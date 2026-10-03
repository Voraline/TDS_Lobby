-- Script path: ReplicatedStorage.Content.Unit.Elf.Animator
-- Decompile time: 0.44 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 8 -- upvalues: Animation (val)
    Animation.new({
        IsPersistent = true,
        Track = a1.Model.Animations.Walk,
        Target = a1.Model.AnimationController,
    }):Play()
    a1.Executables = {
        Death = function(a1_2) -- Line: 16 -- upvalues: Animation (upval), a1 (val)
            Animation.new({
                Track = a1.Model.Animations.Death,
                Target = a1.Model.AnimationController,
            }):Play()
        end,
    }
end

return v1
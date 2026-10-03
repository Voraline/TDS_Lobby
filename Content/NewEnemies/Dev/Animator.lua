-- Script path: ReplicatedStorage.Content.NewEnemies.Dev.Animator
-- Decompile time: 0.30 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 6 -- upvalues: Animation (val)
    Animation.new({
        Track = a1.Model.Animations.Walk,
        Target = a1.Model.AnimationController,
    }):Play()
end

return v1
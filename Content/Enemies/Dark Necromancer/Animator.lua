-- Script path: ReplicatedStorage.Content.Enemies.Dark Necromancer.Animator
-- Decompile time: 0.48 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = {}
v1.__index = v1
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)

function v1.Initialize(a1) -- Line: 11 -- upvalues: Animation (val)
    a1.Executables = {
        Attack = function(a1_2, a2) -- Line: 13 -- upvalues: a1 (val), Animation (upval)
            a1.Model.Head.Summon:Play()
            Animation.new({
                Track = a1.Model.Animations.SpawnTroop,
                Target = a1.Model.AnimationController,
            }):Play()
        end,
    }
end

return v1
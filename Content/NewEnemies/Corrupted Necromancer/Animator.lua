-- Script path: ReplicatedStorage.Content.NewEnemies.Corrupted Necromancer.Animator
-- Decompile time: 1.30 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 8 -- upvalues: Animation (val)
    local Animator = a1.Model.AnimationController.Animator
    a1._animations = {}
    for i, j in a1.Model.Animations:GetChildren() do
        a1._animations[j.Name] = (Animation.new({
            IgnorePriority = true,
            IsPersistent = true,
            Preload = true,
            Track = j,
            Target = Animator,
        }))
    end
    a1.Executables = {
        Walk = function() -- Line: 24 -- upvalues: a1 (val)
            a1._animations.Summon:Stop()
            a1._animations.Projectile:Stop()
            a1._animations.Walk:Play()
        end,
        Projectile = function(a1_2) -- Line: 29 -- upvalues: a1 (val) -- types: a1_2: vector
            if not a1_2 then
                return
            end
            a1._animations.Summon:Stop()
            a1._animations.Walk:Stop()
            a1._animations.Projectile:Play()
            a1:Delay(0.2)
            a1:Face(a1_2, TweenInfo.new(0.25), true)
            a1:Delay(1)
        end,
        SummonGravestones = function() -- Line: 41 -- upvalues: a1 (val)
            a1._animations.Walk:Stop()
            a1._animations.Projectile:Stop()
            local v1 = 0
            for i, j in a1.Stats.Moveset.SummonGravestones.Spawns do
                v1 = v1 + j.count
            end
            for k = 1, v1 do
                a1._animations.Walk:Stop()
                a1._animations.Summon:Play()
                a1:Delay(a1.Stats.Moveset.SummonGravestones.SpawnInterval)
                a1._animations.Summon:Stop()
                a1._animations.Walk:Play()
                a1:Delay(a1.Stats.Moveset.SummonGravestones.SpawnInterval)
            end
            a1:Delay(a1.Stats.Moveset.SummonGravestones.MoveDuration)
        end,
    }
end

return v1
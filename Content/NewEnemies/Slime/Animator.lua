-- Script path: ReplicatedStorage.Content.NewEnemies.Slime.Animator
-- Decompile time: 0.50 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 7 -- upvalues: Animation (val)
    for i, j in a1.Model.HumanoidRootPart.DeathParticle:GetChildren() do
        if j:IsA("ParticleEmitter") then
            j:Emit(7)
        end
    end
    Animation.new({
        IgnorePriority = true,
        IsPersistent = true,
        Track = a1.Model.Animations.Transform,
        Target = a1.Model.AnimationController.Animator,
    }):Play(0)
end

return v1
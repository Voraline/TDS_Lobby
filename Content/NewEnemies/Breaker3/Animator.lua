-- Script path: ReplicatedStorage.Content.NewEnemies.Breaker3.Animator
-- Decompile time: 0.36 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 10 -- upvalues: Animation (val)
    a1.Name = "Breaker"
    local v1 = Animation.new({
        IgnorePriority = true,
        IsPersistent = true,
        Preload = true,
        Track = a1.Model.Animations.Spawn,
        Target = a1.Model.AnimationController.Animator,
    })
    if a1.Replicator:Get("OwnerName") then
        a1.Model.Head.Jump:Play()
        v1:Play(0)
    end
end

return v1
-- Script path: ReplicatedStorage.Content.NewEnemies.Cat.Animator
-- Decompile time: 0.49 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local spr = require(ReplicatedStorage.Shared.Modules.spr)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 9 -- upvalues: Animation (val), spr (val), EmitterManager (val)
    Animation.new({
        Track = a1.Model.Animations.Walk,
        Target = a1.Model.AnimationController,
    }):Play()
    local Size = a1.Model.Head.Size
    a1.Model.Head.Size = Vector3.new()
    spr.target(a1.Model.Head, 0.3, 2, {Size = Size})
    EmitterManager.manualEmit(a1.Model.CatSpawnVFX)
end

return v1
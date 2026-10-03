-- Script path: ReplicatedStorage.Content.Unit.Poison Ducky.Animator
-- Decompile time: 0.78 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local v1 = {}
v1.__index = v1
local u17 = Random.new()

function v1.Initialize(a1) -- Line: 10 -- upvalues: u17 (val), Animation (val), EmitterManager (val)
    local Animations = a1.Model.Animations
    local AnimationController = a1.Model.AnimationController
    local Walk = Animations.Walk
    local v1 = Animation.new({
        Track = (Walk:GetChildren())[u17:NextInteger(1, #(Walk:GetChildren()))],
        Target = AnimationController,
    })
    local u27 = Animation.new({Track = Animations.Death, Target = AnimationController})
    v1:Play()
    a1.Executables = {
        Death = function(a1, a2) -- Line: 28 -- upvalues: EmitterManager (upval), u27 (val) -- types: a1: vector, a2: number
            EmitterManager.Emit("PoisonDuckyExplosion", CFrame.new(a1), a2)
            u27:Play()
        end,
    }
end

return v1
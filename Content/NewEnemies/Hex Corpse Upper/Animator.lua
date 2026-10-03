-- Script path: ReplicatedStorage.Content.NewEnemies.Hex Corpse Upper.Animator
-- Decompile time: 0.58 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 8 -- upvalues: Animation (val)
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    local Animations = a1.Model:WaitForChild("Animations")
    a1._animations = {}
    a1._animations.Split = Animation.new({Target = AnimationController, Track = Animations:WaitForChild("Split")})
    a1._animations.Walk = Animation.new({Target = AnimationController, Track = Animations:WaitForChild("Walk")})
    a1._animations.Split:Play()
    a1._animations.Split.Controller.Ended:Once(function() -- Line: 25 -- upvalues: a1 (val)
        a1._animations.Walk:Play()
    end)
end

return v1
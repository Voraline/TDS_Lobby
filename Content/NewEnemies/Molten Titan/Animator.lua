-- Script path: ReplicatedStorage.Content.NewEnemies.Molten Titan.Animator
-- Decompile time: 0.52 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 8 -- upvalues: Animation (val)
    local Animations = a1.Model:WaitForChild("Animations")
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    a1._deathAnimation = Animation.new({Track = Animations:WaitForChild("Death"), Target = AnimationController})
    a1.Maid:Mark(a1._deathAnimation)
    a1.Executables = {
        Death = function() -- Line: 19 -- upvalues: a1 (val)
            a1._deathAnimation:Play()
        end,
    }
end

return v1
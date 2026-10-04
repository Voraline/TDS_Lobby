-- Script path: ReplicatedStorage.Content.NewEnemies.Frost Invader.Animator
-- Decompile time: 0.54 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 8 -- upvalues: Animation (val)
    local Animations = a1.Model:WaitForChild("Animations")
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    a1._animations = {}
    for i, v in ipairs(Animations:GetChildren()) do
        a1._animations[v.Name] = (Animation.new({Track = v, Target = AnimationController}))
    end
    a1.Executables = {
        Death = function() -- Line: 21 -- upvalues: a1 (val)
            a1._animations.Death:Play()
        end,
    }
end

return v1
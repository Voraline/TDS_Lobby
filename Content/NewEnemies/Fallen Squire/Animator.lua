-- Script path: ReplicatedStorage.Content.NewEnemies.Fallen Squire.Animator
-- Decompile time: 0.40 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 7 -- upvalues: Animation (val)
    local Animations = a1.Model:WaitForChild("Animations")
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    a1.Executables = {
        Death = function() -- Line: 12 -- upvalues: Animation (upval), Animations (val), AnimationController (val)
            Animation.new({Track = Animations.Death, Target = AnimationController}):Play()
        end,
    }
end

return v1
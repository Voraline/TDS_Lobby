-- Script path: ReplicatedStorage.Content.NewEnemies.Fallen Hero.Animator
-- Decompile time: 0.38 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 8 -- upvalues: Animation (val)
    local u10 = Animation.new({
        Preload = true,
        Target = a1.Model.AnimationController.Animator,
        Track = a1.Model.Animations.Death,
    })
    a1.Executables = {
        Death = function() -- Line: 16 -- upvalues: u10 (val)
            u10:Play()
        end,
    }
end

return v1
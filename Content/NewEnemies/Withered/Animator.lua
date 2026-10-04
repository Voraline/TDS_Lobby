-- Script path: ReplicatedStorage.Content.NewEnemies.Withered.Animator
-- Decompile time: 0.30 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 6 -- upvalues: Animation (val)
    local u10 = Animation.new({
        Track = a1.Model.Animations.Death,
        Target = a1.Model.AnimationController.Animator,
    })
    a1.Executables = {
        Death = function() -- Line: 13 -- upvalues: u10 (val)
            u10:Play()
        end,
    }
end

return v1
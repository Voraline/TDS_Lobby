-- Script path: ReplicatedStorage.Content.NewEnemies.Ducky Unit.Animator
-- Decompile time: 0.43 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 6 -- upvalues: Animation (val)
    local u13 = Animation.new({
        IgnorePriority = true,
        IsPersistent = true,
        Preload = true,
        Track = a1.Model.Animations.Death,
        Target = a1.Model.AnimationController.Animator,
        Animation = a1.Model.Animations.Death,
    })
    a1.Executables = {
        Death = function() -- Line: 17 -- upvalues: u13 (val)
            u13:Play()
        end,
    }
end

return v1
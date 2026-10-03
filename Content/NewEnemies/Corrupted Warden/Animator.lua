-- Script path: ReplicatedStorage.Content.NewEnemies.Corrupted Warden.Animator
-- Decompile time: 0.42 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 6 -- upvalues: Animation (val)
    local u18 = Animation.new({
        IgnorePriority = true,
        IsPersistent = true,
        Preload = true,
        Target = a1.Model.AnimationController.Animator,
        Track = a1.Model.Animations[("Death%*"):format((math.random(1, 2)))],
    })
    a1.Executables = {
        Death = function() -- Line: 16 -- upvalues: u18 (val)
            u18:Play()
        end,
    }
end

return v1
-- Script path: ReplicatedStorage.Content.NewEnemies.Fallen Tank.Animator
-- Decompile time: 0.42 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 7 -- upvalues: Animation (val)
    local u9 = Animation.new({
        Preload = true,
        Track = a1.Model.Animations.Death,
        Target = a1.Model.AnimationController,
    })
    a1.Executables = {
        Death = function() -- Line: 15 -- upvalues: a1 (val), u9 (val)
            a1.WalkTrack:Stop()
            u9:Play(0)
        end,
    }
end

return v1
-- Script path: ReplicatedStorage.Content.Enemies.Fallen Rusher.Animator
-- Decompile time: 0.45 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("TweenService")
local v1 = {}
v1.__index = v1
require(ReplicatedStorage.Shared.Modules.Animation)

function v1.Initialize(a1) -- Line: 12
    local u8 = a1.Model.AnimationController:LoadAnimation(a1.Model.Animations.Run)
    u8.Priority = Enum.AnimationPriority.Action
    u8:Play()
    u8:AdjustSpeed(2)
    a1.Executables = {
        Normal = function() -- Line: 22 -- upvalues: a1 (val), u8 (val)
            a1.Model.Riot:Destroy()
            a1.Model.Head.Break:Play()
            u8:Stop()
        end,
    }
end

return v1
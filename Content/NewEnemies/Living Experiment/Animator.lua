-- Script path: ReplicatedStorage.Content.NewEnemies.Living Experiment.Animator
-- Decompile time: 0.64 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 7 -- upvalues: Animation (val), GameState (val)
    local Animations = a1.Model.Animations
    local Animator = a1.Model.AnimationController.Animator
    local u10 = Animation.new({
        IgnorePriority = true,
        IsPersistent = true,
        Preload = true,
        Track = Animations.WalkAnim,
        Target = Animator,
    })
    u10:Play()
    local u18 = Animation.new({
        IgnorePriority = true,
        IsPersistent = true,
        Preload = true,
        Track = Animations.DeathAnim,
        Target = Animator,
    })
    a1.Executables = {
        Dead = function() -- Line: 30 -- upvalues: a1 (val), GameState (upval), u10 (val), u18 (val)
            a1.Model.HumanoidRootPart.Dead.PlaybackSpeed = 1 * GameState.TimeScale
            a1.Model.HumanoidRootPart.Dead:Play()
            u10:Stop(0)
            u18:Play(0)
            a1:Delay(1.8)
        end,
    }
end

return v1
-- Script path: ReplicatedStorage.Content.Enemies.Sentient Titan.Animator
-- Decompile time: 0.55 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 12 -- upvalues: Animation (val), GameState (val)
    a1.Executables = {
        Stab = function() -- Line: 14 -- upvalues: Animation (upval), a1 (val), GameState (upval)
            Animation.new({
                Track = a1.Model.Animations.Smash,
                Target = a1.Model.AnimationController,
            }):Play()
            a1.Model.Head.Scream.PlaybackSpeed = 1 * GameState.TimeScale
            a1.Model.Head.Scream:Play()
            a1:Delay(0.75)
            a1.Model.HumanoidRootPart.Effects.Impact:Emit(1)
            a1.Model.HumanoidRootPart.Effects.Stomp.PlaybackSpeed = 1 * GameState.TimeScale
            a1.Model.HumanoidRootPart.Effects.Stomp:Play()
        end,
    }
end

return v1
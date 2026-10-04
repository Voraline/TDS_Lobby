-- Script path: ReplicatedStorage.Content.Enemies.Werewolf.Animator
-- Decompile time: 0.78 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 10 -- upvalues: Animation (val), GameState (val)
    local u9 = Animation.new({
        Track = a1.Model.Animations.Run,
        Target = a1.Model.AnimationController,
    })
    local u18 = Animation.new({
        Track = a1.Model.Animations.Walk,
        Target = a1.Model.AnimationController,
    })
    u18:Play()
    a1.Executables = {
        Death = function() -- Line: 23 -- upvalues: Animation (upval), a1 (val), GameState (upval)
            Animation.new({
                Track = a1.Model.Animations.Died,
                Target = a1.Model.AnimationController,
            }):Play()
            a1.Model.Head.Died.PlaybackSpeed = 1 * GameState.TimeScale
            a1.Model.Head.Died:Play()
        end,
        Charge = function(a1_2) -- Line: 34 -- upvalues: u18 (val), u9 (val), a1 (val)
            u18:Stop()
            u9:Play()
            a1.Model.Head.Charge:Play()
            a1:Delay(a1_2)
            u9:Stop()
            u18:Play()
        end,
    }
end

return v1
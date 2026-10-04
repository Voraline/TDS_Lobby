-- Script path: ReplicatedStorage.Content.Enemies.Frost Hero.Animator
-- Decompile time: 1.07 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("TweenService")
local v1 = {}
v1.__index = v1
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
require(ReplicatedStorage.Shared.Modules.Projectile)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)

function v1.Initialize(a1) -- Line: 15 -- upvalues: Animation (val), TimescaleUtilities (val)
    a1.Executables = {
        Stab = function() -- Line: 17 -- upvalues: Animation (upval), a1 (val)
            Animation.new({
                Track = a1.Model.Animations.Swing,
                Target = a1.Model.AnimationController,
            }):Play()
            a1.Model.Head.Grunt:Play()
            a1:Delay(0.4)
            a1.Model.Head.Slash:Play()
        end,
        FireBreath = function(a1_2, a2) -- Line: 27 -- upvalues: Animation (upval), a1 (val), TimescaleUtilities (upval)
            local v1 = Animation.new({
                Track = a1.Model.Animations.Fire,
                Target = a1.Model.AnimationController,
            })
            v1:Play(1)
            TimescaleUtilities.Wait(0.5)
            a1.Model.Head.Fire:Play()
            a1.Model.Spell.Frost.Fire.Enabled = true
            a1.Model.Spell.Fire.Enabled = true
            a1.Model.Spell.Embers.Enabled = true
            TimescaleUtilities.Wait(a2)
            v1:Stop(1)
            a1.Model.Head.Fire:Stop()
            a1.Model.Spell.Frost.Fire.Enabled = false
            a1.Model.Spell.Fire.Enabled = false
            a1.Model.Spell.Embers.Enabled = false
        end,
        Death = function() -- Line: 51 -- upvalues: Animation (upval), a1 (val)
            Animation.new({
                Track = a1.Model.Animations.Died,
                Target = a1.Model.AnimationController,
            }):Play()
            a1.Model.Sword:Destroy()
            a1.Model.Head.Died:Play()
        end,
    }
end

return v1
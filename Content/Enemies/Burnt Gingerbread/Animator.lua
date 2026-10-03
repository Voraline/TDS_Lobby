-- Script path: ReplicatedStorage.Content.Enemies.Burnt Gingerbread.Animator
-- Decompile time: 0.99 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("TweenService")
local v1 = {}
v1.__index = v1
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local Projectile = require(ReplicatedStorage.Shared.Modules.Projectile)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)

function v1.Initialize(a1) -- Line: 15
    -- upvalues: Animation (val), ReplicatedStorage (val), Projectile (val), TimescaleUtilities (val)
    -- upvalues: EffectsController (val)
    a1.Executables = {
        Fireball = function(a1_2, a2) -- Line: 17
            -- upvalues: Animation (upval), a1 (val), ReplicatedStorage (upval), Projectile (upval)
            -- upvalues: TimescaleUtilities (upval), EffectsController (upval)
            Animation.new({
                Track = a1.Model.Animations.Throw,
                Target = a1.Model.AnimationController,
            }):Play()
            local Fireball = a1.Model.Fireball
            Fireball.Transparency = 0
            Fireball.Fire.Enabled = true
            local Coal = ReplicatedStorage.Effects.Coal
            a1:Delay(0.34)
            local v1 = {
                Part = Coal,
                Speed = 10,
                Gravity = 0,
                Type = "Linear",
                Start = Fireball.CFrame,
                End = a1_2,
                Turn = 0,
            }
            local v2 = Projectile:CalcDuration(v1)
            Projectile:Throw(v1)
            Fireball.Transparency = 1
            Fireball.Fire.Enabled = false
            a1.Model.Head.Throw:Play()
            TimescaleUtilities.Delay(v2, function() -- Line: 43 -- upvalues: EffectsController (upval), a1_2 (val), a2 (val)
                EffectsController.Explosion({
                    Position = a1_2,
                    Radius = a2,
                    Color = BrickColor.new("Br. yellowish orange"),
                    Sound = 440145223,
                    Material = Enum.Material.Neon,
                    Particles = true,
                    Visible = true,
                })
            end)
        end,
    }
end

return v1
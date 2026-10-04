-- Script path: ReplicatedStorage.Content.Enemies.Bunny.Animator
-- Decompile time: 1.05 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("TweenService")
local v1 = {}
v1.__index = v1
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local Projectile = require(ReplicatedStorage.Shared.Modules.Projectile)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)

function v1.Initialize(a1) -- Line: 15
    -- upvalues: Animation (val), Projectile (val), TimescaleUtilities (val), EffectsController (val)
    a1.Executables = {
        Fireball = function(a1_2, a2, a3) -- Line: 17
            -- upvalues: Animation (upval), a1 (val), Projectile (upval), TimescaleUtilities (upval)
            -- upvalues: EffectsController (upval)
            Animation.new({
                Track = a1.Model.Animations.Throw,
                Target = a1.Model.AnimationController,
            }):Play()
            local Club = a1.Model.Club
            Club.Transparency = 0
            a1:Delay(0.45)
            a1_2.Start = Club.CFrame
            local v1 = Projectile:CalcDuration(a1_2)
            Projectile:Throw(a1_2)
            Club.Transparency = 1
            a1.Model.Club.Throw:Play()
            TimescaleUtilities.Delay(v1, function() -- Line: 32 -- upvalues: EffectsController (upval), a2 (val), a3 (val), Club (val)
                EffectsController.Explosion({
                    Position = a2,
                    Radius = a3,
                    Color = BrickColor.new("White"),
                    Sound = 425160136,
                    Material = Enum.Material.Neon,
                    Particles = false,
                    Visible = false,
                })
                Club.Transparency = 0
            end)
        end,
        Death = function() -- Line: 46 -- upvalues: Animation (upval), a1 (val)
            Animation.new({
                Track = a1.Model.Animations.Died,
                Target = a1.Model.AnimationController,
            }):Play()
        end,
    }
end

return v1
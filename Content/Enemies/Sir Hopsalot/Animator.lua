-- Script path: ReplicatedStorage.Content.Enemies.Sir Hopsalot.Animator
-- Decompile time: 1.66 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local Projectile = require(ReplicatedStorage.Shared.Modules.Projectile)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 12
    -- upvalues: Animation (val), Projectile (val), TimescaleUtilities (val), EffectsController (val)
    a1.Executables = {
        Fireball = function(a1_2, a2, a3) -- Line: 14
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
            TimescaleUtilities.Delay(v1, function() -- Line: 29 -- upvalues: EffectsController (upval), a2 (val), a3 (val), Club (val)
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
        Shield = function(a1_2, a2) -- Line: 43 -- upvalues: a1 (val), TimescaleUtilities (upval), Animation (upval)
            local Size = a1.Model.HumanoidRootPart.Size
            local u12 = game.ReplicatedStorage.Effects.Shield:Clone()
            u12:SetPrimaryPartCFrame(a1.Model.HumanoidRootPart.CFrame)
            u12.Effect.Size = Vector3.new(Size.X * 2.5, Size.Y * 1.5, Size.X * 2.5)
            u12.Effect.Damage1.Display.Text = a2
            u12.Effect.Damage2.Display.Text = a2
            u12.Effect.Damage3.Display.Text = a2
            u12.Effect.Damage4.Display.Text = a2
            u12.Parent = a1.Model
            u12.PrimaryPart.Weld.Part1 = a1.Model.HumanoidRootPart
            TimescaleUtilities.Delay(a1_2, function() -- Line: 57 -- upvalues: u12 (val)
                u12:Destroy()
            end)
            Animation.new({
                Track = a1.Model.Animations.Shield,
                Target = a1.Model.AnimationController,
            })
            local v1 = Animation.new({
                Track = a1.Model.Animations.Shield,
                Target = a1.Model.AnimationController,
            })
            v1:Play()
            a1:Delay(a1_2)
            v1:Stop()
        end,
        Death = function() -- Line: 74 -- upvalues: Animation (upval), a1 (val)
            Animation.new({
                Track = a1.Model.Animations.Died,
                Target = a1.Model.AnimationController,
            }):Play()
        end,
    }
end

return v1
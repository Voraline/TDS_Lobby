-- Script path: ReplicatedStorage.Content.Enemies.Health Cultist.Animator
-- Decompile time: 2.13 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local Laser = require(ReplicatedStorage.Client.Modules.Laser)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 13
    -- upvalues: Animation (val), TweenService (val), Laser (val), EffectsController (val)
    a1.praiseAnim = Animation.new({
        Track = a1.Model.Animations.Praise,
        Target = a1.Model.AnimationController,
    })
    a1.Model.HumanoidRootPart.Spell.MaxVelocity = 0.025
    a1.Executables = {
        Start = function(a1_2) -- Line: 22 -- upvalues: a1 (val), TweenService (upval)
            a1.praiseAnim:Play()
            a1.Model.Spell.Size = Vector3.new(0, a1.Model.Spell.Size.Y, 0)
            TweenService:Create(
                a1.Model.Spell,
                TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0),
                {Transparency = 0.35}
            ):Play()
            TweenService:Create(
                a1.Model.Spell.Mesh,
                TweenInfo.new(1.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0),
                {Scale = Vector3.new(a1_2 * 0.4, 1, a1_2 * 0.4)}
            ):Play()
            a1.Model.Head.Praise:Play()
            a1.Model["Left Arm"].View.ParticleEmitter.Enabled = true
            a1.Model["Right Arm"].View.ParticleEmitter.Enabled = true
        end,
        End = function() -- Line: 40 -- upvalues: a1 (val), TweenService (upval)
            a1.praiseAnim:Stop()
            TweenService:Create(
                a1.Model.Spell,
                TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0),
                {Transparency = 1}
            ):Play()
            TweenService:Create(
                a1.Model.Spell.Mesh,
                TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0),
                {Scale = Vector3.new(0, 1, 0)}
            ):Play()
            a1.Model["Left Arm"].View.ParticleEmitter.Enabled = false
            a1.Model["Right Arm"].View.ParticleEmitter.Enabled = false
        end,
        Heal = function(a1_2) -- Line: 56 -- upvalues: a1 (val)
            local HumanoidRootPart = a1_2:FindFirstChild("HumanoidRootPart")
            if HumanoidRootPart then
                local EnemyHeal = HumanoidRootPart:FindFirstChild("EnemyHeal")
                if EnemyHeal then
                    EnemyHeal.Wave2:Emit(1)
                    return
                end
                local v1 = a1.Model.HumanoidRootPart.EnemyHeal:Clone()
                v1.Parent = HumanoidRootPart
                v1.Glow:Emit(1)
                v1.Icon:Emit(1)
                v1.Wave:Emit(1)
            end
        end,
        Death = function() -- Line: 74 -- upvalues: Animation (upval), a1 (val), Laser (upval), EffectsController (upval)
            Animation.new({
                Track = a1.Model.Animations.Dead,
                Target = a1.Model.AnimationController,
            }):Play()
            for k, v in pairs(a1.Model.Torso.DeathEffect:GetChildren()) do
                if v:IsA("ParticleEmitter") then
                    v.Enabled = true
                end
            end
            wait(3.8)
            local v1 = {
                Start = a1.Model.Torso.Position + Vector3.new(0, 30, 0),
                Pos = a1.Model.Torso.Position,
                Color = BrickColor.new("Artichoke"),
                Transparency = 0.1,
                Size = 0.3,
                Fade = 2,
                Type = "Fade",
            }
            Laser:Bolt(v1)
            EffectsController.Explosion({
                Position = a1.Model.Torso.Position,
                Radius = 20,
                Color = BrickColor.new("Artichoke"),
                Sound = 440145223,
                Material = Enum.Material.Neon,
                Particles = true,
                Visible = true,
            })
        end,
    }
end

return v1
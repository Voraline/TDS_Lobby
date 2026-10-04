-- Script path: ReplicatedStorage.Content.Enemies.Commander.Animator
-- Decompile time: 1.93 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local LightningBolt = require(ReplicatedStorage.Shared.Modules.Lightning.LightningBolt)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 14
    -- upvalues: Animation (val), LightningBolt (val), TimescaleUtilities (val), TweenService (val)
    a1.Executables = {
        CallToArms = function() -- Line: 16 -- upvalues: Animation (upval), a1 (val)
            Animation.new({
                Track = a1.Model.Animations.Ability,
                Target = a1.Model.AnimationController,
            }):Play()
            a1.Model.Head.Effect.Wave.Enabled = true
            a1:Delay(1.8)
            a1.Model.Head.Effect.Wave.Enabled = false
        end,
        Lightning = function(a1_2, a2) -- Line: 31 -- upvalues: LightningBolt (upval), TimescaleUtilities (upval), a1 (val)
            local Position = a1_2.HumanoidRootPart.Position
            local v1 = {}
            local v2 = {}
            v1.WorldPosition = Position + Vector3.new(0, 15, 0)
            v1.WorldAxis = Vector3.new(0, 0, 1)
            v2.WorldPosition = Position
            v2.WorldAxis = Vector3.new(0, 0, 1)
            local u15 = LightningBolt.new(v1, v2, 20)
            u15.Color = Color3.new(1, 1, 0.498039)
            TimescaleUtilities.Delay(0.3, function() -- Line: 40 -- upvalues: u15 (val)
                u15:DestroyDissipate()
            end)
            for k, v in pairs(a1.Model.HumanoidRootPart.SpeedEffect:GetChildren()) do
                if v:IsA("ParticleEmitter") then
                    local u50 = v:Clone()
                    u50.Parent = a1_2.Hitbox
                    u50.Enabled = true
                    TimescaleUtilities.Delay(a2, function() -- Line: 51 -- upvalues: u50 (val)
                        u50:Destroy()
                    end)
                end
            end
        end,
        Death = function() -- Line: 58 -- upvalues: Animation (upval), a1 (val), TweenService (upval)
            local v1, v2, v3
            local u10 = Animation.new({
                Track = a1.Model.Animations.Death,
                Target = a1.Model.AnimationController,
            })
            u10:Play()
            a1.Model.Head.Shutdown:Play()
            task.defer(function() -- Line: 68 -- upvalues: u10 (val), a1 (upval)
                while u10.Controller.Length == 0 do
                    a1:Delay(0.1)
                end
                a1:Delay(u10.Controller.Length * 0.98)
                u10.Controller:AdjustSpeed(0)
            end)
            for k, v in pairs(a1.Model:GetDescendants()) do
                if v:IsA("BasePart") and v.Material == Enum.Material.Neon then
                    v2 = TweenService
                    v3 = TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0)
                    v1 = {Color = Color3.new(0.0823529, 0.0823529, 0.0823529)}
                    v2:Create(v, v3, v1):Play()
                end
            end
            for k2, i in pairs(a1.Model.Torso.DeathParticle:GetChildren()) do
                if i:IsA("ParticleEmitter") then
                    i.Enabled = true
                end
            end
            a1:Delay(1.5)
            for k3, j in pairs(a1.Model.Torso.DeathParticle:GetChildren()) do
                if j:IsA("ParticleEmitter") and j.Name ~= "Smoke" then
                    j.Enabled = false
                end
            end
        end,
    }
end

return v1
-- Script path: ReplicatedStorage.Content.NewEnemies.Shotgunner.Animator
-- Decompile time: 1.32 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 11 -- upvalues: Animation (val), GameState (val), TweenService (val)
    a1.Executables = {
        Death = function() -- Line: 13 -- upvalues: Animation (upval), a1 (val), GameState (upval), TweenService (upval)
            local v1, v2, v3
            local u10 = Animation.new({
                Track = a1.Model.Animations.Death,
                Target = a1.Model.AnimationController,
            })
            u10:Play()
            a1.Model.Head.Shutdown.PlaybackSpeed = 1 * GameState.TimeScale
            a1.Model.Head.Shutdown:Play()
            task.defer(function() -- Line: 24 -- upvalues: u10 (val), a1 (upval)
                while u10.Controller.Length == 0 do
                    a1:Delay(0.001)
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
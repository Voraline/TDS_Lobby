-- Script path: ReplicatedStorage.Content.Enemies.Mimic Umbra.Animator
-- Decompile time: 1.19 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 10 -- upvalues: Animation (val), TweenService (val)
    a1.Executables = {
        Death = function() -- Line: 12 -- upvalues: Animation (upval), a1 (val), TweenService (upval)
            local v1, v2, v3, v4
            local u10 = Animation.new({
                Track = a1.Model.Animations.Death,
                Target = a1.Model.AnimationController,
            })
            u10:Play()
            task.defer(function() -- Line: 20 -- upvalues: u10 (val), a1 (upval)
                while u10.Controller.Length == 0 do
                    a1:Delay(0.01)
                end
                a1:Delay(u10.Controller.Length * 0.98)
                u10.Controller:AdjustSpeed(0)
            end)
            for k, v in pairs(a1.Model:GetDescendants()) do
                if v:IsA("BasePart") and v.Material == Enum.Material.Neon then
                    v3 = TweenService
                    v4 = TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0)
                    v1 = TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0)
                    v2 = {Color = Color3.new(0.0823529, 0.0823529, 0.0823529)}
                    v3:Create(v, v4, v1, v2):Play()
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
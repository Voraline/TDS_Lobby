-- Script path: ReplicatedStorage.Content.Tower.Militant.Animator.MilitantSkinConfig
-- Decompile time: 3.04 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Cooldown = require(ReplicatedStorage.Client.Modules.Cooldown)
return {
    SuperFan = {
        dontLoadAnimations = true,
        onInit = function(a1) -- Line: 8 -- upvalues: Cooldown (val)
            a1._sounds = {}
            for i, j in a1.Model:GetDescendants() do
                if j:IsA("Sound") and j.Name == "Loop" then
                    j.PlaybackSpeed = 0
                    table.insert(a1._sounds, j)
                end
            end
            a1._timer = Cooldown.new(0)
            a1.Maid:Mark(a1._timer)
        end,
        onFire = function(a1, a2, a3) -- Line: 20 -- upvalues: TweenService (val)
            local Loop = a1.Model.Weapon.Gun.Configuration.Handle.Value.Loop
            a1._currentFireEffect = Loop.Parent.Attachment
            local v1, v2 = a1, a3
            for i, j in a1._currentFireEffect:GetChildren() do
                if j:IsA("Beam") or j:IsA("ParticleEmitter") then
                    j.Enabled = true
                end
            end
            v1._currentFireEffect.Attachment.WorldPosition = v2
            if not v1._aiming then
                TweenService:Create(
                    Loop,
                    TweenInfo.new(0.34, Enum.EasingStyle.Quint, Enum.EasingDirection.In),
                    {Volume = 0.1, PlaybackSpeed = Loop:GetAttribute("Playback")}
                ):Play()
                Loop:Play()
                if v1._currentFireAnimation then
                    v1._currentFireAnimation:Stop()
                end
                v1._aiming = true
                v1:Animate("Intro")
                v1._currentFireAnimation = v1:Animate("FireLoop")
            end
            v1._timer:setTime(1)
        end,
        onIdle = function(a1) -- Line: 53 -- upvalues: TweenService (val)
            if a1._currentFireEffect then
                for i, j in a1._currentFireEffect:GetChildren() do
                    if j:IsA("Beam") or j:IsA("ParticleEmitter") then
                        j.Enabled = false
                    end
                end
            end
            if a1._aiming and not a1._timer:isActive() then
                local v1, v2
                for k, n in a1._sounds do
                    v1 = TweenService
                    v2 = TweenInfo.new(1.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
                    v1:Create(n, v2, {PlaybackSpeed = 0.2}):Play()
                    v1 = TweenService
                    v2 = TweenInfo.new(1.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
                    v1:Create(n, v2, {Volume = 0}):Play()
                end
                a1._currentFireAnimation:Stop()
                a1:Animate("Outro")
                a1._aiming = false
            end
        end,
    },
}
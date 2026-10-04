-- Script path: ReplicatedStorage.Content.NewEnemies.Void Caster.Animator.VoidCasterAnimationStates
-- Decompile time: 3.56 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
require(ReplicatedStorage.Client.Modules.StateManager)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local VoidCasterEffects = require(script.Parent.VoidCasterEffects)
local v1 = {}
local v2 = {
    name = "Summoning",
    onEnter = function(a1, a2) -- Line: 21 -- upvalues: EmitterManager (val) -- types: a2: vector?
        a1._animations.Summon:Play()
        a1:_playSound("Summon")
        EmitterManager.toggle(a1.Model.Summon, true, "ParticleEmitter")
        return {a1}
    end,
    onLeave = function(a1) -- Line: 29 -- upvalues: EmitterManager (val)
        EmitterManager.toggle(a1.Model.Summon, false, "ParticleEmitter")
    end,
}
local v3 = {
    name = "ShieldCasting",
    onEnter = function(a1) -- Line: 36 -- upvalues: EmitterManager (val)
        EmitterManager.manualEmit(a1.Model.Cast)
        a1:_playSound("Regen")
        EmitterManager.toggle(a1.Model.ShieldStaff.Value, true, "ParticleEmitter")
        EmitterManager.toggle(a1.Model.ShieldStaff.Value, true, "Trail")
        a1._animations.ShieldCast:Play()
        a1:Delay(0.5, function() -- Line: 46 -- upvalues: EmitterManager (upval), a1 (val)
            EmitterManager.manualEmit(a1.Model.ShieldVFX)
        end)
        return {a1}
    end,
    onLeave = function(a1) -- Line: 53 -- upvalues: EmitterManager (val)
        EmitterManager.toggle(a1.Model.ShieldStaff.Value, false, "ParticleEmitter")
        EmitterManager.toggle(a1.Model.ShieldStaff.Value, false, "Trail")
    end,
}
local v4 = {
    name = "Reviving",
    onEnter = function(a1, a2) -- Line: 60
        -- upvalues: EmitterManager (val), TimescaleUtilities (val), VoidCasterEffects (val)
        EmitterManager.toggle(a1.Model.ReviveStaff.Value, true, "ParticleEmitter")
        EmitterManager.toggle(a1.Model.ReviveStaff.Value, true, "Trail")
        a1._revivingMaid:Sweep()
        a1:_playSound("ReviveIntro")
        TimescaleUtilities.Delay(0.6, function() -- Line: 67 -- upvalues: a1 (val)
            if a1:IsAlive() then
                a1:_playSound("ReviveLoop", true)
            end
        end)
        a1._animations.ReviveIntro:Play()
        TimescaleUtilities.Wait(2.167)
        if a1._animations.ReviveLoop then
            a1._animations.ReviveLoop:Play()
        end
        EmitterManager.manualEmit(a1.Model.ReviveVFX)
        VoidCasterEffects.reviveBeams(a1, {beamCount = 20, introTime = 2.167, endPosition = a2})
        return {a1}
    end,
    onLeave = function(a1) -- Line: 88
        a1._revivingMaid:Sweep()
    end,
}
local v5 = {
    name = "ReviveComplete",
    onEnter = function(a1) -- Line: 94 -- upvalues: EmitterManager (val)
        a1._revivingMaid:Sweep()
        EmitterManager.toggle(a1.Model.ReviveStaff.Value, false, "ParticleEmitter")
        EmitterManager.toggle(a1.Model.ReviveStaff.Value, false, "Trail")
        a1:_stopSound("ReviveLoop")
        a1:_playSound("ReviveOutro")
        if a1._animations.ReviveLoop then
            a1._animations.ReviveLoop:Stop()
        end
        a1._animations.ReviveOutro:Play()
        EmitterManager.manualEmit(a1.Model.ReviveComplete)
        return {a1}
    end,
}
local v6 = {
    name = "Death",
    onEnter = function(a1) -- Line: 123
        -- upvalues: TimescaleUtilities (val), TweenService (val), VoidCasterEffects (val), GameState (val)
        for i, j in a1.sounds do
            j:Stop()
        end
        a1:_playSound("death")
        for k, n in a1._animations do
            n:Stop()
        end
        a1._animations.Death:Play()
        TimescaleUtilities.Delay(0.1, function() -- Line: 134 -- upvalues: a1 (val), TimescaleUtilities (upval), TweenService (upval)
            a1:_animateVignette({
                transparency = 0,
                tweenInfo = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                color = Color3.fromRGB(116, 66, 255),
            })
            TimescaleUtilities.Delay(0.05, function() -- Line: 145 -- upvalues: a1 (upval)
                a1:_animateVignette({
                    transparency = 1,
                    tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                    color = Color3.fromRGB(255, 255, 255),
                })
            end)
            TweenService:Create(
                workspace.CurrentCamera,
                TweenInfo.new(0.1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                {FieldOfView = 60}
            ):Play()
            TimescaleUtilities.Delay(0.1, function() -- Line: 165 -- upvalues: TweenService (upval)
                TweenService:Create(
                    workspace.CurrentCamera,
                    TweenInfo.new(0.5, Enum.EasingStyle.Circular, Enum.EasingDirection.Out),
                    {FieldOfView = 70}
                ):Play()
            end)
        end)
        TimescaleUtilities.Delay(1, function() -- Line: 176
            -- upvalues: a1 (val), TweenService (upval), TimescaleUtilities (upval), VoidCasterEffects (upval)
            a1:_shakeCamera({
                mag = 4,
                rough = 30,
                fadeIn = 0,
                posInfluence = 1,
                rotInfluence = 0,
                cancelTime = 0.01,
                fadeOut = 4,
            })
            a1:_animateVignette({
                transparency = 0.25,
                tweenInfo = TweenInfo.new(3.7, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
                color = Color3.fromRGB(116, 66, 255),
            })
            TweenService:Create(
                workspace.CurrentCamera,
                TweenInfo.new(3.7, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {FieldOfView = 60}
            ):Play()
            TimescaleUtilities.Delay(3.7, function() -- Line: 201 -- upvalues: a1 (upval), TweenService (upval)
                a1:_animateVignette({
                    transparency = 1,
                    tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                    color = Color3.fromRGB(255, 255, 255),
                })
                TweenService:Create(
                    workspace.CurrentCamera,
                    TweenInfo.new(0.5, Enum.EasingStyle.Circular, Enum.EasingDirection.Out),
                    {FieldOfView = 70}
                ):Play()
            end)
            VoidCasterEffects.deathEnergyOrbs(a1, {
                duration = 3.5,
                radius = NumberRange.new(8, 16),
                controlOffset = NumberRange.new(-5, 5),
                interval = NumberRange.new(0.05, 0.25),
                travelTime = NumberRange.new(0.35, 0.5),
            })
        end)
        ;(a1._animations.Death.Controller:GetMarkerReachedSignal("Rock")):Connect(function() -- Line: 230
            -- upvalues: VoidCasterEffects (upval), a1 (val), GameState (upval), TweenService (upval)
            -- upvalues: TimescaleUtilities (upval)
            local statueHandler = VoidCasterEffects.statueHandler
            local v1 = GameState.GameMode == "Sandbox"
            local u10, u11 = statueHandler(a1, v1)
            local Highlight = Instance.new("Highlight")
            Highlight.Name = "Highlight"
            Highlight.FillColor = Color3.new(1, 1, 1)
            Highlight.FillTransparency = 1
            Highlight.OutlineTransparency = 1
            Highlight.Parent = a1.Model
            TweenService:Create(Highlight, TweenInfo.new(0.1), {FillTransparency = 0}):Play()
            TimescaleUtilities.Delay(0.1, function() -- Line: 242 -- upvalues: u10 (val), TweenService (upval), Highlight (val), a1 (upval), u11 (val)
                u10()
                TweenService:Create(
                    Highlight,
                    TweenInfo.new(5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                    {FillTransparency = 1}
                ):Play()
                a1:Delay(4, u11)
            end)
        end)
    end,
}
v1[1] = {
    name = "Walking",
    onEnter = function(a1) -- Line: 15
        return {a1}
    end,
}
v1[2] = v2
v1[3] = v3
v1[4] = v4
v1[5] = v5
v1[6] = {
    name = "RageActivate",
    onEnter = function(a1) -- Line: 115
        a1._animations.RageActivate:Play()
        a1:_applyRageVisuals()
        return {a1}
    end,
}
v1[7] = v6
return v1
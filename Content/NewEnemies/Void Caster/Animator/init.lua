-- Script path: ReplicatedStorage.Content.NewEnemies.Void Caster.Animator
-- Decompile time: 3.40 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local StateManager = require(ReplicatedStorage.Client.Modules.StateManager)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local VignetteStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.VignetteStore)
local VoidCasterEffects = require(script:WaitForChild("VoidCasterEffects"))
local VoidCasterSounds = require(script:WaitForChild("VoidCasterSounds"))
local u61 = {}
u61.__index = u61

function u61:_showImmunityShield() -- Line: 27 -- upvalues: EmitterManager (val)
    EmitterManager.toggle(self.Model.Shield, true, "ParticleEmitter")
end

function u61:_hideImmunityShield() -- Line: 31 -- upvalues: EmitterManager (val)
    self:_playSound("ShieldBreak")
    EmitterManager.toggle(self.Model.Shield, false, "ParticleEmitter")
end

function u61:_applyRageVisuals() -- Line: 36
    local Rage = self.Model:FindFirstChild("Rage")
    if Rage then
        for i, j in Rage:GetDescendants() do
            if j:IsA("BasePart") then
                j.Transparency = 0
            end
        end
    end
end

function u61.Initialize(a1) -- Line: 48
    -- upvalues: VoidCasterSounds (val), TimescaleUtilities (val), TweenService (val), VignetteStore (val), Shaker (val)
    -- upvalues: u61 (val), StateManager (val), Maid (val), Animation (val), VoidCasterEffects (val)
    local Sound, volume
    local Animations = a1.Model:WaitForChild("Animations")
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    a1.sounds = {}
    local SoundEmitter = VoidCasterSounds.SoundEmitter
    local v1 = nil
    local v2 = nil
    for i, j in VoidCasterSounds.Sounds, v1, v2 do
        Sound = Instance.new("Sound")
        Sound.Name = i
        Sound.SoundId = "rbxassetid://" .. j.id
        Sound.RollOffMaxDistance = SoundEmitter.RollOffMaxDistance
        Sound.RollOffMinDistance = SoundEmitter.RollOffMinDistance
        Sound.RollOffMode = SoundEmitter.RollOffMode
        Sound.Parent = a1.Model.PrimaryPart
        Sound.Looped = j.looped or false
        volume = j.volume or SoundEmitter.Volume or 0.5
        Sound.Volume = volume
        a1.sounds[i] = Sound
    end

    function a1:_playSound(a2, a3) -- Line: 70
        -- upvalues: TimescaleUtilities (upval)
        if a3 then
            local u7 = self.sounds[a2]:Clone()
            u7.Parent = self.Model.PrimaryPart
            u7:Play()
            TimescaleUtilities.Delay(u7.TimeLength + 1, function() -- Line: 75 -- upvalues: u7 (val)
                u7:Destroy()
            end)
        end
        local v1 = self.sounds[a2]
        if v1 then
            v1:Play()
        end
        return v1
    end

    function a1._stopSound(a1, a2) -- Line: 89 -- types: a1: table, a2: string
        local v1 = a1.sounds[a2]
        if v1 then
            v1:Stop()
        end
    end

    function a1._fadeInSound(a1, a2, a3) -- Line: 96
        -- upvalues: TweenService (upval), SoundEmitter (val)
        local v1 = a1.sounds[a2]
        if v1 then
            v1.Volume = 0
            v1:Play()
            TweenService:Create(
                v1,
                TweenInfo.new(a3, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
                {Volume = SoundEmitter.Volume or 0.5}
            ):Play()
        end
    end

    function a1._fadeOutSound(a1, a2, a3) -- Line: 109
        -- upvalues: TweenService (upval), TimescaleUtilities (upval)
        local u4 = a1.sounds[a2]
        if u4 then
            TweenService:Create(u4, TweenInfo.new(a3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Volume = 0}):Play()
            TimescaleUtilities.Delay(a3, function() -- Line: 118 -- upvalues: u4 (val)
                u4:Stop()
            end)
        end
    end

    function a1._animateVignette(a1, a2) -- Line: 124 -- upvalues: VignetteStore (upval)
        VignetteStore.setAnimationData({
            transparency = a2.transparency,
            tweenInfo = a2.tweenInfo,
            color = a2.color,
        })
    end

    function u61._shakeCamera(a1, a2) -- Line: 132 -- upvalues: Shaker (upval) -- types: a1: table, a2: table
        return Shaker:Shake({
            a2.mag,
            a2.rough,
            a2.fadeIn,
            a2.posInfluence,
            a2.rotInfluence,
        }, a2.cancelTime, a2.fadeOut)
    end

    a1._stateManager = StateManager.new()
    a1._revivingMaid = Maid.new()
    a1.Maid:Mark(a1._revivingMaid)
    a1._animations = {}
    for k, n in Animations:GetChildren() do
        a1._animations[n.Name] = (Animation.new({
            Preload = true,
            IgnorePriority = true,
            Track = n,
            Target = AnimationController,
            Entity = {TimeScaled = true},
        }))
    end
    local Configuration = a1.Model:FindFirstChild("Configuration")
    local SummonVFX = Configuration and Configuration:FindFirstChild("SummonVFX")
    a1._summonVFXAttachment = SummonVFX and SummonVFX.Value
    a1._stateManager:addStates((require(script:WaitForChild("VoidCasterAnimationStates"))))
    a1.Executables = {
        StateChanged = function(a1_2, ...) -- Line: 165 -- upvalues: a1 (val) -- types: a1_2: string
            a1._stateManager:changeState(a1_2, a1, ...)
        end,
        VoidImmunity = function(a1_2) -- Line: 168 -- upvalues: a1 (val) -- types: a1_2: boolean
            if a1_2 then
                a1:_showImmunityShield()
                return
            end
            a1:_hideImmunityShield()
        end,
        SummonPortals = function(a1_2, a2) -- Line: 175 -- upvalues: VoidCasterEffects (upval), a1 (val) -- types: a1_2: table, a2: number
            for i, j in a1_2 do
                VoidCasterEffects.summonPortal(a1, j, a2)
            end
        end,
    }
    a1._animations.Float:Play()
    a1._stateManager:changeState("Walking", a1)
    if a1.Model:GetAttribute("Raged") then
        a1:_applyRageVisuals()
    end
    ;(a1.Replicator:GetStateChangedSignal("VoidImmunity")):Connect(function(a1_2) -- Line: 195 -- upvalues: a1 (val)
        if a1_2 then
            a1:_showImmunityShield()
            return
        end
        a1:_hideImmunityShield()
    end)
    if a1.Replicator:Get("VoidImmunity") then
        a1:_showImmunityShield()
    end
end

return u61
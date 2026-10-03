-- Script path: ReplicatedStorage.Content.Tower.Pulse Trooper.Animator.Effects
-- Decompile time: 5.47 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Shared = ReplicatedStorage.Shared
local Client = ReplicatedStorage.Client
local PulseTrooper = ReplicatedStorage.Assets.Effects.Misc.PulseTrooper
local EmitterManager = require(Shared.Modules.EmitterManager)
local TimescaleUtilities = require(Shared.Modules.TimescaleUtilities)
local TweenService = require(Client.Modules.TweenService)
local v1 = {}

local function getCircularCurveSize(a1) -- Line: 16 -- types: a1: number
    return a1 * 4 / 3
end

local function createScaledEffectModel(a1, a2, a3, a4) -- Line: 20
    -- upvalues: 
    local Model = Instance.new("Model")
    Model.Name = a2
    a1.Parent = Model
    Model:ScaleTo(1 / (math.max(a1.Size.X, a1.Size.Y, a1.Size.Z)) * a3)
    local Pivot = Model:GetPivot()
    Model:PivotTo(Pivot + (a4 - Pivot.Position))
    return Model
end

local function getEffectCleanupDelay(a1) -- Line: 39 -- types: a1: userdata
    local v1 = 0
    for i, j in a1:GetDescendants() do
        if j:IsA("Trail") then
            v1 = math.max(v1, j.Lifetime)
        elseif j:IsA("ParticleEmitter") then
            v1 = math.max(v1, j.Lifetime.Max)
        end
    end
    return v1
end

local function toggleLaserEffects(a1, a2) -- Line: 53
    -- upvalues: EmitterManager (val)
    EmitterManager.toggle(a1, a2, "ParticleEmitter")
    EmitterManager.toggle(a1, a2, "Trail")
end

function v1.emitPulse(a1) -- Line: 58
    -- upvalues: PulseTrooper (val), createScaledEffectModel (val), TweenService (val), EmitterManager (val)
    -- upvalues: TimescaleUtilities (val)
    local u5 = PulseTrooper.Pulse:Clone()
    local Floor = u5.Floor
    local LightningRing = u5.LightningRing
    local v1 = LightningRing:FindFirstChild("1")
    local v2 = LightningRing:FindFirstChild("2")
    local v3 = a1.range * 2
    local v4 = a1.range / a1.pulseSpeed
    local v5 = a1.range / math.max(v1.Position.Magnitude, v2.Position.Magnitude)
    local v6 = a1.range * 4 / 3
    local v7 = v1.Position * v5
    local v8 = v2.Position * v5
    local u36 = {}
    v1.Position = Vector3.new(0, 0, 0)
    v2.Position = Vector3.new(0, 0, 0)
    for i, j in LightningRing:GetDescendants() do
        if j:IsA("Beam") then
            table.insert(u36, {
                Beam = j,
                CurveSize0 = math.sign(j.CurveSize0) * v6,
                CurveSize1 = math.sign(j.CurveSize1) * v6,
            })
            j.CurveSize0 = 0
            j.CurveSize1 = 0
            j.Enabled = true
        end
    end
    local v9 = a1.heightAttachment.WorldPosition + Vector3.new(0, 0.10000000149011612, 0)
    local u63 = createScaledEffectModel(Floor, "PulseFloor", v3, v9)
    local u74 = createScaledEffectModel(PulseTrooper.ImpactBlue:Clone(), "PulseImpact", a1.impactSize, a1.heightAttachment.WorldPosition)
    LightningRing.Position = v9 + Vector3.new(0, 1, 0)
    TweenService:Create(LightningRing, TweenInfo.new(v4 + 0.15, Enum.EasingStyle.Linear), {Orientation = Vector3.new(0, 360, 0)}):Play()
    u5.Parent = a1.parent
    u63.Parent = a1.parent
    u74.Parent = a1.parent
    a1.maid:Mark(u5)
    a1.maid:Mark(u63)
    a1.maid:Mark(u74)
    EmitterManager.manualEmit(u63, "ParticleEmitter")
    EmitterManager.manualEmit(u74, "ParticleEmitter")
    local v10 = TweenInfo.new(v4, Enum.EasingStyle.Linear)
    local u129 = TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
    TweenService:Create(v1, v10, {Position = v7}):Play()
    TweenService:Create(v2, v10, {Position = v8}):Play()
    for k, n in u36 do
        TweenService:Create(n.Beam, v10, {CurveSize0 = n.CurveSize0, CurveSize1 = n.CurveSize1}):Play()
    end
    TimescaleUtilities.Delay(v4, function() -- Line: 141
        -- upvalues: u5 (val), u36 (val), TweenService (upval), u129 (val), TimescaleUtilities (upval), a1 (val)
        -- upvalues: u63 (val), u74 (val)
        if not u5.Parent then
            return
        end
        for i, j in u36 do
            TweenService:Create(j.Beam, u129, {Width0 = 0.1, Width1 = 0.1}):Play()
        end
        TimescaleUtilities.Delay(0.15, function() -- Line: 153 -- upvalues: u36 (upval), a1 (upval), u5 (upval), u63 (upval), u74 (upval)
            for i, j in u36 do
                j.Beam.Enabled = false
            end
            local v1 = u5
            a1.maid:Unmark(v1)
            v1 = u63
            a1.maid:Unmark(v1)
            v1 = u74
            a1.maid:Unmark(v1)
            u5:Destroy()
            u63:Destroy()
            u74:Destroy()
        end)
    end)
end

function v1.createLaserBeamHandler(a1) -- Line: 168
    -- upvalues: PulseTrooper (val), getEffectCleanupDelay (val), EmitterManager (val), TweenService (val)
    local u111 = PulseTrooper.Sweep:Clone()
    local Start = u111.Start
    local End = u111.End
    local u103 = {}
    local u114 = {}
    local v1 = 0
    local u116 = getEffectCleanupDelay(u111)
    Start.Anchored = true
    End.Anchored = true
    for i, j in u111:GetDescendants() do
        if j:IsA("BasePart") then
            j.Transparency = 1
        elseif j:IsA("ParticleEmitter") then
            table.insert(u114, j)
            v1 = math.max(v1, j.Lifetime.Max)
        end
        if j:IsA("Beam") then
            table.insert(u103, {Beam = j, Width0 = j.Width0, Width1 = j.Width1})
            j.Width0 = 0
            j.Width1 = 0
            j.Enabled = true
        end
    end
    EmitterManager.toggle(u111, false, "ParticleEmitter")
    EmitterManager.toggle(u111, false, "Trail")
    local u47 = CFrame.new(0, 0, -a1.length)
    local u52 = TweenInfo.new(a1.openTime, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
    local u57 = TweenInfo.new(a1.closeTime, Enum.EasingStyle.Sine, Enum.EasingDirection.In)
    local u58 = false
    local WorldCFrame = a1.attachment.WorldCFrame
    Start.CFrame = WorldCFrame
    End.CFrame = WorldCFrame * u47
    u111.Parent = a1.parent
    return {
        update = function() -- Line: 218 -- upvalues: a1 (val), Start (val), End (val), u47 (val)
            local WorldCFrame = a1.attachment.WorldCFrame
            Start.CFrame = WorldCFrame
            End.CFrame = WorldCFrame * u47
        end,
        open = function() -- Line: 224 -- upvalues: u111 (val), EmitterManager (upval), u103 (val), TweenService (upval), u52 (val)
            local v1 = u111
            EmitterManager.toggle(v1, true, "ParticleEmitter")
            EmitterManager.toggle(v1, true, "Trail")
            for i, j in u103 do
                TweenService:Create(j.Beam, u52, {Width0 = j.Width0, Width1 = j.Width1}):Play()
            end
        end,
        close = function() -- Line: 235 -- upvalues: u103 (val), TweenService (upval), u57 (val)
            for i, j in u103 do
                TweenService:Create(j.Beam, u57, {Width0 = 0, Width1 = 0}):Play()
            end
        end,
        disableParticles = function() -- Line: 244 -- upvalues: u114 (val)
            for i, j in u114 do
                j.Enabled = false
            end
        end,
        particleLifetime = v1,
        finish = function() -- Line: 250 -- upvalues: u114 (val), EmitterManager (upval), u111 (val), u116 (val)
            for i, j in u114 do
                j.Enabled = false
            end
            EmitterManager.toggle(u111, false, "Trail")
            return u116
        end,
        destroy = function() -- Line: 257 -- upvalues: u58 (ref), u111 (val), EmitterManager (upval)
            if u58 then
                return
            end
            u58 = true
            local v1 = u111
            EmitterManager.toggle(v1, false, "ParticleEmitter")
            EmitterManager.toggle(v1, false, "Trail")
            u111:Destroy()
        end,
    }
end

return v1
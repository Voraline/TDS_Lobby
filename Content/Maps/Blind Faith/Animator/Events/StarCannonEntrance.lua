-- Script path: ReplicatedStorage.Content.Maps.Blind Faith.Animator.Events.StarCannonEntrance
-- Decompile time: 10.29 ms

local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Bezier = require(ReplicatedStorage.Shared.Modules.Bezier)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local LightingUtil = require(ReplicatedStorage.Shared.Modules.LightingUtil)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService_2 = require(ReplicatedStorage.Client.Modules.TweenService)
local spr = require(ReplicatedStorage.Shared.Modules.spr)
local u66 = Random.new()
local v1 = {}

local function animateLighting() -- Line: 26 -- upvalues: LightingUtil (val), TimescaleUtilities (val), Shaker (val)
    local u2 = LightingUtil.getColorCorrection()
    u2:animate({
        saturation = 0.3,
        contrast = 1,
        tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Exponential, Enum.EasingDirection.In),
    })
    LightingUtil.animateVignette({
        transparency = 0.6,
        tweenInfo = TweenInfo.new(0.02, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
        color = Color3.new(0.698039, 0.207843, 0.980392),
    })
    TimescaleUtilities.Delay(0.1, function() -- Line: 41 -- upvalues: TimescaleUtilities (upval), LightingUtil (upval), u2 (val)
        TimescaleUtilities.Delay(0.5, function() -- Line: 42 -- upvalues: LightingUtil (upval)
            LightingUtil.animateVignette({
                transparency = 1,
                tweenInfo = TweenInfo.new(6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                color = Color3.new(0, 0, 0),
            })
        end)
        u2:animate({
            srightness = 0,
            contrast = 0,
            tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
        })
        TimescaleUtilities.Delay(1, function() -- Line: 60 -- upvalues: u2 (upval)
            u2:destroy()
        end)
    end)
    Shaker:Shake({1, 10, 0.01, 1}, 0.2, 0.5)
end

local function hideParts(a1, a2) -- Line: 68 -- types: a1: userdata, a2: boolean?
    local v1
    local v2 = {}
    local Descendants = a1:GetDescendants()
    v2[1] = a1
    v2[2] = unpack(Descendants)
    local v3 = nil
    local v4 = nil
    local v5 = a2
    for i, j in v2, v3, v4 do
        if j:IsA("BasePart") then
            j.LocalTransparencyModifier = if v5 then 1 else 0
            v1 = if v5 then false else j.Transparency < 1
            j.CanCollide = v1
        end
    end
end

local function hidePartsAndVFX(a1, a2) -- Line: 77 -- types: a1: userdata, a2: boolean?
    local v1
    local v2 = {}
    local Descendants = a1:GetDescendants()
    v2[1] = a1
    v2[2] = unpack(Descendants)
    local v3 = nil
    local v4 = nil
    local v5 = a2
    for i, j in v2, v3, v4 do
        if j:IsA("BasePart") then
            j.LocalTransparencyModifier = if v5 then 1 else 0
            v1 = if v5 then false else j.Transparency < 1
            j.CanCollide = v1
        elseif j:IsA("ParticleEmitter") or j:IsA("Beam") then
            j.Enabled = not v5
            if v5 then
                j:Clear()
            end
        end
    end
end

local function toggleProxmityPrompts(a1, a2) -- Line: 91 -- types: a1: userdata, a2: boolean
    for i, j in a1:GetDescendants() do
        if j:IsA("ProximityPrompt") then
            j.Enabled = a2
        end
    end
end

local function createTrail(a1, a2) -- Line: 99 -- upvalues: ReplicatedStorage (val) -- types: a1: userdata, a2: vector
    local v1
    local Attachment = Instance.new("Attachment")
    local Attachment_2 = Instance.new("Attachment")
    Attachment.WorldCFrame = CFrame.new(0, -a2.X * 0.3, 0)
    Attachment_2.WorldCFrame = CFrame.new(0, a2.X * 0.3, 0)
    Attachment.Parent = a1
    Attachment_2.Parent = a1
    for i, j in ReplicatedStorage.Assets.Effects.Mob.Drakobloxxer.Projectile.Model.Part["3"]:GetChildren() do
        v1 = j:Clone()
        v1.Attachment0 = Attachment
        v1.Attachment1 = Attachment_2
        v1.Parent = Attachment
    end
end

local function riftIn(a1) -- Line: 119
    -- upvalues: Maid (val), u66 (val), RunService (val), GameState (val), TweenService (val), spr (val)
    -- upvalues: EmitterManager (val), Shaker (val), EasySound (val), TimescaleUtilities (val), animateLighting (val)
    -- upvalues: createTrail (val)
    local u3 = Maid.new()
    local target = a1.target
    local complete = a1.complete
    local Effects = a1.map.Effects
    local Rift = Effects.Rifts.Rift
    local Pivot = target:GetPivot()
    local u21 = (CFrame.new(Pivot.Position * Vector3.new(1, 0, 1) + Vector3.new(0, 80, 0))) * Pivot.Rotation
    local NumberValue = Instance.new("NumberValue")
    local u39 = Vector2.new(u66:NextNumber(-0.5, 0.5), u66:NextNumber(-0.5, 0.5)) * 360
    local Model = Instance.new("Model")
    local PrimaryPart = if not target:IsA("Model") then target else target.PrimaryPart
    target.Parent = Model
    local Sound = Instance.new("Sound")
    Sound.SoundId = "rbxassetid://85772790444280"
    Sound.Parent = PrimaryPart
    Sound.Looped = true
    Sound.RollOffMinDistance = 50
    Sound.RollOffMaxDistance = 180
    Sound.RollOffMode = Enum.RollOffMode.InverseTapered
    Sound.Volume = 1.1
    Sound:Play()
    local ExtentsSize = Model:GetExtentsSize()
    Model:ScaleTo(0.3)
    local u71 = nil
    local u72 = 0
    local u73 = Vector3.new(0, 0, 0)
    local u75 = tick()
    NumberValue.Changed:Connect(function(a1) -- Line: 161 -- upvalues: Model (val)
        for i, j in Model:GetDescendants() do
            if j:IsA("BasePart") then
                j.LocalTransparencyModifier = a1
            end
        end
    end)
    u71 = RunService.Heartbeat:Connect(function(a1) -- Line: 169
        -- upvalues: GameState (upval), u72 (ref), TweenService (upval), u21 (val), Pivot (val), u39 (val), target (val)
        -- upvalues: u73 (ref), Sound (val), u75 (val), u71 (ref), spr (upval), Model (val), Effects (val)
        -- upvalues: ExtentsSize (val), u3 (val), EmitterManager (upval), Shaker (upval), EasySound (upval)
        -- upvalues: complete (val), TimescaleUtilities (upval)
        local v1 = a1 * GameState.TimeScale
        u72 = u72 + v1
        local v2 = math.clamp(u72 / 2.5, 0, 1)
        local Value = TweenService:GetValue(v2, Enum.EasingStyle.Quart, Enum.EasingDirection.In)
        local v3 = u21:Lerp(Pivot, Value)
        local v4 = u39:Lerp(Vector2.zero, Value)
        target:PivotTo(v3 * (CFrame.Angles(math.rad(v4.X), 0, (math.rad(v4.Y)))))
        local v5 = (v3.Position - Vector3.new(0, 0, 0)) / v1
        u73 = u73:Lerp(v5, (math.clamp(v1 * 5, 0, 1)))
        Sound.PlaybackSpeed = math.lerp((math.clamp(u73.Magnitude / 20, 0.5, 1.6)) + math.sin(((tick()) - u75) * 2) / 2.5, Sound.PlaybackSpeed, v1 * 4) * 0.7 * GameState.TimeScale
        if v2 >= 1 then
            u71:Disconnect()
            spr.bump(Model, 0.6, 2, {Scale = 4})
            spr.target(Model, 0.6, 2, {Scale = 1})
            local Model_2 = Instance.new("Model")
            local v6 = Effects.Explosion:Clone()
            v6:PivotTo((CFrame.new(Pivot.Position)))
            v6.Parent = Model_2
            Model_2:ScaleTo(4 * ExtentsSize.Magnitude / 10)
            Model_2.Parent = workspace.Terrain
            u3:Mark(Model_2)
            EmitterManager.manualEmit(v6)
            Shaker:Shake({1, 10, 0.01, 1}, 0.2, 0.5)
            Sound:Stop()
            EasySound.Play({
                id = 72258292922239,
                destroyOnEnd = true,
                volume = 4,
                timeScaled = true,
                position = Pivot.Position,
            })
            task.spawn(function() -- Line: 225 -- upvalues: complete (upval)
                if complete then
                    complete()
                end
            end)
            TimescaleUtilities.Delay(3, function() -- Line: 231 -- upvalues: u3 (upval)
                u3:Sweep()
            end)
        end
    end)
    local v1 = Rift:Clone()
    v1:PivotTo((CFrame.new(u21.Position)) + (Vector3.new(0, ExtentsSize.Y * 0.3, 0)))
    v1.Parent = workspace.Terrain
    v1:ScaleTo((math.max(0.6, ExtentsSize.Magnitude / 20)))
    u3:Mark(v1)
    animateLighting()
    EmitterManager.manualEmit(v1)
    task.delay(0, function() -- Line: 246
        -- upvalues: spr (upval), NumberValue (val), Model (val), TimescaleUtilities (upval), target (val)
        -- upvalues: createTrail (upval), ExtentsSize (val)
        spr.target(NumberValue, 1, 4, {Value = 0})
        spr.target(Model, 1, 2, {Scale = 1})
        TimescaleUtilities.Wait(1)
        if target:IsA("BasePart") then
            createTrail(target, target.Size)
            return
        end
        createTrail(target.PrimaryPart, ExtentsSize)
    end)
    NumberValue.Value = 1
    Model.Parent = workspace.Terrain
    u3:Mark(NumberValue)
    u3:Mark(Model)
    u3:Mark(u71)
    return u3
end

local function shootScrap(a1, a2) -- Line: 273
    -- upvalues: hideParts (val), hidePartsAndVFX (val), createTrail (val), Bezier (val), TweenService_2 (val)
    -- upvalues: TimescaleUtilities (val), ReplicatedStorage (val), EmitterManager (val), EasySound (val)
    -- upvalues: toggleProxmityPrompts (val)
    local v1 = TweenInfo.new(1, Enum.EasingStyle.Linear)
    local u130 = a1:Clone()
    local MeshPart = u130:FindFirstChildOfClass("MeshPart") or u130.PrimaryPart
    local u131 = MeshPart.Size / 2
    hideParts(u130, false)
    hidePartsAndVFX(a1, true)
    createTrail(MeshPart, u131)
    u130.Part:Destroy()
    for i, j in u130:GetDescendants() do
        if j:IsA("ParticleEmitter") or j:IsA("Beam") or j:IsA("ProximityPrompt") then
            j:Destroy()
        end
    end
    local Pivot = a2:GetPivot()
    local Pivot_2 = a1:GetPivot()
    local Magnitude = (Pivot.Position - Pivot_2.Position).Magnitude
    local u75 = Bezier.new(Pivot.Position, ((Pivot:Lerp(Pivot_2, 0.5)) + Vector3.new(0, Magnitude * 1.5, 0)).Position, Pivot_2.Position)
    local NumberValue = Instance.new("NumberValue")
    NumberValue.Value = 0
    NumberValue.Changed:Connect(function(a1) -- Line: 302 -- upvalues: u75 (val), Pivot (val), Pivot_2 (val), u130 (val)
        local v1 = u75:Get(a1)
        local Rotation = (Pivot:Lerp(Pivot_2, a1)).Rotation
        u130:PivotTo((CFrame.new(v1)) * Rotation)
    end)
    u130:PivotTo(Pivot)
    u130.Parent = workspace.Trash
    TweenService_2:Create(NumberValue, v1, {Value = 1}):Play()
    TimescaleUtilities.Delay(v1.Time, function() -- Line: 316
        -- upvalues: ReplicatedStorage (upval), Pivot_2 (val), u131 (val), EmitterManager (upval), EasySound (upval)
        -- upvalues: TimescaleUtilities (upval), hideParts (upval), a1 (val), toggleProxmityPrompts (upval)
        -- upvalues: TweenService_2 (upval), u130 (val), NumberValue (val)
        local v1, v2, v3
        local v4 = ReplicatedStorage.Assets.Effects.Particles["32GroundSmash"]:Clone()
        v4.Warning:Destroy()
        v4.Attachment.GlowfFlash:Destroy()
        v4.Attachment.GlowfFlash:Destroy()
        v4.Attachment.GlowWave:Destroy()
        v4.Attachment.Blast:Destroy()
        v4.Attachment.DarkBGSmoke:Destroy()
        v4.Attachment.Mist.Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.87),
            NumberSequenceKeypoint.new(0.298005, 0.86, 0.0625),
            (NumberSequenceKeypoint.new(1, 1)),
        })
        v4.Attachment.Crater.Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.0124154, 0.493976),
            (NumberSequenceKeypoint.new(1, 1)),
        })
        v4.Parent = workspace.Terrain
        v4.CFrame = Pivot_2 - Vector3.new(0, u131.Y, 0)
        EmitterManager.manualEmit(v4)
        EasySound.Play({
            id = 17494811439,
            volume = 1,
            destroyOnEnd = true,
            position = Pivot_2.Position,
            parent = v4,
        })
        TimescaleUtilities.Wait(1)
        hideParts(a1, false)
        toggleProxmityPrompts(a1, true)
        for i, j in a1:GetDescendants() do
            v2 = j:IsA("ParticleEmitter") or j:IsA("Beam")
            if v2 then
                j:Clear()
                j.Enabled = true
            end
            if j.Name == "Part" or v2 then
                j.LocalTransparencyModifier = 1
                v3 = TweenService_2
                v1 = TweenInfo.new(1, Enum.EasingStyle.Exponential)
                v3:Create(j, v1, {LocalTransparencyModifier = 0}):Play()
            end
        end
        u130:Destroy()
        NumberValue:Destroy()
        v4:Destroy()
    end)
end

local function setupMap(a1) -- Line: 375
    -- upvalues: hideParts (val), hidePartsAndVFX (val), toggleProxmityPrompts (val)
    local Environment = a1.Environment
    local ScrapMetal = a1.ScrapMetal
    local StarCannon = Environment.StarCannon
    hideParts(StarCannon, true)
    hidePartsAndVFX(ScrapMetal, true)
    toggleProxmityPrompts(ScrapMetal, false)
    StarCannon:SetAttribute("Used", nil)
end

function v1.init(a1) -- Line: 387 -- upvalues: hideParts (val), hidePartsAndVFX (val), toggleProxmityPrompts (val)
    local Environment = a1.Environment
    local ScrapMetal = a1.ScrapMetal
    local StarCannon = Environment.StarCannon
    hideParts(StarCannon, true)
    hidePartsAndVFX(ScrapMetal, true)
    toggleProxmityPrompts(ScrapMetal, false)
    StarCannon:SetAttribute("Used", nil)
end

function v1.run(a1) -- Line: 391 -- upvalues: hideParts (val), hidePartsAndVFX (val), toggleProxmityPrompts (val)
    local Environment = a1.Environment
    local ScrapMetal = a1.ScrapMetal
    local StarCannon = Environment.StarCannon
    hideParts(StarCannon, true)
    hidePartsAndVFX(ScrapMetal, true)
    toggleProxmityPrompts(ScrapMetal, false)
    StarCannon:SetAttribute("Used", nil)
end

function v1.cleanup(a1) -- Line: 395 -- upvalues: hideParts (val), hidePartsAndVFX (val), toggleProxmityPrompts (val)
    local Environment = a1.Environment
    local ScrapMetal = a1.ScrapMetal
    local StarCannon = Environment.StarCannon
    hideParts(StarCannon, true)
    hidePartsAndVFX(ScrapMetal, true)
    toggleProxmityPrompts(ScrapMetal, false)
    StarCannon:SetAttribute("Used", nil)
end

function v1.onWave(a1, a2) -- Line: 399
    -- upvalues: TimescaleUtilities (val), riftIn (val), shootScrap (val), TweenService_2 (val), hideParts (val)
    local StarCannon = a1.Environment:FindFirstChild("StarCannon")
    local ScrapMetal = a1.ScrapMetal
    if not StarCannon then
        return
    end
    if not (a2 < 7) and not StarCannon:GetAttribute("Used") then
        StarCannon:SetAttribute("Used", true)
        TimescaleUtilities.Wait(3)
        local Parent = StarCannon.Parent
        StarCannon.Parent = nil
        local u26 = StarCannon:Clone()
        if u26:FindFirstChild("Replicator") then
            u26.Replicator:Destroy()
        end
        for i, j in u26:GetDescendants() do
            if j:IsA("SurfaceAppearance") then
                j.Color = Color3.new(1, 1, 1)
            elseif j:IsA("BasePart") then
                j.LocalTransparencyModifier = 0
                j.Transparency = 0
            end
        end
        u26.PrimaryPart = u26.CannonFoundation.FoundationPart2
        u26.Parent = workspace.Trash
        riftIn({
            map = a1,
            target = u26,
            complete = function() -- Line: 437
                -- upvalues: ScrapMetal (val), shootScrap (upval), u26 (val), TimescaleUtilities (upval)
                -- upvalues: TweenService_2 (upval), StarCannon (val), Parent (val), hideParts (upval)
                local v1, v2
                local v3 = TweenInfo.new(1, Enum.EasingStyle.Exponential)
                for i, j in ScrapMetal:GetChildren() do
                    shootScrap(j, u26)
                end
                TimescaleUtilities.Wait(0.2)
                for k, n in u26:GetDescendants() do
                    if n:IsA("SurfaceAppearance") then
                        v2 = TweenService_2
                        v1 = {Color = Color3.new(0, 0, 0)}
                        v2:Create(n, v3, v1):Play()
                    elseif n:IsA("BasePart") then
                        TweenService_2:Create(n, v3, {Transparency = 0.8}):Play()
                    end
                end
                TimescaleUtilities.Wait(1)
                u26:Destroy()
                StarCannon.Parent = Parent
                hideParts(StarCannon, false)
            end,
        })
        return
    end
end

return v1
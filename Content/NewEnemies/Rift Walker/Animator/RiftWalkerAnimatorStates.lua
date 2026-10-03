-- Script path: ReplicatedStorage.Content.NewEnemies.Rift Walker.Animator.RiftWalkerAnimatorStates
-- Decompile time: 27.68 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local Bezier = require(ReplicatedStorage.Shared.Modules.Bezier)
local CatRom = require(ReplicatedStorage.Shared.Modules.CatRom)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
require(ReplicatedStorage.Shared.Modules.ItemDrop)
require(ReplicatedStorage.Shared.Modules.Lightning.LightningBolt)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
require(ReplicatedStorage.Client.Modules.StateManager)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService_2 = require(ReplicatedStorage.Client.Modules.TweenService)
local spr = require(ReplicatedStorage.Shared.Modules.spr)
local u90 = ReplicatedStorage.Assets.Effects.Mob["Rift Walker"]
local u94 = u90.Lord_Exo:Clone()
u94.Parent = workspace
local u96 = {}
for i, j in u94.Animations:GetChildren() do
    u96[j.Name] = (Animation.new({
        IgnorePriority = true,
        Preload = true,
        Track = j,
        Target = u94.AnimationController.Animator,
    }))
end
u94:PivotTo((CFrame.new(0, 10000, 0)))

local function validEmitter(a1) -- Line: 35
    return a1 and a1:IsA("ParticleEmitter") or a1:IsA("Trail") or a1:IsA("Beam")
end

local function toggleEmitters(a1, a2) -- Line: 39
    local v1
    for i, j in a1:GetDescendants() do
        v1 = j and j:IsA("ParticleEmitter") or j:IsA("Trail") or j:IsA("Beam")
        if v1 then
            j.Enabled = a2
        end
    end
end

local v1 = {
    name = "Death",
    onEnter = function(a1) -- Line: 70 -- upvalues: ReplicatedStorage (val), TimescaleUtilities (val), TweenService_2 (val)
        a1.sounds.MumbleLoop:Stop()
        a1.sounds.Dead:Play()
        a1.animations.Death:Play()
        a1:Delay(1.5)
        local u28 = ReplicatedStorage.Assets.Effects.Mob.FrostSpirit.PortalVFX:Clone()
        u28.Position = a1.Model.PrimaryPart.Node.WorldCFrame.Position + Vector3.new(0, 1, 0)
        u28.Parent = workspace.Terrain
        TimescaleUtilities.Delay(1, function() -- Line: 81 -- upvalues: u28 (val), a1 (val), TweenService_2 (upval)
            local v1, v2
            for i, v in ipairs(u28:GetDescendants()) do
                if v:IsA("ParticleEmitter") then
                    v.Enabled = true
                end
            end
            a1:Delay(3)
            for i2, j in a1.Model:GetDescendants() do
                if j:IsA("BasePart") then
                    v1 = TweenService_2
                    v2 = TweenInfo.new(4)
                    v1:Create(j, v2, {LocalTransparencyModifier = 1}):Play()
                end
            end
            for i3, k in ipairs(u28:GetDescendants()) do
                if k:IsA("ParticleEmitter") then
                    k.Enabled = false
                end
            end
            a1:Delay(3)
            u28:Destroy()
        end)
    end,
}
local v2 = {
    name = "NullBeam",
    onEnter = function(a1, a2) -- Line: 116
        -- upvalues: TweenService_2 (val), TimescaleUtilities (val), EffectsController (val), u90 (val)
        local u2 = {}
        for i, j in a2 do
            if not j:IsA("Folder") then
                table.insert(u2, j)
            else
                table.insert(u2, j.Parent)
            end
        end
        local v1 = Vector3.new(0, 0, 0)
        for k, n in u2 do
            v1 = v1 + n.PrimaryPart.Position
        end
        v1 = v1 / #u2
        a1:Face(v1, TweenInfo.new(0.3), true)
        a1.animations.NullBeam:Play()
        a1.sounds["NullBeam Part1"]:Play()
        a1:Delay(0.4, function() -- Line: 137
            -- upvalues: a1 (val), TweenService_2 (upval), TimescaleUtilities (upval), EffectsController (upval)
            -- upvalues: u2 (val), u90 (upval)
            local Attachment, PrimaryPart, v1, v2
            a1.sounds["NullBeam Part2"]:Play()
            a1:CameraShake(2)
            for i, j in a1.Model.StaffGlow.Value:GetDescendants() do
                v2 = j and j:IsA("ParticleEmitter") or j:IsA("Trail") or j:IsA("Beam")
                if v2 then
                    j.Enabled = true
                end
            end
            TweenService_2:Create(a1.Model.StaffGlow.Value.PointLight, TweenInfo.new(0.05), {Brightness = 15}):Play()
            local u58 = a1.Model.StaffBottom.Value.WorldPosition * Vector3.new(1, 0, 1) + Vector3.new(0, 1, 0) * a1.Model.PrimaryPart.Node.WorldPosition.Y
            TimescaleUtilities.Delay(0.05, function() -- Line: 153 -- upvalues: TweenService_2 (upval), a1 (upval), EffectsController (upval), u58 (val)
                TweenService_2:Create(
                    a1.Model.StaffGlow.Value.PointLight,
                    TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                    {Brightness = 0}
                ):Play()
                EffectsController.GroundSmash(CFrame.new(u58), 20)
            end)
            a1._beams = {}
            local v3 = nil
            local v4 = nil
            for k, n in u2, v3, v4 do
                if n and n.PrimaryPart then
                    PrimaryPart = n.PrimaryPart
                    if not PrimaryPart:FindFirstChild("RiftBeamAttachment") then
                        Attachment = Instance.new("Attachment")
                        Attachment.Name = "RiftBeamAttachment"
                        Attachment.Parent = PrimaryPart
                    end
                    for m, i5 in u90.StaffTrails:GetChildren() do
                        v1 = i5:Clone()
                        v1.Parent = a1.Model
                        v1.Attachment0 = a1.Model.StaffGlow.Value
                        v1.Attachment1 = PrimaryPart.RiftBeamAttachment
                        table.insert(a1._beams, v1)
                    end
                end
            end
            a1:Delay(0.8, function() -- Line: 186 -- upvalues: a1 (upval)
                local v1
                for i, j in a1._beams do
                    j.Enabled = false
                    j:Destroy()
                end
                a1._beams = nil
                for k, n in a1.Model.StaffGlow.Value:GetDescendants() do
                    v1 = n and n:IsA("ParticleEmitter") or n:IsA("Trail") or n:IsA("Beam")
                    if v1 then
                        n.Enabled = false
                    end
                end
            end)
        end)
        return {a1}
    end,
}
local v3 = {
    name = "NullBubbles",
    onEnter = function(a1, a2) -- Line: 226
        -- upvalues: Maid (val), u90 (val), spr (val), TweenService_2 (val), RunService (val), Bezier (val)
        -- upvalues: GameState (val), TimescaleUtilities (val)
        a1.sounds.BubbleAttack:Play()
        if a1._bubbles then
            for i, j in a1._bubbles do
                j:Destroy()
            end
            a1._bubbles = nil
        end
        local v1 = Vector3.new(0, 0, 0)
        for k, n in a2 do
            v1 = v1 + n
        end
        v1 = v1 / #a2
        a1:Face(v1, TweenInfo.new(1), true)
        a1.animations.NullBubbleStart:Play()
        a1.animations.NullBubbleLoop:Play()
        a1._nullBubbleMaid = Maid.new()
        a1._sphere = u90.Sphere:Clone()
        a1._scaleValue = {progress = 0}
        spr.target(a1._scaleValue, 0.1, 2, {progress = 2})
        TweenService_2:Create(
            a1._sphere.PrimaryPart.PointLight,
            TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
            {Brightness = 10}
        ):Play()
        local u91 = 0
        a1._nullBubbleMaid:Mark((RunService.Heartbeat:Connect(function(a1_2) -- Line: 268 -- upvalues: u91 (ref), a1 (val)
            u91 = u91 + a1_2
            a1._sphere:PivotTo(a1.Model.HandSphere.Value.WorldCFrame * (CFrame.new(0, math.sin(u91 * 3) * 0.2, (math.cos(u91 * 3)) * 0.2)))
            a1._sphere:ScaleTo((math.max(a1._scaleValue.progress, 0.01)))
        end)))
        a1._nullBubbleMaid:Mark(a1._sphere)
        a1._sphere.Parent = workspace.Trash
        a1:Delay(1, function() -- Line: 281
            -- upvalues: a2 (val), u90 (upval), a1 (val), Bezier (upval), RunService (upval), GameState (upval)
            -- upvalues: TimescaleUtilities (upval), spr (upval)
            local v1, v2
            for i, j in a2 do
                local u14 = u90.Trail:Clone()
                local u20 = a1.sounds.TrailLoop:Clone()
                u20.Parent = u14
                u20.Volume = u20.Volume * 0.3
                u20:Play()
                v2 = {
                    a1.Model.HandSphere.Value.WorldPosition + Vector3.new(0, 3, 0),
                    a1.Model.HandSphere.Value.WorldPosition + Vector3.new(0, 12, 0),
                    (a1.Model.HandSphere.Value.WorldPosition + j) / 2.3 + Vector3.new(0, 5, 0) + Vector3.new(math.random(-5, 5), 0, (math.random(-5, 5))),
                    (a1.Model.HandSphere.Value.WorldPosition + j) / 1.4 + Vector3.new(0, 5, 0) + Vector3.new(math.random(-5, 5), 0, (math.random(-5, 5))),
                    j + Vector3.new(0, 2, 0),
                    j,
                }
                local u91 = Bezier.new(unpack(v2))
                local u92 = 0
                local u93 = nil
                local u101 = Random.new():NextNumber(1.3, 2.1) / 1.25
                v1 = RunService.Heartbeat:Connect(function(a1_2) -- Line: 307
                    -- upvalues: u92 (ref), u101 (val), GameState (upval), u14 (val), u91 (val), u20 (val), u93 (ref)
                    -- upvalues: TimescaleUtilities (upval), u90 (upval), j (val), a1 (upval), spr (upval)
                    -- upvalues: RunService (upval)
                    u92 = u92 + a1_2 * u101 * GameState.TimeScale
                    local v1 = math.clamp(u92, 0, 1)
                    u14.Position = u91:Get(v1)
                    if v1 >= 1 then
                        u20:Stop()
                        u93:Disconnect()
                        TimescaleUtilities.CleanUp(u14, 2)
                        local u37 = u90.nullBubble:Clone()
                        u37:PivotTo((CFrame.new(j)))
                        u37:ScaleTo(0.1)
                        for i, j2 in u37:GetDescendants() do
                            if j2:IsA("ParticleEmitter") then
                                j2.LocalTransparencyModifier = 0.8
                            end
                        end
                        local u65 = a1.sounds.BubbleExplosion:Clone()
                        u65.PlaybackSpeed = Random.new():NextNumber(0.9, 1.1)
                        u65.Parent = u37.PrimaryPart
                        u65:Play()
                        u65.Ended:Connect(function() -- Line: 333 -- upvalues: u65 (val)
                            u65:Destroy()
                        end)
                        local v2 = a1.sounds.BubbleLoop:Clone()
                        v2.Parent = u37.PrimaryPart
                        v2.Volume = 0.3
                        v2:Play()
                        local u94 = {progress = 0}
                        spr.target(u94, 0.3, 2, {progress = 1})
                        if not a1._bubbles then
                            a1._bubbles = {}
                        end
                        table.insert(a1._bubbles, u37)
                        local u112 = nil
                        local v3 = RunService.Heartbeat:Connect(function(a1) -- Line: 357 -- upvalues: u37 (val), u94 (val), u112 (ref) -- types: a1: number
                            u37:ScaleTo((math.max(u94.progress, 0.01)))
                            if 2 <= u94.progress then
                                u112:Disconnect()
                            end
                        end)
                        u37.Parent = workspace.Trash
                    end
                end)
                u14.Position = u91:Get(0)
                u14.Parent = workspace.Trash
                TimescaleUtilities.Wait(Random.new():NextNumber(0.1, 0.3))
            end
        end)
        return {a1}
    end,
    onLeave = function(a1) -- Line: 378 -- upvalues: spr (val), TweenService_2 (val)
        a1.animations.NullBubbleLoop:Stop(0.6)
        spr.target(a1._scaleValue, 0.6, 5, {progress = 0})
        TweenService_2:Create(
            a1._sphere.PrimaryPart.PointLight,
            TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
            {Brightness = 0}
        ):Play()
        a1:Delay(1, function() -- Line: 392 -- upvalues: a1 (val)
            a1._nullBubbleMaid:Sweep()
            a1._nullBubbleMaid = nil
        end)
    end,
}
local v4 = {
    name = "DimensionalShift",
    onEnter = function(a1, a2) -- Line: 401
        -- upvalues: Maid (val), u90 (val), TweenService_2 (val), TimescaleUtilities (val), spr (val), RunService (val)
        -- upvalues: EmitterManager (val)
        task.spawn(function() -- Line: 402 -- upvalues: a1 (val)
            a1:_playAnimation("DimensionalShift")
            a1.sounds["Dimensional Shift Part1"]:Play()
        end)
        a1._beamMaid = Maid.new()
        task.spawn(function() -- Line: 409 -- upvalues: a1 (val), a2 (val), u90 (upval), TweenService_2 (upval), TimescaleUtilities (upval)
            local Position, Position_2, WeldConstraint, v1, v2, v3, v4
            a1:_waitForAnimation(1)
            local v5 = #a2
            for i = 1, v5 do
                v1 = a2[i]
                v2 = a2[i + 1]
                if not v1 or not v2 or not v1.PrimaryPart or not v2.PrimaryPart then
                    break
                end
                Position = v1.PrimaryPart.Position
                Position_2 = v2.PrimaryPart.Position
                v3 = u90.DimensionalShift.BeamEffect:Clone()
                v3.CFrame = CFrame.new(Position, Position_2)
                v3.Parent = workspace.Trash
                WeldConstraint = Instance.new("WeldConstraint")
                WeldConstraint.Part0 = v3
                WeldConstraint.Part1 = v1.PrimaryPart
                WeldConstraint.Parent = v3
                v4 = u90.DimensionalShift.Beam:Clone()
                v4.Start.Position = Position
                v4.End.Position = Position
                v4.Parent = workspace.Trash
                TweenService_2:Create(
                    v4.End,
                    TweenInfo.new(0.15, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                    {Position = Position_2}
                ):Play()
                a1._beamMaid:Mark(v3)
                a1._beamMaid:Mark(v4)
                TimescaleUtilities.Wait(0.15)
            end
        end)
        a1:_waitForAnimation(1)
        a1._shiftMaid = Maid.new()
        a1._sphere = u90.Sphere:Clone()
        a1._scaleValue = {progress = 0}
        spr.target(a1._scaleValue, 0.1, 2, {progress = 2})
        TweenService_2:Create(
            a1._sphere.PrimaryPart.PointLight,
            TweenInfo.new(0.8, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
            {Brightness = 10}
        ):Play()
        local u47 = 0
        a1._shiftMaid:Mark((RunService.Heartbeat:Connect(function(a1_2) -- Line: 483 -- upvalues: u47 (ref), a1 (val)
            u47 = u47 + a1_2
            a1._sphere:PivotTo(a1.Model.HandSphere.Value.WorldCFrame * (CFrame.new(0, math.sin(u47 * 12) * 0.2, (math.cos(u47 * 12)) * 0.2)))
            a1._sphere:ScaleTo((math.max(a1._scaleValue.progress, 0.01)))
        end)))
        a1._shiftMaid:Mark(a1._sphere)
        a1._sphere.Parent = workspace.Trash
        a1:Delay(1, function() -- Line: 496
            -- upvalues: a1 (val), a2 (val), u90 (upval), EmitterManager (upval), TimescaleUtilities (upval)
            -- upvalues: spr (upval), TweenService_2 (upval)
            local v1, v2
            a1.sounds["Dimensional Shift Part2"]:Play()
            a1._beamMaid:Sweep()
            local v3 = #a2
            for i = 1, v3 do
                v1 = a2[i]
                if v1 and v1.PrimaryPart then
                    v2 = u90.DimensionalShift.BeamExplosion:Clone()
                    v2.CFrame = v1.PrimaryPart.CFrame
                    v2.Parent = workspace.Trash
                    EmitterManager.manualEmit(v2)
                    TimescaleUtilities.CleanUp(v2, 3)
                end
            end
            spr.target(a1._scaleValue, 0.6, 5, {progress = 0})
            TweenService_2:Create(
                a1._sphere.PrimaryPart.PointLight,
                TweenInfo.new(0.6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                {Brightness = 0}
            ):Play()
            a1:Delay(1, function() -- Line: 524 -- upvalues: a1 (upval)
                a1._shiftMaid:Sweep()
                a1._shiftMaid = nil
            end)
        end)
        return {a1}
    end,
}
local v5 = {
    name = "LordExoAttack",
    onEnter = function(a1) -- Line: 538
        -- upvalues: u94 (val), u96 (val), u90 (val), Shaker (val), TweenService_2 (val), TimescaleUtilities (val)
        -- upvalues: RunService (val), CatRom (val), TweenService (val)
        a1:_playAnimation("StunnedIntro")
        a1.sounds.Exo:Play()
        a1.sounds.Exo.PlaybackSpeed = 2
        u94.PrimaryPart.CFrame = a1.Model.PrimaryPart.CFrame
        u96.Intro:Play(0)
        u96.Loop:Play(0)
        a1.animations.StunnedLoop:Play(0)
        local v1 = u90.DimensionalDischarge.Aura:Clone()
        v1.Parent = workspace.Trash
        v1:PivotTo(a1.Model.PrimaryPart.Node.WorldCFrame * (CFrame.new(0, 0.01, 0)))
        a1._aura = v1
        for i, j in u94:GetDescendants() do
            if j:IsA("ParticleEmitter") or j:IsA("Light") or j:IsA("Highlight") then
                j.Enabled = false
            end
            if j:IsA("BasePart") then
                j.LocalTransparencyModifier = 1
            end
        end
        u96.Intro.Controller:GetMarkerReachedSignal("Start"):Wait()
        a1:_flash()
        Shaker:Shake({2, 25, 0, 7, 4}, 1.25, 2)
        TweenService_2:Create(
            workspace.CurrentCamera,
            TweenInfo.new(6, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
            {FieldOfView = 60}
        ):Play()
        TimescaleUtilities.Delay(2, function() -- Line: 582 -- upvalues: a1 (val)
            a1:_animateVignette({
                transparency = 0.3,
                tweenInfo = TweenInfo.new(6, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
                color = Color3.new(0, 0, 0),
            })
        end)
        a1:_animateVignette({
            transparency = 0.6,
            tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
            color = Color3.new(1, 0.901961, 0),
        })
        a1:_animateCC({
            tweenInfo = TweenInfo.new(4, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out),
            data = {Brightness = 0.3, Contrast = 1},
        })
        TweenService_2:Create(a1.Model.TorsoGlow.Value, TweenInfo.new(0.5), {Brightness = 12}):Play()
        local u154 = 0
        a1._connectionExo = RunService.Heartbeat:Connect(function(a1_2) -- Line: 612 -- upvalues: u154 (ref), a1 (val)
            u154 = u154 + a1_2
            u154 = u154 % 1
            a1.Model.TorsoGlow.Value.Color = Color3.fromHSV(u154, 0.5, 0.5)
        end)
        for k, n in u94:GetDescendants() do
            if n:IsA("ParticleEmitter") or n:IsA("Light") or n:IsA("Highlight") then
                n.Enabled = true
            end
            if n:IsA("BasePart") then
                n.LocalTransparencyModifier = 0
            end
        end
        TimescaleUtilities.Delay(0.1, function() -- Line: 631 -- upvalues: TweenService_2 (upval), u94 (upval), a1 (val)
            TweenService_2:Create(u94.PrimaryPart, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                CFrame = CFrame.new((a1.Model.PrimaryPart.CFrame * CFrame.new(3, 4, 0)).Position, workspace.Map.LookAt.Position),
            }):Play()
        end)
        a1._aura = v1
        a1:Delay(1, function() -- Line: 646
            -- upvalues: u90 (upval), TweenService_2 (upval), u94 (upval), CatRom (upval), TimescaleUtilities (upval)
            -- upvalues: a1 (val), RunService (upval), TweenService (upval)
            local u158 = u90.Sword:Clone()
            u158.Color = Color3.new(1, 1, 1)
            u158.Transparency = 1
            for i, j in u158:GetDescendants() do
                if j:IsA("ParticleEmitter") or j:IsA("Trail") then
                    j.Enabled = false
                end
            end
            u158.Parent = workspace
            local NumberValue = Instance.new("NumberValue")
            NumberValue.Value = 680
            local NumberValue_2 = Instance.new("NumberValue")
            NumberValue_2.Value = 1
            TweenService_2:Create(NumberValue, TweenInfo.new(4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Value = 0}):Play()
            local v1 = {
                u94.PrimaryPart.Root.Torso.WorldCFrame * CFrame.new(0, 12, 4) * CFrame.Angles(0, 3.141592653589793, 0),
                u94.PrimaryPart.Root.Torso.WorldCFrame * CFrame.new(0, 6, 8) * CFrame.Angles(0, 3.141592653589793, 0),
                u94.PrimaryPart.Root.Torso.WorldCFrame * CFrame.new(4, 0, 0) * CFrame.Angles(1.6580627893946132, 3.141592653589793, 0),
            }
            local u104 = CatRom.new(v1, 0.5, 0)
            local u105 = 0
            TweenService_2:Create(u158, TweenInfo.new(2), {Transparency = 0}):Play()
            TweenService_2:Create(u158, TweenInfo.new(2), {Color = Color3.fromRGB(43, 36, 98)}):Play()
            TimescaleUtilities.Delay(2, function() -- Line: 693 -- upvalues: TweenService_2 (upval), NumberValue_2 (val), u158 (val)
                TweenService_2:Create(NumberValue_2, TweenInfo.new(5), {Value = 0.55}):Play()
                TweenService_2:Create(
                    u158,
                    TweenInfo.new(4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
                    {Color = Color3.new(1, 0.27451, 0.929412)}
                ):Play()
                for i, j in u158:GetDescendants() do
                    if j:IsA("ParticleEmitter") or j:IsA("Trail") then
                        j.Enabled = true
                    end
                end
            end)
            a1._sword = u158
            a1._lordExoConnection = RunService.Heartbeat:Connect(function(a1) -- Line: 712
                -- upvalues: u105 (ref), TweenService (upval), NumberValue_2 (val), u104 (val), u158 (val)
                -- upvalues: NumberValue (val)
                u105 = u105 + a1 / 2
                local v1 = math.clamp(u105, 0, 1)
                local Value = TweenService:GetValue(v1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
                local v2 = (CFrame.new(Random.new():NextNumber(-1, 1), Random.new():NextNumber(-1, 2), Random.new():NextNumber(-1, 1))):Lerp(
                    CFrame.new(),
                    NumberValue_2.Value
                )
                u158.CFrame = (u104:SolveRotCFrame(Value)) * CFrame.new(0, math.sin((tick())) * 0.5, math.cos((tick())) * 0.8) * CFrame.Angles(math.rad(NumberValue.Value), 0, 0) * v2
            end)
        end)
        return {a1}
    end,
    onLeave = function() -- Line: 740 -- upvalues: TweenService_2 (val)
        TweenService_2:Create(
            workspace.CurrentCamera,
            TweenInfo.new(4, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out),
            {FieldOfView = 70}
        ):Play()
    end,
}
local v6 = {
    name = "LordExoSuccess",
    onEnter = function(a1) -- Line: 753 -- upvalues: u96 (val), TweenService_2 (val), u94 (val)
        a1._lordExoConnection:Disconnect()
        a1._connectionExo:Disconnect()
        a1._sword:Destroy()
        a1._aura:Destroy()
        a1:_flash()
        a1:_animateVignette({
            transparency = 1,
            tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
            color = Color3.new(0, 0, 0),
        })
        a1:_animateCC({
            tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
            data = {Brightness = 0, Contrast = 0},
        })
        u96.Lost:Play()
        u96.Lost.Controller:GetMarkerReachedSignal("Stop"):Wait()
        a1.animations.StunnedOutro:Play()
        a1.animations.StunnedLoop:Stop(0)
        TweenService_2:Create(a1.Model.TorsoGlow.Value, TweenInfo.new(0.5), {Brightness = 0}):Play()
        for i, j in u94:GetDescendants() do
            if j:IsA("ParticleEmitter") or j:IsA("Light") or j:IsA("Highlight") then
                j.Enabled = false
            end
            if j:IsA("BasePart") then
                j.LocalTransparencyModifier = 1
            end
        end
        u94:PivotTo((CFrame.new(0, 10000, 0)))
    end,
}
local v7 = {
    name = "LordExoFail",
    onEnter = function(a1) -- Line: 802 -- upvalues: u90 (val), TweenService_2 (val), TimescaleUtilities (val), u96 (val), u94 (val)
        pcall(function() -- Line: 803 -- upvalues: a1 (val), u90 (upval), TweenService_2 (upval), TimescaleUtilities (upval)
            local CFrame_2 = a1._sword.CFrame
            local u7 = u90.SwordMain:Clone()
            u7.CFrame = CFrame_2
            u7.Parent = workspace.Trash
            TweenService_2:Create(u7, TweenInfo.new(0.75, Enum.EasingStyle.Linear), {
                CFrame = workspace.Map.LookAt.CFrame * CFrame.Angles(0, -1.5707963267948966, 0) * CFrame.Angles(-1.5707963267948966, 0, 0),
            }):Play()
            TimescaleUtilities.Delay(0.75, function() -- Line: 816 -- upvalues: u7 (val), TimescaleUtilities (upval)
                u7.Transparency = 1
                for i, j in u7:GetDescendants() do
                    if j:IsA("ParticleEmitter") or j:IsA("Trail") then
                        j.Enabled = false
                    end
                end
                TimescaleUtilities.CleanUp(u7, 4)
            end)
        end)
        a1._lordExoConnection:Disconnect()
        a1._connectionExo:Disconnect()
        a1._sword:Destroy()
        a1._aura:Destroy()
        a1:_flash()
        a1:_animateVignette({
            transparency = 1,
            tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
            color = Color3.new(0, 0, 0),
        })
        a1:_animateCC({
            tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
            data = {Brightness = 0, Contrast = 0},
        })
        u96.Won:Play()
        u96.Won.Controller:GetMarkerReachedSignal("Stop"):Wait()
        a1.animations.StunnedOutro:Play()
        a1.animations.StunnedLoop:Stop(0)
        TweenService_2:Create(a1.Model.TorsoGlow.Value, TweenInfo.new(0.5), {Brightness = 0}):Play()
        for i, j in u94:GetDescendants() do
            if j:IsA("ParticleEmitter") or j:IsA("Light") or j:IsA("Highlight") then
                j.Enabled = false
            end
            if j:IsA("BasePart") then
                j.LocalTransparencyModifier = 1
            end
        end
        u94:PivotTo((CFrame.new(0, 10000, 0)))
    end,
}
local v8 = {
    name = "RageMode",
    onEnter = function(a1) -- Line: 875 -- upvalues: TweenService_2 (val), EffectsController (val), TimescaleUtilities (val)
        local v1
        a1.sounds.Rage:Play()
        local Phase2Rage = a1.animations.Phase2Rage
        Phase2Rage:Play()
        a1.sounds.MumbleLoop.Volume = 2
        a1.sounds.MumbleLoop:Play()
        ;(Phase2Rage.Controller:GetMarkerReachedSignal("Slam")):Connect(function() -- Line: 884
            -- upvalues: a1 (val), TweenService_2 (upval), EffectsController (upval), TimescaleUtilities (upval)
            a1:CameraShake(1)
            TweenService_2:Create(a1.Model.StaffGlow.Value.PointLight, TweenInfo.new(0.08), {Brightness = 15}):Play()
            local v1 = a1.Model.StaffBottom.Value.WorldPosition * Vector3.new(1, 0, 1) + Vector3.new(0, 1, 0) * a1.Model.PrimaryPart.Node.WorldPosition.Y
            EffectsController.GroundSmash(CFrame.new(v1), 10)
            TimescaleUtilities.Delay(0.08, function() -- Line: 900 -- upvalues: TweenService_2 (upval), a1 (upval)
                TweenService_2:Create(
                    a1.Model.StaffGlow.Value.PointLight,
                    TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                    {Brightness = 0}
                ):Play()
            end)
        end)
        for i, j in a1.Model.StaffGlow.Value:GetDescendants() do
            v1 = j and j:IsA("ParticleEmitter") or j:IsA("Trail") or j:IsA("Beam")
            if v1 then
                j.Enabled = true
            end
        end
        TweenService_2:Create(
            a1.Model.StaffGlow.Value.PointLight,
            TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
            {Brightness = 5}
        ):Play()
        a1:Delay(3, function() -- Line: 917 -- upvalues: a1 (val)
            local v1
            for i, j in a1.Model.StaffGlow.Value:GetDescendants() do
                v1 = j and j:IsA("ParticleEmitter") or j:IsA("Trail") or j:IsA("Beam")
                if v1 then
                    j.Enabled = false
                end
            end
        end)
        return {a1}
    end,
}
local v9 = {
    name = "DimensionalDischarge",
    onEnter = function(a1, a2) -- Line: 939
        -- upvalues: TweenService_2 (val), u90 (val), TimescaleUtilities (val), spr (val), RunService (val)
        -- upvalues: Shaker (val), GameState (val), EmitterManager (val)
        local v1
        local DimensionalDischarge = a1.animations.DimensionalDischarge
        DimensionalDischarge:Play(0.5)
        DimensionalDischarge:AdjustSpeed(DimensionalDischarge.Controller.Length / 6)
        a1.sounds["Dimensional Discharge Part1"]:Play()
        for i, j in a1.Model.StaffGlow.Value:GetDescendants() do
            v1 = j and j:IsA("ParticleEmitter") or j:IsA("Trail") or j:IsA("Beam")
            if v1 then
                j.Enabled = true
            end
        end
        a1:Delay(5, function() -- Line: 947 -- upvalues: a1 (val)
            local v1
            for i, j in a1.Model.StaffGlow.Value:GetDescendants() do
                v1 = j and j:IsA("ParticleEmitter") or j:IsA("Trail") or j:IsA("Beam")
                if v1 then
                    j.Enabled = false
                end
            end
        end)
        TweenService_2:Create(
            a1.Model.StaffGlow.Value.PointLight,
            TweenInfo.new(4, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
            {Brightness = 15}
        ):Play()
        local u61 = u90.Orbs:Clone()
        u61.Parent = workspace.Trash
        u61.AnimationController:LoadAnimation(u61.Animations.Orb):Play(0)
        u61.Root.CFrame = a1.Model.PrimaryPart.Node.WorldCFrame
        TweenService_2:Create(
            u61.Root,
            TweenInfo.new(4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
            {CFrame = a1.Model.PrimaryPart.CFrame * CFrame.new(0, 8, 0)}
        ):Play()
        local u107 = u90.DimensionalDischarge.BigOrb:Clone()
        u107:ScaleTo(0.01)
        u107.Parent = workspace.Trash
        local u119 = u90.DimensionalDischarge.Aura:Clone()
        u119.Parent = workspace.Trash
        a1:Delay(1, function() -- Line: 977 -- upvalues: a1 (val)
            a1.sounds["Dimensional Discharge Part2"]:Play()
        end)
        local u127 = {value = 0}
        u107:PivotTo(u61.Root.CFrame)
        TimescaleUtilities.Delay(3, function() -- Line: 985 -- upvalues: spr (upval), u127 (val), a1 (val)
            spr.target(u127, 0.9, 0.5, {value = 1})
            a1.sounds["Dimensional Discharge Part3"]:Play()
        end)
        a1._bigOrbConnection = RunService.Heartbeat:Connect(function(a1_2) -- Line: 992 -- upvalues: u119 (val), a1 (val), u61 (val), u107 (val), u127 (val)
            u119:PivotTo(a1.Model.PrimaryPart.Node.WorldCFrame * (CFrame.new(0, 0.01, 0)))
            if u61 and u61.Parent then
                u107:PivotTo(u61.Offset.CFrame * (CFrame.new(0, math.sin((tick()) * 5) * 0.3, 0)))
            end
            u107:ScaleTo((math.max(u127.value, 0.01)))
        end)
        Shaker:Shake({0.8, 15, 4, 0, 12}, 5, 1)
        TweenService_2:Create(
            workspace.CurrentCamera,
            TweenInfo.new(5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
            {FieldOfView = 60}
        ):Play()
        a1:_animateVignette({
            transparency = 0.4,
            tweenInfo = TweenInfo.new(5, Enum.EasingStyle.Exponential, Enum.EasingDirection.In),
            color = Color3.new(0.968627, 0, 1),
        })
        a1:_animateCC({
            tweenInfo = TweenInfo.new(4, Enum.EasingStyle.Exponential, Enum.EasingDirection.In),
            data = {Brightness = 0.3, Contrast = 2},
        })
        a1:Delay(5.0001)
        a1.sounds["Dimensional Discharge Boom"]:Play()
        TweenService_2:Create(
            a1.Model.StaffGlow.Value.PointLight,
            TweenInfo.new(3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
            {Brightness = 0}
        ):Play()
        TweenService_2:Create(
            workspace.CurrentCamera,
            TweenInfo.new(5, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out),
            {FieldOfView = 70}
        ):Play()
        a1:_animateVignette({
            transparency = 1,
            tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
            color = Color3.new(0.968627, 0, 1),
        })
        a1:_animateCC({
            tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
            data = {Brightness = 0, Contrast = 0},
        })
        a1:_flash()
        spr.target(u127, 0.2, 4, {value = 4})
        TimescaleUtilities.Delay(2, function() -- Line: 1063 -- upvalues: a1 (val)
            a1._bigOrbConnection:Disconnect()
        end)
        u61:Destroy()
        GameState.Replicator:Set("WaveGlitch", true)
        TimescaleUtilities.Delay(0.3, function() -- Line: 1070 -- upvalues: GameState (upval)
            GameState.Replicator:Set("WaveGlitch", false)
        end)
        TimescaleUtilities.Delay(0.2, function() -- Line: 1074 -- upvalues: TweenService_2 (upval), u107 (val), u119 (val)
            TweenService_2:Create(u107.PrimaryPart, TweenInfo.new(0.5), {Transparency = 1}):Play()
            for i, j in u107:GetDescendants() do
                if j:IsA("ParticleEmitter") then
                    j.Enabled = false
                end
            end
            for k, n in u119:GetDescendants() do
                if n:IsA("ParticleEmitter") then
                    n.Enabled = false
                end
            end
        end)
        TimescaleUtilities.CleanUp(u107, 4)
        TimescaleUtilities.CleanUp(u119, 4)
        local v2 = u90.DimensionalDischarge.Explosion:Clone()
        v2.Position = a1.Model.PrimaryPart.Node.WorldPosition + Vector3.new(0, 0.009999999776482582, 0)
        v2.Parent = workspace.Trash
        EmitterManager.manualEmit(v2)
        TimescaleUtilities.CleanUp(v2, 4)
        Shaker:Shake({0.8, 8, 0, 5, 6}, 0.2, 1)
        return {a1}
    end,
}
return {
    {
        name = "Walk",
        onEnter = function(a1) -- Line: 49
            a1:_continueWalk()
            return {a1}
        end,
        onLeave = function(a1) end,
    },
    {
        name = "WalkOutro",
        onEnter = function(a1) -- Line: 60
            return {a1}
        end,
        onLeave = function(a1) end,
    },
    v1,
    v2,
    {
        name = "NullInvasion",
        onEnter = function(a1) -- Line: 204
            local v1
            for i, j in a1.Model.StaffGlow.Value:GetDescendants() do
                v1 = j and j:IsA("ParticleEmitter") or j:IsA("Trail") or j:IsA("Beam")
                if v1 then
                    j.Enabled = true
                end
            end
            a1.animations.NullInvasion:Play()
            a1.sounds["Null Invasion Part1"]:Play()
            a1:Delay(1.3, function() -- Line: 210 -- upvalues: a1 (val)
                a1.sounds["Null Invasion Part2"]:Play()
            end)
            a1:Delay(2.5, function() -- Line: 214 -- upvalues: a1 (val)
                local v1
                for i, j in a1.Model.StaffGlow.Value:GetDescendants() do
                    v1 = j and j:IsA("ParticleEmitter") or j:IsA("Trail") or j:IsA("Beam")
                    if v1 then
                        j.Enabled = false
                    end
                end
            end)
            return {a1}
        end,
    },
    v3,
    v4,
    v9,
    v8,
    v5,
    {
        name = "LaneSwap",
        onEnter = function(a1, a2, a3) -- Line: 929
            a1:_playAnimation("LaneSwitch")
            return {a1}
        end,
    },
    v6,
    v7,
}
-- Script path: ReplicatedStorage.Content.NewEnemies.Void Reaver.Animator
-- Decompile time: 9.32 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local LightningBolt = require(ReplicatedStorage.Shared.Modules.Lightning.LightningBolt)
local ServerTicks = require(ReplicatedStorage.Shared.Modules.ServerTicks)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local StateManager = require(ReplicatedStorage.Client.Modules.StateManager)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local VignetteStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.VignetteStore)
local spr = require(ReplicatedStorage.Shared.Modules.spr)
local VoidReaver = ReplicatedStorage.Assets.Effects.Mob.VoidReaver
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 26
    -- upvalues: VoidReaver (val), StateManager (val), TimescaleUtilities (val), Animation (val), TweenService (val)
    -- upvalues: spr (val), ServerTicks (val), RunService (val), LightningBolt (val), EmitterManager (val)
    local Sound, v1, volume
    for i, j in VoidReaver:GetDescendants() do
        if j:GetAttribute("WorldPivot") and j:IsA("Model") then
            j.WorldPivot = j:GetAttribute("WorldPivot")
        end
    end
    local Animations = a1.Model:WaitForChild("Animations")
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    a1.stateManager = StateManager.new()
    a1.animations = {}
    a1.sounds = {}
    local v2 = nil
    local v3 = nil
    for k, n in a1.Stats.Sounds, v2, v3 do
        Sound = Instance.new("Sound")
        Sound.Name = k
        Sound.SoundId = "rbxassetid://" .. n.id
        Sound.RollOffMaxDistance = a1.Stats.SoundEmitter.RollOffMaxDistance
        Sound.RollOffMinDistance = a1.Stats.SoundEmitter.RollOffMinDistance
        Sound.RollOffMode = a1.Stats.SoundEmitter.RollOffMode
        Sound.Parent = a1.Model.PrimaryPart
        Sound.Looped = n.looped or false
        volume = n.volume or a1.Stats.SoundEmitter.Volume or 0.5
        Sound.Volume = volume
        a1.sounds[k] = Sound
    end

    function a1:_playSound(a2, a3) -- Line: 55
        -- upvalues: TimescaleUtilities (upval)
        if a3 then
            local u7 = self.sounds[a2]:Clone()
            u7.Parent = self.Model.PrimaryPart
            u7:Play()
            TimescaleUtilities.Delay(u7.TimeLength + 1, function() -- Line: 60 -- upvalues: u7 (val)
                u7:Destroy()
            end)
        end
        local v1 = self.sounds[a2]
        if v1 then
            v1:Play()
        end
    end

    function a1._stopSound(a1, a2) -- Line: 71 -- types: a1: table, a2: string
        local v1 = a1.sounds[a2]
        if v1 then
            v1:Stop()
        end
    end

    for m, i5 in (Animations:GetChildren()) do
        v1 = Animation.new({
            IgnorePriority = true,
            Preload = true,
            Track = i5,
            Target = AnimationController,
            Entity = {TimeScaled = true},
        })
        a1.animations[i5.Name] = v1
    end

    local function connectStompSound(a1_2, a2) -- Line: 91 -- upvalues: a1 (val)
        if a2 then
            return (a2:GetMarkerReachedSignal("Stomp")):Connect(function() -- Line: 93 -- upvalues: a1 (upval)
                if not a1:IsAlive() then
                    return
                end
                if not (math.random() < 0.5) then
                    a1.sounds.stomp2:Play()
                else
                    a1.sounds.stomp1:Play()
                end
                a1:_shakeProximity(3, 60)
            end)
        end
        return (a1_2.Controller:GetMarkerReachedSignal("Stomp")):Connect(function() -- Line: 108 -- upvalues: a1 (upval)
            if a1._finalStand or not a1:IsAlive() then
                return
            end
            if not (math.random() < 0.5) then
                a1.sounds.stomp2:Play()
            else
                a1.sounds.stomp1:Play()
            end
            a1:_shakeProximity(3, 50)
        end)
    end

    task.defer(function() -- Line: 127 -- upvalues: a1 (val), connectStompSound (val)
        a1.Maid:Mark((connectStompSound(nil, a1.WalkTrack)))
        a1.Maid:Mark((connectStompSound(nil, a1.RageWalkAnimation)))
    end)
    a1._connectStompSound = connectStompSound
    a1.stateManager:addStates((require(script:WaitForChild("VoidReaverAnimatorStates"))))
    a1.stateManager:changeState("Walk", a1)

    function a1:_fadeInSound(a2, a3) -- Line: 138
        -- upvalues: TweenService (upval)
        local v1 = self.sounds[a2]
        if v1 then
            v1.Volume = 0
            v1:Play()
            TweenService:Create(
                v1,
                TweenInfo.new(a3, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
                {Volume = self.Stats.SoundEmitter.Volume or 0.5}
            ):Play()
        end
    end

    function a1:_fadeOutSound(a2, a3) -- Line: 151
        -- upvalues: TweenService (upval), TimescaleUtilities (upval)
        local u4 = self.sounds[a2]
        if u4 then
            TweenService:Create(u4, TweenInfo.new(a3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Volume = 0}):Play()
            TimescaleUtilities.Delay(a3, function() -- Line: 160 -- upvalues: u4 (val)
                u4:Stop()
            end)
        end
    end

    a1.Executables = {
        ShieldApplied = function() -- Line: 167 -- upvalues: a1 (val)
            for i, j in a1.Model.Shield:GetDescendants() do
                if j:IsA("ParticleEmitter") then
                    j.Enabled = true
                end
            end
            a1:_fadeInSound("healing", 0.5)
        end,
        ShieldRemoved = function() -- Line: 176 -- upvalues: a1 (val)
            for i, j in a1.Model.Shield:GetDescendants() do
                if j:IsA("ParticleEmitter") then
                    j.Enabled = false
                end
            end
            a1:_fadeOutSound("healing", 0.5)
        end,
        ProjectileEffect = function(a1_2, a2, a3, a4) -- Line: 186
            -- upvalues: VoidReaver (upval), spr (upval), ServerTicks (upval), RunService (upval), TweenService (upval)
            -- upvalues: TimescaleUtilities (upval), a1 (val)
            local u8 = VoidReaver.Wave:Clone()
            u8:PivotTo((CFrame.new(a2, a3)))
            local Rotation = u8:GetPivot().Rotation
            u8.Parent = workspace
            u8:ScaleTo(0.01)
            local u25 = {scale = 0.01}
            spr.target(u25, 0.3, 0.6, {scale = 1})
            local u35 = ServerTicks.getTime()
            local u41 = RunService.Heartbeat:Connect(function() -- Line: 202 -- upvalues: u8 (val), u25 (val)
                u8:ScaleTo((math.max(u25.scale, 0.01)))
            end)
            local u42 = u35 - a1_2
            local u43 = nil
            u43 = RunService.Heartbeat:Connect(function() -- Line: 208
                -- upvalues: ServerTicks (upval), u35 (val), u42 (ref), a2 (val), a3 (val), a4 (val), u8 (val)
                -- upvalues: Rotation (val), TweenService (upval), spr (upval), u25 (val), TimescaleUtilities (upval)
                -- upvalues: u41 (val), u43 (ref)
                local v1 = ServerTicks.getTime() - u35
                u42 = u42 + v1
                local v2 = (a2:Lerp(a3, u42 / a4.ProjectileTime)) + Vector3.new(0, 2.5, 0)
                u8:PivotTo((CFrame.new(v2)) * Rotation)
                if a4.ProjectileTime <= u42 then
                    local v3, v4
                    for i, j in u8:GetDescendants() do
                        if j:IsA("BasePart") then
                            v4 = TweenService
                            v3 = TweenInfo.new(0.35)
                            v4:Create(j, v3, {Transparency = 1}):Play()
                        end
                        if j:IsA("ParticleEmitter") then
                            j.Enabled = false
                        end
                        if j:IsA("Beam") then
                            v4 = TweenService
                            v3 = TweenInfo.new(0.35)
                            v4:Create(j, v3, {Width0 = 0, Width1 = 0}):Play()
                        end
                    end
                    spr.target(u25, 0.9, 0.8, {scale = 0})
                    TimescaleUtilities.Delay(3, function() -- Line: 239 -- upvalues: u8 (upval), u41 (upval)
                        u8:Destroy()
                        u41:Disconnect()
                    end)
                    if u43.Connected then
                        u43:Disconnect()
                        u43 = nil
                    end
                end
            end)
            a1.Maid:Mark(u43)
        end,
        VoidRuptureEffect = function(a1_2) -- Line: 254
            -- upvalues: VoidReaver (upval), TweenService (upval), TimescaleUtilities (upval), a1 (val)
            -- upvalues: LightningBolt (upval), EmitterManager (upval)
            local v1, v2
            local u5 = VoidReaver.Slash:Clone()
            u5:PivotTo(a1_2)
            local Frame = u5.Part.SurfaceGui.Frame
            Frame.UIScale.Scale = 0.2
            Frame.Parent.Brightness = 0
            TweenService:Create(
                u5.Part.Light.PointLight,
                TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
                {Brightness = 25}
            ):Play()
            TweenService:Create(Frame.Parent, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Brightness = 50}):Play()
            for i, j in Frame:GetChildren() do
                if j:IsA("ImageLabel") then
                    j.ImageTransparency = 1
                    v2 = TweenService
                    v1 = TweenInfo.new(0.35, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
                    v2:Create(j, v1, {ImageTransparency = 0}):Play()
                    TimescaleUtilities.Delay(1, function() -- Line: 289 -- upvalues: TweenService (upval), j (val)
                        TweenService:Create(j, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {ImageTransparency = 1}):Play()
                    end)
                end
            end
            TweenService:Create(Frame.UIScale, TweenInfo.new(0.65, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Scale = 1}):Play()
            TimescaleUtilities.Delay(1, function() -- Line: 305 -- upvalues: TweenService (upval), u5 (val), Frame (val)
                TweenService:Create(
                    u5.Part.Light.PointLight,
                    TweenInfo.new(0.75, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
                    {Brightness = 0}
                ):Play()
                TweenService:Create(Frame.UIScale, TweenInfo.new(0.65, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {Scale = 0.1}):Play()
            end)
            a1:Delay(0.65, function() -- Line: 321 -- upvalues: u5 (val), LightningBolt (upval), TimescaleUtilities (upval), EmitterManager (upval)
                local v1 = {
                    WorldAxis = Vector3.new(0, 0, 1),
                    WorldPosition = u5.Part.Position,
                }
                local u11 = LightningBolt.new(u5.Part.Above, v1, 25)
                u11.Thickness = 2
                u11.Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                    (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 51, 177))),
                })
                u11.MaxRadius = 1.25
                u11.PulseSpeed = 9.8
                u11.AnimationSpeed = 23
                TimescaleUtilities.Delay(0.22, function() -- Line: 335 -- upvalues: u11 (val)
                    u11:DestroyDissipate(0.85)
                end)
                EmitterManager.manualEmit(u5)
                TimescaleUtilities.CleanUp(u5, 4)
            end)
            u5.Parent = workspace
        end,
        Knocked = function(a1_2) -- Line: 346 -- upvalues: a1 (val) -- types: a1_2: boolean
            a1:_knockAnimation(a1_2)
        end,
        CurseTower = function(a1_2) -- Line: 350 -- upvalues: a1 (val) -- types: a1_2: userdata
            local PrimaryPart = a1_2 and a1_2.PrimaryPart
            if PrimaryPart then
                a1:Face(PrimaryPart.Position, (TweenInfo.new(0.5)))
            end
        end,
        ChangeState = function(a1_2, ...) -- Line: 357 -- upvalues: a1 (val) -- types: a1_2: string
            a1.stateManager:changeState(a1_2, a1, ...)
        end,
    }
end

function v1._chargeSwordEffect(a1, a2, a3) -- Line: 363
    -- upvalues: VoidReaver (val), TimescaleUtilities (val)
    if not a2 then
        if a1._chargeEffect then
            for i, j in a1._chargeEffect:GetDescendants() do
                if j:IsA("ParticleEmitter") then
                    j.Enabled = false
                end
            end
            TimescaleUtilities.CleanUp(a1._chargeEffect, 4)
        end
        return
    end
    local v1 = VoidReaver.ChargeUp:Clone()
    v1:ScaleTo(a3 or 1)
    v1.PrimaryPart.RigidConstraint.Attachment1 = a1.Model.SwordTip.Value
    for k, n in v1:GetDescendants() do
        if n:IsA("ParticleEmitter") then
            n.Enabled = true
        end
    end
    v1.Parent = workspace.Trash
    a1._chargeEffect = v1
end

function v1:_shakeProximity(a2, a3) -- Line: 389 -- upvalues: Shaker (val) -- types: self: table, a2: number, a3: number
    Shaker:Shake({a2, 15, 0, 1}, 0.01, 0.6, {position = self.Model.PrimaryPart.Position, radius = a3})
end

function v1._shake(a1, a2) -- Line: 406 -- upvalues: Shaker (val) -- types: a1: table, a2: table
    return Shaker:Shake({a2.mag, a2.rough, a2.fadeIn, a2.posInfluence, a2.rotInfluence}, a2.cancelTime, a2.fadeOut)
end

function v1:_emissiveTween(a2) -- Line: 414 -- upvalues: TweenService (val) -- types: self: table, a2: boolean
    local RageObjects, v1, v2, v3
    for i, j in self.Model:GetDescendants() do
        if j:IsA("SurfaceAppearance") then
            RageObjects = self.Model.RageObjects
            if not j:IsDescendantOf(RageObjects) then
                if not a2 then
                    v3 = TweenService
                    v1 = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
                    v2 = {EmissiveTint = Color3.fromRGB(0, 0, 0)}
                else
                    v3 = TweenService
                    v1 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
                    v2 = {EmissiveTint = Color3.fromRGB(218, 85, 255)}
                end
                v3:Create(j, v1, v2):Play()
            end
        end
    end
end

function v1:_knockAnimation(a2) -- Line: 436
    -- upvalues: TweenService (val), TimescaleUtilities (val)
    if self._knockedThread then
        task.cancel(self._knockedThread)
        self._knockedThread = nil
    end
    if not a2 then
        if self._didRage then
            for i, j in self.Model.RageBeams.Value:GetChildren() do
                j.Enabled = true
            end
        end
        self:_playSound("revive")
        self:_emissiveTween(true)
        self:_stopAnimation("DeathFake")
        self:_playAnimation("Revive")
        return
    end
    TweenService:Create(
        workspace.CurrentCamera,
        TweenInfo.new(0.1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
        {FieldOfView = 60}
    ):Play()
    TimescaleUtilities.Delay(0.1, function() -- Line: 451 -- upvalues: TweenService (upval)
        TweenService:Create(
            workspace.CurrentCamera,
            TweenInfo.new(4, Enum.EasingStyle.Circular, Enum.EasingDirection.Out),
            {FieldOfView = 70}
        ):Play()
    end)
    self:_animateVignette({
        transparency = 0,
        tweenInfo = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        color = Color3.fromRGB(116, 66, 255),
    })
    TimescaleUtilities.Delay(0.05, function() -- Line: 467 -- upvalues: self (val)
        self:_animateVignette({
            transparency = 1,
            tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
            color = Color3.fromRGB(255, 255, 255),
        })
    end)
    for k, n in self.Model.RageBeams.Value:GetChildren() do
        n.Enabled = false
    end
    self:_emissiveTween(false)
    self:_playSound("rupture_cancel")
    local u75 = self:_playAnimation("DeathFake")
    if self._knockedLength then
        u75:AdjustSpeed(self._knockedLength)
    end
    local Length = u75.Controller.Length
    if not self._knockedLength then
        self._knockedLength = u75.Speed
    end
    self._knockedThread = TimescaleUtilities.Delay(Length - 0.1, function() -- Line: 499 -- upvalues: u75 (val)
        u75:AdjustSpeed(0)
    end)
end

function v1._animateVignette(a1, a2) -- Line: 517 -- upvalues: VignetteStore (val)
    VignetteStore.setAnimationData({transparency = a2.transparency, tweenInfo = a2.tweenInfo, color = a2.color})
end

function v1:_playAnimation(a2, a3) -- Line: 525 -- types: self: table, a2: string, a3: number?
    local v1 = self.animations[a2]
    if v1 then
        v1:Play(a3)
    end
    return v1
end

function v1:_stopAnimation(a2) -- Line: 533 -- types: self: table, a2: string
    local v1 = self.animations[a2]
    if v1 then
        v1:Stop()
    end
end

return v1
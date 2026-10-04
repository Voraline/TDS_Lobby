-- Script path: ReplicatedStorage.Content.Tower.Accelerator.Animator
-- Decompile time: 25.71 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local LightningBolt = require(ReplicatedStorage.Shared.Modules.Lightning.LightningBolt)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local SharedControllerFunctions = require(ReplicatedStorage.Client.Modules.SharedControllerFunctions)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 20
    -- upvalues: EasySound (val), Animation (val), SharedControllerFunctions (val), TweenService (val)
    -- upvalues: EmitterManager (val), GameState (val), RunService (val), ReplicatedStorage (val), LightningBolt (val)
    local FBXModel = a1.FBXModel
    if FBXModel then
        FBXModel = a1.Model:FindFirstChild("RootPart")
        if not FBXModel then
            FBXModel = a1.Model:FindFirstChild("HumanoidRootPart")
        end
    end
    local Wind = if not a1.FBXModel then a1.Model.Head:FindFirstChild("Wind") else FBXModel:FindFirstChild("Wind")
    local Laser = if not a1.FBXModel then a1.Model.Head:FindFirstChild("Laser") else FBXModel:FindFirstChild("Laser")
    a1._windPlayer = nil
    a1._laserPlayer = nil
    a1.Maid:Mark(function() -- Line: 33 -- upvalues: a1 (val), EasySound (upval)
        if a1._windPlayer then
            EasySound.Destroy(a1._windPlayer)
            a1._windPlayer = nil
        end
        if a1._laserPlayer then
            EasySound.Destroy(a1._laserPlayer)
            a1._laserPlayer = nil
        end
    end)

    local function extractId(a1) -- Line: 44 -- types: a1: userdata?
        if not a1 then
            return nil
        end
        local v1 = string.match(a1.SoundId or "", "%d+")
        return v1 and tonumber(v1) or nil
    end

    local u48 = tick()
    local u50 = tick()
    local u51 = true
    local u52 = false
    local u54 = tick()
    a1.lightningGoal = {WorldAxis = Vector3.new(0, 0, 1), WorldPosition = Vector3.new()}
    local Attribute = a1.Model:GetAttribute("BeamColor") or Color3.new(0.5529411764705883, 0.8274509803921568, 1)
    a1.beamColor = Attribute
    a1._prevLevel = a1:GetLevel()
    a1._weaponHandles = {}
    a1._beams = {}
    a1._pulseSAs = {}
    a1._bobParts = {}
    a1._fadeParts = {}
    a1._currentBobOffset = CFrame.identity
    a1.Maid:Mark(function() -- Line: 74 -- upvalues: a1 (val)
        for i, v in ipairs(a1._beams) do
            v:Destroy()
        end
        table.clear(a1._beams)
    end)

    local function updateWeaponHandles() -- Line: 81 -- upvalues: a1 (val), FBXModel (val)
        local SurfaceAppearance, Value, Value_2
        table.clear(a1._weaponHandles)
        table.clear(a1._pulseSAs)
        table.clear(a1._bobParts)
        for i, v in ipairs((if not a1.FBXModel then a1.Model:WaitForChild("Weapon") else FBXModel):GetDescendants()) do
            if v:IsA("BasePart") or v:IsA("Attachment") then
                if string.match(v.Name, "^Handle") then
                    Value_2 = v
                    if v:IsA("ObjectValue") then
                        Value_2 = v.Value
                    end
                    if Value_2 then
                        table.insert(a1._weaponHandles, Value_2)
                    end
                end
            elseif v:IsA("ObjectValue") and string.match(v.Name, "^Handle") then
                Value_2 = v
                if v:IsA("ObjectValue") then
                    Value_2 = v.Value
                end
                if Value_2 then
                    table.insert(a1._weaponHandles, Value_2)
                end
            end
        end
        for i2, i3 in ipairs(a1.Model:GetDescendants()) do
            if i3:IsA("BasePart") and i3:GetAttribute("Pulse") then
                SurfaceAppearance = i3:FindFirstChildOfClass("SurfaceAppearance")
                if SurfaceAppearance then
                    table.insert(a1._pulseSAs, SurfaceAppearance)
                end
            end
        end
        for i4, j in ipairs(a1.Model:GetChildren()) do
            if j:IsA("ObjectValue") and j.Name == "SineWaveBob" and j.Value then
                Value = j.Value
                if Value:IsA("BasePart") then
                    table.insert(a1._bobParts, {
                        IsBone = false,
                        Object = Value,
                        Offset = (a1.Model.PrimaryPart.CFrame:ToObjectSpace(Value.CFrame)) * (a1._currentBobOffset:Inverse()),
                    })
                elseif Value:IsA("Bone") then
                    table.insert(a1._bobParts, {
                        IsBone = true,
                        Object = Value,
                        Offset = Value.CFrame * a1._currentBobOffset:Inverse(),
                    })
                end
            end
        end
        a1._impactVFX = a1.Model:FindFirstChild("TargetImpactVFX")
        table.clear(a1._fadeParts)
        for i5, k in ipairs(a1.Model:GetDescendants()) do
            if k:IsA("BasePart") and k:GetAttribute("FadeOnAttack") then
                table.insert(a1._fadeParts, {Part = k, OriginalTransparency = k.Transparency})
                k.Transparency = 1
            end
        end
    end

    updateWeaponHandles()
    local u99 = Animation.new({
        Track = a1.Model.Animations.Fire["0"].Charge,
        Target = a1.Model.AnimationController,
    })
    local u110 = Animation.new({
        Track = a1.Model.Animations.Fire["0"].Firing,
        Target = a1.Model.AnimationController,
    })
    local u121 = Animation.new({
        Track = a1.Model.Animations.Fire["0"].Cooldown,
        Target = a1.Model.AnimationController,
    })
    local u145 = nil
    if a1.Model.Animations.Fire["0"]:FindFirstChild("Recoil") then
        u145 = Animation.new({
            Track = a1.Model.Animations.Fire["0"].Recoil,
            Target = a1.Model.AnimationController,
        }):Play()
    end
    if not a1.FBXModel then
        local v1 = a1.Model.Torso:FindFirstChild("Left Shoulder")
        local v2 = a1.Model.Torso:FindFirstChild("Right Shoulder")
        if a1.Model.Name == "Speaker Titan" or a1.Model.Name == "Senator" or a1.Model.Name == "Dank" then
            v1 = a1.Model.Handle:FindFirstChild("Left Arm")
            v2 = a1.Model.Handle:FindFirstChild("Right Arm")
        end
        if v1 and v2 then
            local v3 = {v1, v2}
            local Handle = a1.Model.HumanoidRootPart:FindFirstChild("Handle")
            if Handle then
                table.insert(v3, Handle)
            end
            SharedControllerFunctions.RegisterJoints(a1, v3)
        end
    end

    local function u204(a1, a2) -- Line: 202
        if not a1 then
            return
        end
        for k, v in pairs(a1:GetChildren()) do
            if v:IsA("ParticleEmitter") then
                v.Enabled = a2
            end
        end
    end

    local function getStart(a1_2) -- Line: 213 -- upvalues: a1 (val)
        if not a1_2 then
            return nil
        end
        local Start = a1_2:FindFirstChild("Start", true)
        if Start and not Start:IsA("Sound") then
            return Start
        end
        for i, v in ipairs(a1.Model:GetDescendants()) do
            if v.Name == "Start" then
                if not v:IsA("Attachment") and not v:IsA("BasePart") then
                    continue
                end
                return v
            end
        end
        return nil
    end

    local function u207(a1_2) -- Line: 236
        -- upvalues: a1 (val), FBXModel (val), TweenService (upval), u204 (val), EmitterManager (upval), getStart (val)
        -- upvalues: EasySound (upval), Wind (val), u99 (ref), GameState (upval)
        local Level, TrailStart, Turning, TurningStart, v1, v2, v3, v4
        local Start = if not a1.FBXModel then a1.Model.Head:FindFirstChild("Start") else FBXModel:FindFirstChild("Start")
        local End = if not a1.FBXModel then a1.Model.Head:FindFirstChild("End") else FBXModel:FindFirstChild("End")
        if not a1_2 then
            local End_2, TrailStart_2, Turning_3, v5
            for i, v in ipairs(a1._weaponHandles) do
                Turning_3 = v:FindFirstChild("Turning")
                if Turning_3 and Turning_3:IsA("Motor6D") then
                    TweenService:Create(
                        v.Turning,
                        TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0),
                        {MaxVelocity = 0}
                    ):Play()
                    if a1.Model.Name == "Mage" or a1.Model.Name == "Elite" then
                        TweenService:Create(
                            a1.Model.Weapon.Turning,
                            TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0),
                            {Transparency = 1}
                        ):Play()
                    end
                    u204(Turning_3, false)
                end
                if a1.Model.Name ~= "Champion" then
                    u204(getStart(v), a1_2)
                else
                    v5 = getStart(v)
                    End_2 = v:FindFirstChild("End")
                    TrailStart_2 = v:FindFirstChild("TrailStart")
                    if TrailStart_2 then
                        EmitterManager.toggle(TrailStart_2, true)
                    end
                    for i2, j in v5:GetChildren() do
                        if j:IsA("ParticleEmitter") then
                            j:Clear()
                        end
                    end
                    for k, n in End_2:GetChildren() do
                        if n:IsA("ParticleEmitter") then
                            n:Clear()
                        end
                    end
                end
            end
            for i3, m in ipairs(a1._fadeParts) do
                TweenService:Create(m.Part, TweenInfo.new(1.5, Enum.EasingStyle.Sine), {Transparency = 1}):Play()
            end
            local ShootStart = if not a1.FBXModel then a1.Model.Head:FindFirstChild("ShootStart") else FBXModel:FindFirstChild("ShootStart")
            if ShootStart then
                ShootStart:Stop()
            end
            if End then
                if End then
                    v4 = string.match(End.SoundId or "", "%d+")
                    v2 = v4 and tonumber(v4) or nil
                else
                    v2 = nil
                end
                if v2 then
                    EasySound.Play({
                        soundGroupName = "Towers",
                        destroyOnEnd = true,
                        id = v2,
                        parent = End.Parent,
                        volume = End.Volume,
                    })
                end
            end
            if a1._windPlayer then
                TweenService:Create(a1._windPlayer, TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Volume = 0}):Play()
                task.delay(0.45, function() -- Line: 461 -- upvalues: EasySound (upval), a1 (upval)
                    EasySound.Destroy(a1._windPlayer)
                    a1._windPlayer = nil
                end)
            end
            if a1._laserPlayer then
                a1._laserPlayer:Stop()
                EasySound.Destroy(a1._laserPlayer)
                a1._laserPlayer = nil
            end
            return
        end
        for i4, i5 in ipairs(a1._weaponHandles) do
            Turning = i5:FindFirstChild("Turning")
            if Turning and Turning:IsA("Motor6D") then
                TweenService:Create(
                    Turning,
                    TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0),
                    {MaxVelocity = 0.15}
                ):Play()
                if a1.Model.Name == "Mage" or a1.Model.Name == "Elite" then
                    TweenService:Create(
                        a1.Model.Weapon.Turning,
                        TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0),
                        {Transparency = 0.25}
                    ):Play()
                end
                u204(Turning, true)
            end
            if a1.Model.Name ~= "Champion" then
                u204(getStart(i5), a1_2)
            else
                Level = a1:GetLevel()
                TurningStart = i5.TurningStart
                TrailStart = i5:FindFirstChild("TrailStart")
                if TrailStart then
                    EmitterManager.toggle(TrailStart, true)
                end
                if Level == 5 then
                    a1.Model.Weapon:FindFirstChild("Lance_Top", true)
                    a1.Model.Weapon:FindFirstChild("Lance_Bottom", true)
                end
            end
        end
        for i6, i62 in ipairs(a1._fadeParts) do
            TweenService:Create(i62.Part, TweenInfo.new(1, Enum.EasingStyle.Sine), {Transparency = i62.OriginalTransparency}):Play()
        end
        if Start then
            if Start then
                v3 = string.match(Start.SoundId or "", "%d+")
                v1 = v3 and tonumber(v3) or nil
            else
                v1 = nil
            end
            if v1 then
                EasySound.Play({
                    soundGroupName = "Towers",
                    destroyOnEnd = true,
                    id = v1,
                    parent = Start.Parent,
                    volume = Start.Volume,
                })
            end
        end
        if Wind and not a1._windPlayer then
            v2 = Wind
            if v2 then
                v4 = string.match(v2.SoundId or "", "%d+")
                v1 = v4 and tonumber(v4) or nil
            else
                v1 = nil
            end
            if v1 then
                a1._windPlayer = EasySound.Play({
                    looped = true,
                    volume = 0,
                    soundGroupName = "Towers",
                    id = v1,
                    parent = Wind.Parent,
                })
                TweenService:Create(
                    a1._windPlayer,
                    TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.In),
                    {Volume = Wind.Volume}
                ):Play()
            end
        end
        if not a1.Model.Animations.Fire["0"].Charge:GetAttribute("Oneshot") then
            u99:Play(0.5)
            return
        end
        u99:Play()
        local Length = u99.Controller.Length
        if Length and Length > 0.1 then
            v3 = Length / a1.Stats.Attributes.ChargeTime * GameState.TimeScale
            u99.Controller:AdjustSpeed(v3)
        end
        ;(u99.Controller:GetMarkerReachedSignal("Pause")):Connect(function() -- Line: 350 -- upvalues: u99 (upval)
            u99.Controller:AdjustSpeed(0)
        end)
    end

    local function u226() -- Line: 474
        -- upvalues: u110 (ref), u99 (ref), a1 (val), FBXModel (val), Laser (val), EasySound (upval), u145 (ref)
        u110:Play()
        u99:Stop()
        local ShootStart = if not a1.FBXModel then a1.Model.Head:FindFirstChild("ShootStart") else FBXModel:FindFirstChild("ShootStart")
        if ShootStart then
            ShootStart:Play()
        end
        if Laser and not a1._laserPlayer then
            local v1
            local v2 = Laser
            if v2 then
                local v3 = string.match(v2.SoundId or "", "%d+")
                v1 = v3 and tonumber(v3) or nil
            else
                v1 = nil
            end
            if v1 then
                a1._laserPlayer = EasySound.Play({
                    soundGroupName = "Towers",
                    id = v1,
                    parent = Laser.Parent,
                    looped = Laser.Looped,
                    volume = Laser.Volume,
                })
            end
        end
        if u145 then
            u145:Play()
        end
    end

    local function u244(a1_2) -- Line: 502
        -- upvalues: a1 (val), RunService (upval), getStart (val), ReplicatedStorage (upval), GameState (upval)
        -- upvalues: EmitterManager (upval), LightningBolt (upval)
        local v1, v2, v3
        if not a1_2 then
            for i9, i62 in ipairs(a1._beams) do
                if typeof(i62) ~= "function" then
                    i62:DestroyDissipate()
                else
                    i62()
                end
            end
            return table.clear(a1._beams)
        end
        local Weapon = a1.Model:FindFirstChild("Weapon")
        local BeamConfig = Weapon and Weapon:FindFirstChild("BeamConfig") or a1.Model:FindFirstChild("BeamConfig")
        if BeamConfig
            and BeamConfig:IsA("ObjectValue")
            and BeamConfig.Value
            and BeamConfig.Value:IsA("Attachment") then
            local Model
            local Attachment = Instance.new("Attachment")
            Attachment.Parent = workspace.Terrain
            local u105 = RunService.RenderStepped:Connect(function() -- Line: 525 -- upvalues: a1 (upval), Attachment (val)
                if a1.Model and a1.Model.Parent then
                    Attachment.WorldPosition = a1.lightningGoal.WorldPosition
                    return
                end
                Attachment:Destroy()
            end)
            for i, v in ipairs(a1._weaponHandles) do
                v1 = getStart(v)
                if v1 then
                    for i2, i3 in ipairs(BeamConfig.Value:GetChildren()) do
                        if i3:IsA("Beam") then
                            local u115 = i3:Clone()
                            Model = a1.Model
                            u115.Attachment0 = v1
                            u115.Attachment1 = Attachment
                            u115.Parent = Model
                            table.insert(a1._beams, function() -- Line: 542 -- upvalues: u115 (val)
                                u115:Destroy()
                            end)
                        end
                    end
                end
            end
            return table.insert(a1._beams, function() -- Line: 548 -- upvalues: u105 (val), Attachment (val)
                u105:Disconnect()
                Attachment:Destroy()
            end)
        end
        if a1.Model.Name == "Disco" then
            local DiscoBeam = a1.Model:FindFirstChild("DiscoBeam")
            if not DiscoBeam then
                DiscoBeam = ReplicatedStorage.Assets.Effects.Client.DiscoBeam:Clone()
            end
            DiscoBeam.Parent = a1.Model
            local u145 = 0
            DiscoBeam.Color = a1.beamColor
            local u153 = RunService.RenderStepped:Connect(function(a1_2) -- Line: 567 -- upvalues: u145 (ref), GameState (upval), a1 (upval), DiscoBeam (ref)
                u145 = math.clamp(u145 + a1_2 * 5 * GameState.TimeScale, 0, 1)
                if not a1.Model then
                    return
                end
                if a1.Model:FindFirstChild("Weapon") and a1.Model.Weapon:FindFirstChild("Handle") then
                    local Position = a1.Model.Weapon.Handle.Position
                    local v1 = u145
                    local v2 = Position:Lerp(a1.lightningGoal.WorldPosition, v1)
                    local Magnitude = (Position - v2).Magnitude
                    DiscoBeam.CFrame = (CFrame.new(Position, v2)) * CFrame.Angles(0, -1.5707963267948966, 0) * CFrame.new(-Magnitude / 2, 0, 0)
                    DiscoBeam.Size = Vector3.new(Magnitude, 0.173, 0.397)
                    DiscoBeam["1"].WorldPosition = Position
                    DiscoBeam["2"].WorldPosition = v2
                    return
                end
            end)
            table.insert(a1._beams, function() -- Line: 594 -- upvalues: u153 (val), DiscoBeam (ref)
                u153:Disconnect()
                DiscoBeam:Destroy()
            end)
            return
        end
        if a1.Model.Name == "Beach" then
            for i8, i52 in ipairs(a1._weaponHandles) do
                local Value = BeamConfig
                if Value then
                    Value = BeamConfig.Value
                    if Value then
                        Value = BeamConfig.Value:Clone()
                    end
                end
                if not Value then
                    return
                end
                Value.Parent = a1.Model
                a1.Maid:Mark(Value)
                EmitterManager.toggle(Value, true)
                local u196 = 0
                local u203 = RunService.RenderStepped:Connect(function(a1_2) -- Line: 612
                    -- upvalues: u196 (ref), GameState (upval), a1 (upval), getStart (upval), i52 (val), Value (val)
                    u196 = math.clamp(u196 + a1_2 * 5 * GameState.TimeScale, 0, 1)
                    if not a1.Model then
                        return
                    end
                    local v1 = getStart(i52)
                    if not v1 then
                        return
                    end
                    local WorldPosition = v1.WorldPosition
                    local v2 = u196
                    local v3 = WorldPosition:Lerp(a1.lightningGoal.WorldPosition, v2)
                    local Magnitude = (WorldPosition - v3).Magnitude
                    Value.CFrame = (CFrame.new(WorldPosition, v3)) * CFrame.Angles(0, -1.5707963267948966, 0) * CFrame.new(-Magnitude / 2, 0, 0)
                    Value.Size = Vector3.new(Magnitude, 0.173, 0.397)
                    if v1:IsA("Attachment") then
                        Value["1"].WorldPosition = WorldPosition
                    end
                    Value["2"].WorldPosition = v3
                end)
                table.insert(a1._beams, function() -- Line: 638 -- upvalues: u203 (val), Value (val)
                    u203:Disconnect()
                    Value:Destroy()
                end)
            end
            return
        end
        if a1.Model.Name == "Octopus" then
            for i7, m in ipairs(a1._weaponHandles) do
                v2 = if not ((a1:GetLevel()) <= 4) then "OctopusBeam5" else "OctopusBeam"
                local u258 = a1.Model:FindFirstChild(v2 .. i7)
                if not u258 then
                    v1 = ReplicatedStorage.Assets.Effects.Client:FindFirstChild(v2)
                    if not v1 then
                        return
                    else
                        u258 = v1:Clone()
                        u258.Name = v2 .. i7
                    end
                end
                u258.Parent = a1.Model
                local u265 = 0
                local u273 = RunService.RenderStepped:Connect(function(a1_2) -- Line: 661
                    -- upvalues: u265 (ref), GameState (upval), a1 (upval), getStart (upval), m (val), u258 (ref)
                    u265 = math.clamp(u265 + a1_2 * 5 * GameState.TimeScale, 0, 1)
                    if not a1.Model then
                        return
                    end
                    local v1 = getStart(m)
                    if not v1 then
                        return
                    end
                    local WorldPosition = v1.WorldPosition
                    local v2 = u265
                    local v3 = WorldPosition:Lerp(a1.lightningGoal.WorldPosition, v2)
                    local Magnitude = (WorldPosition - v3).Magnitude
                    u258.CFrame = (CFrame.new(WorldPosition, v3)) * CFrame.Angles(0, -1.5707963267948966, 0) * CFrame.new(-Magnitude / 2, 0, 0)
                    u258.Size = Vector3.new(Magnitude, 0.173, 0.397)
                    if v1:IsA("Attachment") then
                        u258.Start.WorldPosition = WorldPosition
                    end
                    u258.End.WorldPosition = v3
                end)
                table.insert(a1._beams, function() -- Line: 687 -- upvalues: u273 (val), u258 (ref)
                    u273:Disconnect()
                    u258:Destroy()
                end)
            end
            return
        end
        if a1.Model.Name == "Champion" then
            local TrailStart
            for i6, n in ipairs(a1._weaponHandles) do
                local Start = n:FindFirstChild("Start")
                local End = n:FindFirstChild("End")
                TrailStart = n:FindFirstChild("TrailStart")
                EmitterManager.toggle(Start, true)
                if TrailStart then
                    EmitterManager.toggle(TrailStart, false)
                end
                local u323 = 0
                local u324 = false
                local u332 = RunService.RenderStepped:Connect(function(a1_2) -- Line: 708
                    -- upvalues: u323 (ref), GameState (upval), u324 (ref), EmitterManager (upval), End (val)
                    -- upvalues: a1 (upval), n (val), getStart (upval)
                    u323 = math.min(u323 + a1_2 * 5 * GameState.TimeScale, 1)
                    if u323 == 1 and not u324 then
                        u324 = true
                        EmitterManager.toggle(End, true)
                    end
                    if a1.Model and n:FindFirstChild("Start") then
                        local v1 = getStart(n)
                        if not v1 then
                            return
                        end
                        local WorldPosition = v1.WorldPosition
                        local v2 = u323
                        local v3 = WorldPosition:Lerp(a1.lightningGoal.WorldPosition, v2)
                        if v1:IsA("Attachment") then
                            v1.WorldPosition = WorldPosition
                        end
                        End.WorldPosition = v3
                        return
                    end
                end)
                table.insert(a1._beams, function() -- Line: 734 -- upvalues: u332 (val), EmitterManager (upval), Start (val), End (val)
                    u332:Disconnect()
                    EmitterManager.toggle(Start, false)
                    EmitterManager.toggle(End, false)
                    End.WorldPosition = Start.WorldPosition
                end)
            end
            return
        end
        for i4, j in ipairs(a1._beams) do
            j:Destroy()
        end
        table.clear(a1._beams)
        for i5, k in ipairs(a1._weaponHandles) do
            v2 = getStart(k)
            if v2 ~= nil then
                v3 = LightningBolt.new(v2, a1.lightningGoal, 14)
                v3.Thickness = 0.25
                v3.Color = a1.beamColor
                v3.MaxRadius = 1
                a1.PulseSpeed = 0.25
                table.insert(a1._beams, v3)
            end
        end
    end

    local function u245() -- Line: 770
        -- upvalues: u52 (ref), u121 (ref), u99 (ref), u110 (ref), u145 (ref), u207 (val), a1 (val)
        -- upvalues: TweenService (upval), EmitterManager (upval), getStart (val), u204 (val), FBXModel (val)
        local v1, v2
        u52 = false
        u121:Play()
        u99:Stop(1)
        u110:Stop(1)
        if u145 then
            u145:Stop()
        end
        u207(false)
        for i, v in ipairs(a1._pulseSAs) do
            v1 = TweenService
            v2 = TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
            v1:Create(v, v2, {EmissiveStrength = 0}):Play()
        end
        coroutine.wrap(function(a1) -- Line: 786 -- upvalues: EmitterManager (upval), getStart (upval), u204 (upval), FBXModel (upval)
            local v1, v2
            if a1.Model.Name == "Champion" then
                local TrailStart
                for i4, j in ipairs(a1._weaponHandles) do
                    TrailStart = j:FindFirstChild("TrailStart")
                    if TrailStart then
                        EmitterManager.toggle(TrailStart, true)
                    end
                end
                return
            end
            for i, v in ipairs(a1._weaponHandles) do
                v1 = getStart(v)
                if v1 then
                    u204(v1, true)
                end
            end
            a1:Delay(a1.Stats.Attributes.LaserCooldown / 2)
            local Empty = if not a1.FBXModel then a1.Model.Head:FindFirstChild("Empty") else FBXModel:FindFirstChild("Empty")
            if Empty then
                Empty:Play()
            end
            a1:Delay(a1.Stats.Attributes.LaserCooldown / 2)
            for i2, i3 in ipairs(a1._weaponHandles) do
                v2 = getStart(i3)
                if v2 then
                    u204(v2, false)
                end
            end
            local Recharge = if not a1.FBXModel then a1.Model.Head:FindFirstChild("Recharge") else FBXModel:FindFirstChild("Recharge")
            if Recharge then
                Recharge:Play()
            end
        end)(a1)
    end

    a1:Thread(function() -- Line: 828
        -- upvalues: a1 (val), u54 (ref), GameState (upval), updateWeaponHandles (val), u51 (ref), u50 (ref), u207 (val)
        -- upvalues: u52 (ref), u244 (val), u226 (val), FBXModel (val), SharedControllerFunctions (upval)
        -- upvalues: EmitterManager (upval), u48 (ref), u245 (val)
        local v1
        local v2 = a1:FindTarget()
        local v3 = tick()
        local v4 = (tick() - u54) * GameState.TimeScale
        u54 = tick()
        if a1._prevLevel ~= a1:GetLevel() then
            updateWeaponHandles()
            a1._prevLevel = a1:GetLevel()
        end
        for i, v in ipairs(a1._bobParts) do
            v1 = tick() * 2.5
            a1._currentBobOffset = CFrame.new(math.cos(v1) * 0.02, math.sin(v1) * 0.05, math.sin(v1) * 0.15)
            if not v.IsBone then
                v.Object.CFrame = a1.Model.PrimaryPart.CFrame * v.Offset * a1._currentBobOffset
            else
                v.Object.CFrame = v.Offset * a1._currentBobOffset
            end
        end
        if not v2 then
            if u51 == false and 0.05 <= (v3 - u48) * GameState.TimeScale and not a1:FindTarget(true) then
                u51 = true
                for i2, i3 in ipairs(a1._beams) do
                    if typeof(i3) ~= "function" then
                        i3:DestroyDissipate()
                    else
                        i3()
                    end
                end
                table.clear(a1._beams)
                u245()
            end
            return
        end
        local PrimaryPart = v2.PrimaryPart
        if not PrimaryPart then
            return
        end
        local Head = v2:FindFirstChild("Head")
        local Torso = v2:FindFirstChild("Torso") or v2:FindFirstChild("Upper Torso")
        local Position = Torso and Torso.Position or PrimaryPart.Position
        local Position_2 = Head and Head.Position or Position
        a1.lightningGoal.WorldPosition = Position
        if u51 then
            u51 = false
            u50 = tick()
            u207(true)
        end
        if u51 == false then
            local HumanoidRootPart
            if a1.Stats.Attributes.ChargeTime <= (v3 - u50) * GameState.TimeScale and u52 == false then
                u52 = true
                u244(true)
                u226()
            end
            a1:UpdateCFrame(((if not a1.FBXModel then a1.Model.HumanoidRootPart else FBXModel).CFrame:Lerp(a1:Face(PrimaryPart.Position, nil, false), v4 * 4)))
            local v5 = math.acos((math.clamp(HumanoidRootPart.CFrame.LookVector:Dot((Position - HumanoidRootPart.Position).Unit), -1, 1)))
            if not a1.FBXModel and v5 > 0.008726646259971648 then
                SharedControllerFunctions.AimArmsAt(a1, Position)
                SharedControllerFunctions.AimHeadAt(a1, Position_2)
            end
            local v6 = math.clamp((v3 - u50) * GameState.TimeScale / a1.Stats.Attributes.ChargeTime, 0, 1)
            local v7 = if not u52 then v6 * 15 else 15
            for i4, j in ipairs(a1._pulseSAs) do
                j.EmissiveStrength = v7
            end
            if u52 and a1._impactVFX and a1._impactVFX.Value then
                local Value = a1._impactVFX.Value
                if Value:IsA("Attachment") then
                    Value.WorldPosition = a1.lightningGoal.WorldPosition
                    EmitterManager.manualEmit(Value)
                end
            end
        end
        u48 = tick()
    end)
    a1.OnUpgrade:Connect(function(a1_2) -- Line: 936
        -- upvalues: a1 (val), EmitterManager (upval), Animation (upval), u99 (ref), u110 (ref), u121 (ref), u145 (ref)
        if a1.Model.Name == "Champion" then
            local TurningStart = a1.Model.Weapon:FindFirstChild("TurningStart", true)
            local Lance_Top = a1.Model.Weapon:FindFirstChild("Lance_Top", true)
            local Lance_Bottom = a1.Model.Weapon:FindFirstChild("Lance_Bottom", true)
            EmitterManager.toggle(Lance_Top, true)
            EmitterManager.toggle(Lance_Bottom, true)
            if TurningStart then
                EmitterManager.toggle(TurningStart, true)
            end
        end

        local function _transitionAnimation(a1_2, a2) -- Line: 950 -- upvalues: Animation (upval), a1 (upval)
            if not a2 then
                return
            end
            if not a1_2 then
                return Animation.new({Track = a2, Target = a1.Model.AnimationController})
            end
            local IsPlaying = false
            local TimePosition = 0
            local Speed = 1
            if a1_2.Controller then
                IsPlaying = a1_2.Controller.IsPlaying
                TimePosition = a1_2.Controller.TimePosition
                Speed = a1_2.Controller.Speed
            end
            a1_2:Stop(0)
            local v1 = Animation.new({Track = a2, Target = a1.Model.AnimationController})
            if IsPlaying then
                v1:Play()
                v1.Controller.TimePosition = TimePosition
                v1.Controller:AdjustSpeed(Speed)
            end
            return v1
        end

        local v1 = a1.Model.Animations.Fire:FindFirstChild(a1_2)
        if v1 then
            local Charge = v1:FindFirstChild("Charge")
            local Firing = v1:FindFirstChild("Firing")
            local Cooldown = v1:FindFirstChild("Cooldown")
            local Recoil = v1:FindFirstChild("Recoil")
            u99 = _transitionAnimation(u99, Charge)
            u110 = _transitionAnimation(u110, Firing)
            u121 = _transitionAnimation(u121, Cooldown)
            u145 = _transitionAnimation(u145, Recoil)
        end
    end)
end

return v1
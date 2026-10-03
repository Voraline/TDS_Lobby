-- Script path: ReplicatedStorage.Client.Controllers.Lobby.LiveEventEffectsController
-- Decompile time: 20.47 ms

game:GetService("CollectionService")
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")
local TweenService = game:GetService("TweenService")
local BSplineCamera = require(ReplicatedStorage.Client.Modules.BSplineCamera)
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
require(ReplicatedStorage.Shared.Modules.EasySound)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
require(ReplicatedStorage.Client.Controllers.Shared.LightingController)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local MusicController = require(ReplicatedStorage.Client.Controllers.Shared.MusicController)
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TowerPetsController = require(script.Parent.TowerPetsController)
local eventDoor = require(script.eventDoor)
local u93 = Maid.new()
local LocalPlayer = game:GetService("Players").LocalPlayer
local u103 = Create("Sound", {SoundId = "rbxassetid://138118576381998", Volume = 0.7, Parent = SoundService})
local u108 = TweenInfo.new(6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
local u109 = false
local u110 = false
local v1 = {}
local LiveEvent = NewNetwork.Channel("LiveEvent")

function v1.OnSequenceComplete() -- Line: 42 -- upvalues: LiveEvent (val), u110 (ref)
    LiveEvent:fireServer("OnSequenceComplete", u110)
end

local function setDoorOpen(a1) -- Line: 46 -- upvalues: u109 (ref), eventDoor (val) -- types: a1: boolean
    if u109 == a1 then
        return
    end
    u109 = a1
    if a1 then
        eventDoor.play()
        return
    end
    eventDoor.close()
end

local u118 = Maid.new()
local u119 = nil
local u120 = nil
local u121 = nil
local u122 = nil
local u123 = nil
local u124 = nil

local function cancelCharacterTweens() -- Line: 66 -- upvalues: u124 (ref), u122 (ref), u123 (ref)
    if u124 then
        u124()
        u124 = nil
    end
    if u122 then
        u122:Cancel()
        u122:Destroy()
        u122 = nil
    end
    if u123 then
        u123:Cancel()
        u123:Destroy()
        u123 = nil
    end
end

local function releaseCharacter() -- Line: 83
    -- upvalues: u124 (ref), u122 (ref), u123 (ref), u118 (val), u119 (ref), u120 (ref), u121 (ref)
    if u124 then
        u124()
        u124 = nil
    end
    if u122 then
        u122:Cancel()
        u122:Destroy()
        u122 = nil
    end
    if u123 then
        u123:Cancel()
        u123:Destroy()
        u123 = nil
    end
    u118:Sweep()
    u119 = nil
    u120 = nil
    u121 = nil
end

local function setCharacterPosition(a1, a2) -- Line: 93
    -- upvalues: LocalPlayer (val), u119 (ref), u124 (ref), u122 (ref), u123 (ref), u118 (val), u120 (ref), u121 (ref)
    -- upvalues: releaseCharacter (val), TweenService (val)
    local Character = LocalPlayer.Character
    local HumanoidRootPart = Character
    if HumanoidRootPart then
        HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
    end
    local Humanoid = Character
    if Humanoid then
        Humanoid = Character:FindFirstChildOfClass("Humanoid")
    end
    if HumanoidRootPart
        and HumanoidRootPart:IsA("BasePart")
        and not HumanoidRootPart.Anchored
        and Humanoid
        and not (Humanoid.Health <= 0) then
        if u119 ~= HumanoidRootPart then
            if u124 then
                u124()
                u124 = nil
            end
            if u122 then
                u122:Cancel()
                u122:Destroy()
                u122 = nil
            end
            if u123 then
                u123:Cancel()
                u123:Destroy()
                u123 = nil
            end
            u118:Sweep()
            u119 = nil
            u120 = nil
            u121 = nil
            u119 = HumanoidRootPart
            local AutoRotate = Humanoid.AutoRotate
            local PlatformStand = Humanoid.PlatformStand
            Humanoid.AutoRotate = false
            Humanoid.PlatformStand = true
            local Attachment = Instance.new("Attachment")
            Attachment.Name = "LiveEventCharacterAlignment"
            Attachment.Parent = HumanoidRootPart
            local AlignPosition = Instance.new("AlignPosition")
            AlignPosition.Mode = Enum.PositionAlignmentMode.OneAttachment
            AlignPosition.Attachment0 = Attachment
            AlignPosition.ApplyAtCenterOfMass = true
            AlignPosition.MaxForce = (1 / 0)
            AlignPosition.MaxVelocity = (1 / 0)
            AlignPosition.Responsiveness = 200
            AlignPosition.Position = HumanoidRootPart.Position
            AlignPosition.Parent = HumanoidRootPart
            u120 = AlignPosition
            local AlignOrientation = Instance.new("AlignOrientation")
            AlignOrientation.Mode = Enum.OrientationAlignmentMode.OneAttachment
            AlignOrientation.Attachment0 = Attachment
            AlignOrientation.MaxTorque = (1 / 0)
            AlignOrientation.MaxAngularVelocity = (1 / 0)
            AlignOrientation.Responsiveness = 200
            AlignOrientation.CFrame = HumanoidRootPart.CFrame.Rotation
            AlignOrientation.Parent = HumanoidRootPart
            u121 = AlignOrientation
            u118:Mark(AlignPosition)
            u118:Mark(AlignOrientation)
            u118:Mark(Attachment)
            u118:Mark((Humanoid.Died:Connect(releaseCharacter)))
            u118:Mark((HumanoidRootPart.Destroying:Connect(releaseCharacter)))
            u118:Mark(function() -- Line: 145 -- upvalues: HumanoidRootPart (val), Humanoid (val), AutoRotate (val), PlatformStand (val)
                if HumanoidRootPart.Parent then
                    HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                    HumanoidRootPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                end
                if Humanoid.Parent then
                    Humanoid.AutoRotate = AutoRotate
                    Humanoid.PlatformStand = PlatformStand
                end
            end)
        end
        if u124 then
            u124()
            u124 = nil
        end
        if u122 then
            u122:Cancel()
            u122:Destroy()
            u122 = nil
        end
        if u123 then
            u123:Cancel()
            u123:Destroy()
            u123 = nil
        end
        local v1 = a2 or TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
        local v2 = u121
        local Position = if typeof(a1) ~= "CFrame" then a1 else a1.Position
        local v3 = TweenService:Create(u120, v1, {Position = Position})
        u122 = v3
        v3:Play()
        if typeof(a1) == "CFrame" then
            local v4 = TweenService:Create(v2, v1, {CFrame = a1.Rotation})
            u123 = v4
            v4:Play()
        end
        return true
    end
    return false
end

local function pullCharacterIntoDoor(a1) -- Line: 173
    -- upvalues: LocalPlayer (val), setCharacterPosition (val), u124 (ref), u122 (ref), u123 (ref), u120 (ref)
    -- upvalues: u121 (ref), RunService (val), u119 (ref), TweenService (val)
    local Lobby = workspace:FindFirstChild("Lobby")
    local DoorEntrence = Lobby and Lobby:FindFirstChild("DoorEntrence")
    local DoorEnding = Lobby and Lobby:FindFirstChild("DoorEnding")
    local Character = LocalPlayer.Character
    local HumanoidRootPart = Character
    if HumanoidRootPart then
        HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
    end
    if HumanoidRootPart
        and HumanoidRootPart:IsA("BasePart")
        and DoorEntrence
        and DoorEntrence:IsA("BasePart")
        and DoorEnding
        and DoorEnding:IsA("BasePart") then
        local CFrame_2 = HumanoidRootPart.CFrame
        local Position = DoorEntrence.Position
        local CFrame_3 = DoorEnding.CFrame
        local v1 = CFrame_3.Position - Position
        if not (v1.Magnitude < 0.01) and not (a1 <= 0) then
            if not setCharacterPosition(CFrame_2, TweenInfo.new(0)) then
                return false
            end
            if u124 then
                u124()
                u124 = nil
            end
            if u122 then
                u122:Cancel()
                u122:Destroy()
                u122 = nil
            end
            if u123 then
                u123:Cancel()
                u123:Destroy()
                u123 = nil
            end
            local u84 = u120
            local u85 = u121
            local Unit = v1.Unit
            local u112 = CFrame.lookAt(
                Position,
                CFrame_3.Position,
                if not (0.95 < (math.abs((Unit:Dot((Vector3.new(0, 1, 0))))))) then Vector3.new(0, 1, 0) else Vector3.new(1, 0, 0)
            )
            local Magnitude = (Position - CFrame_2.Position).Magnitude
            local u125 = math.min(Magnitude, v1.Magnitude) * 0.3
            local v2 = CFrame_2.Position + u112.RightVector * math.min(Magnitude * 0.3, 12)
            local v3 = Magnitude * 0.2
            local u140 = v2 + Vector3.new(0, 1, 0) * math.min(v3, 8)
            local u145 = math.min(v1.Magnitude * 0.15, 4)

            local function bezier(a1, a2, a3, a4, a5) -- Line: 216
                -- upvalues: 
                local v1 = 1 - a5
                return a1 * v1 ^ 3 + a2 * (v1 ^ 2 * 3 * a5) + a3 * (v1 * 3 * a5 ^ 2) + a4 * a5 ^ 3
            end

            local u147 = {}
            for i, j in Character:GetDescendants() do
                if j:IsA("BasePart") then
                    u147[j] = j.CanCollide
                    j.CanCollide = false
                end
            end
            local u165 = nil

            function u124() -- Line: 230 -- upvalues: u165 (ref), u147 (val)
                if u165 then
                    u165:Disconnect()
                end
                for i, j in u147 do
                    if i.Parent then
                        i.CanCollide = j
                    end
                end
            end

            local u168 = 0
            local v4 = RunService.PreSimulation:Connect(function(a1_2) -- Line: 242
                -- upvalues: HumanoidRootPart (val), LocalPlayer (upval), u119 (upval), u124 (upval), u122 (upval)
                -- upvalues: u123 (upval), u168 (ref), a1 (val), TweenService (upval), CFrame_2 (val), u140 (val)
                -- upvalues: Position (val), Unit (val), u125 (val), CFrame_3 (val), u145 (val), u112 (val), u84 (val)
                -- upvalues: u85 (val), u165 (ref)
                if HumanoidRootPart.Parent == LocalPlayer.Character and u119 == HumanoidRootPart then
                    local v1, v2, v3, v4, v5, v6
                    u168 = u168 + a1_2
                    local v7 = math.clamp(u168 / a1, 0, 1)
                    local Value = TweenService:GetValue(v7, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
                    if not (Value < 0.5) then
                        v2 = (Value - 0.5) * 2
                        v3 = Position
                        v4 = Position + Unit * u125
                        v5 = CFrame_3.Position - Unit * u125
                        local Position_3 = CFrame_3.Position
                        v6 = 1 - v2
                        v1 = v3 * v6 ^ 3 + v4 * (v6 ^ 2 * 3 * v2) + v5 * (v6 * 3 * v2 ^ 2) + Position_3 * v2 ^ 3
                        v3 = u145 * math.sin(3.141592653589793 * v2) ^ 2
                        v4 = v2 * 3.141592653589793 * 4
                        v1 = v1 + (u112.RightVector * math.cos(v4) + u112.UpVector * math.sin(v4)) * v3
                    else
                        local Position_2 = CFrame_2.Position
                        v3 = u140
                        v4 = Position - Unit * u125
                        v5 = Position
                        local v8 = Value * 2
                        v6 = 1 - v8
                        v1 = Position_2 * v6 ^ 3 + v3 * (v6 ^ 2 * 3 * v8) + v4 * (v6 * 3 * v8 ^ 2) + v5 * v8 ^ 3
                    end
                    v2 = Value * Value * (3 - 2 * Value)
                    v3 = CFrame.Angles(math.sin(Value * 3.141592653589793 * 2) * 0.3, 0, Value * 3.141592653589793 * 6)
                    u84.Position = v1
                    u85.CFrame = CFrame_2.Rotation:Lerp(CFrame_3.Rotation, v2) * v3
                    if v7 >= 1 then
                        u84.Position = CFrame_3.Position
                        u85.CFrame = CFrame_3.Rotation
                        if u165 then
                            u165:Disconnect()
                        end
                    end
                    return
                end
                if u124 then
                    u124()
                    u124 = nil
                end
                if u122 then
                    u122:Cancel()
                    u122:Destroy()
                    u122 = nil
                end
                if u123 then
                    u123:Cancel()
                    u123:Destroy()
                    u123 = nil
                end
            end)
            return true
        end
        return false
    end
    warn("Character pull requires HumanoidRootPart, Lobby.DoorEntrence and Lobby.DoorEnding")
    return false
end

local Animation = Instance.new("Animation")
Animation.AnimationId = "rbxassetid://15633504956"
local Animation_2 = Instance.new("Animation")
Animation_2.AnimationId = "rbxassetid://15633509599"
local NumberValue = Instance.new("NumberValue")
NumberValue.Value = 1
local DepthOfFieldEffect = Instance.new("DepthOfFieldEffect")
DepthOfFieldEffect.Name = "LiveEventDepthOfField"
DepthOfFieldEffect.Enabled = true
DepthOfFieldEffect.FarIntensity = 0
DepthOfFieldEffect.FocusDistance = 12
DepthOfFieldEffect.InFocusRadius = 0
DepthOfFieldEffect.NearIntensity = 0

local function tween(...) -- Line: 309 -- upvalues: TweenService (val)
    local u4 = TweenService:Create(...)
    u4:Play()
    u4.Completed:Once(function() -- Line: 312 -- upvalues: u4 (val)
        u4:Destroy()
    end)
end

local function setSpeedMult(a1, a2) -- Line: 317 -- upvalues: tween (val), NumberValue (val)
    tween(NumberValue, a2, {Value = a1})
end

local function zoomOutEffect(a1) -- Line: 323 -- upvalues: RunService (val)
    local function v1(...) -- Line: 324
        (game:GetService("TweenService")):Create(...):Play()
    end

    local Camera = game.Workspace.Camera
    local NumberValue = Instance.new("NumberValue")
    local NumberValue_2 = Instance.new("NumberValue")
    local NumberValue_3 = Instance.new("NumberValue")
    local NumberValue_4 = Instance.new("NumberValue")
    local NumberValue_5 = Instance.new("NumberValue")
    local NumberValue_6 = Instance.new("NumberValue")
    local NumberValue_7 = Instance.new("NumberValue")
    local NumberValue_8 = Instance.new("NumberValue")
    local NumberValue_9 = Instance.new("NumberValue")
    NumberValue.Value = 1
    NumberValue_5.Value = 1
    NumberValue_9.Value = 1
    RunService.RenderStepped:Connect(function() -- Line: 345
        -- upvalues: Camera (val), NumberValue (val), NumberValue_2 (val), NumberValue_3 (val), NumberValue_4 (val)
        -- upvalues: NumberValue_5 (val), NumberValue_6 (val), NumberValue_7 (val), NumberValue_8 (val)
        -- upvalues: NumberValue_9 (val)
        Camera.CFrame = Camera.CFrame * CFrame.new(
            0,
            0,
            0,
            NumberValue.Value,
            NumberValue_2.Value,
            NumberValue_3.Value,
            NumberValue_4.Value,
            NumberValue_5.Value,
            NumberValue_6.Value,
            NumberValue_7.Value,
            NumberValue_8.Value,
            NumberValue_9.Value
        )
    end)
    v1(workspace.CurrentCamera, TweenInfo.new(a1, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {FieldOfView = 120})
    v1(NumberValue_2, TweenInfo.new(a1, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {Value = 0.1})
    v1(NumberValue, TweenInfo.new(a1, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {Value = 0})
    v1(NumberValue_5, TweenInfo.new(a1, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {Value = 0.4})
end

local function createPathFlash(a1) -- Line: 382
    -- upvalues: LocalPlayer (val), Lighting (val), TweenService (val), GameState (val), u93 (val)
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "LiveEventWhiteFlash"
    ScreenGui.IgnoreGuiInset = true
    ScreenGui.ScreenInsets = Enum.ScreenInsets.None
    ScreenGui.DisplayOrder = 999999
    ScreenGui.ResetOnSpawn = false
    local Frame = Instance.new("Frame")
    Frame.BackgroundColor3 = Color3.new(1, 1, 1)
    Frame.BackgroundTransparency = 1
    Frame.BorderSizePixel = 0
    Frame.Size = UDim2.fromScale(1, 1)
    Frame.Parent = ScreenGui
    ScreenGui.Parent = LocalPlayer.PlayerGui
    local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
    ColorCorrectionEffect.Name = "LiveEventFlashColorCorrection"
    ColorCorrectionEffect.Parent = Lighting
    local u45 = TweenService:Create(
        Frame,
        TweenInfo.new(0.25, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
        {BackgroundColor3 = Color3.new(0, 0, 0)}
    )
    local u46 = false
    local u47 = false
    u93:Mark(function() -- Line: 408
        -- upvalues: u46 (ref), u45 (val), ColorCorrectionEffect (val), ScreenGui (val), GameState (upval)
        if u46 then
            return
        end
        u46 = true
        u45:Cancel()
        u45:Destroy()
        ColorCorrectionEffect:Destroy()
        ScreenGui:Destroy()
        GameState.Replicator:Set("TextGlitchEffectEvent", false)
    end)
    return function(a1) -- Line: 423
        -- upvalues: u46 (ref), u47 (ref), TweenService (upval), ColorCorrectionEffect (val), Frame (val), u45 (val)
        -- upvalues: GameState (upval)
        if not u46 and not u47 then
            local Value = TweenService:GetValue(math.clamp(a1, 0, 1), Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
            ColorCorrectionEffect.Brightness = Value
            Frame.BackgroundTransparency = 1 - Value
            if a1 >= 1 then
                u47 = true
                ColorCorrectionEffect.Brightness = 0
                u45:Play()
                task.delay(1, function() -- Line: 440 -- upvalues: u46 (upval), GameState (upval)
                    if not u46 then
                        GameState.Replicator:Set("TextGlitchEffectEvent", "EVENT_START")
                    end
                end)
            end
            return
        end
    end
end

local function cameraSpline(a1, a2) -- Line: 455
    -- upvalues: ReplicatedStorage (val), BSplineCamera (val), tween (val), NumberValue (val), u109 (ref)
    -- upvalues: eventDoor (val), pullCharacterIntoDoor (val), TweenService (val), u93 (val), Shaker (val)
    -- upvalues: DepthOfFieldEffect (val), zoomOutEffect (val), RunService (val), LocalPlayer (val)
    -- upvalues: createPathFlash (val)
    local v1, v2
    local u134 = true
    local Y = a1.Position.Y
    local u144 = nil
    local EventCameraRig = ReplicatedStorage.EventCameraRig
    EventCameraRig:PivotTo(a1.CFrame)
    local v3 = {}
    local v4 = {}
    local v5 = #EventCameraRig.Camera:GetChildren()
    for i = 1, v5 do
        v1 = EventCameraRig.Camera:FindFirstChild((tostring(i)))
        if v1 then
            table.insert(v3, v1.CFrame)
            table.insert(v4, (CFrame.new(0, 1, 0)))
        end
    end
    local Camera_2 = workspace.Lobby.EventDoor.Camera
    local v6 = #Camera_2:GetChildren()
    for j = 1, v6 do
        v2 = Camera_2:FindFirstChild((tostring(j)))
        if v2 and v2:IsA("BasePart") then
            table.insert(v3, v2.CFrame)
            table.insert(v4, CFrame.identity)
        end
    end
    local u107 = BSplineCamera.new(v3, "ControlPoints")
    local u113 = BSplineCamera.new(v4, "ControlPoints")
    local u114 = 0
    local u115 = nil
    local v7 = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
    tween(NumberValue, v7, {Value = 2.8})
    task.delay(1, function() -- Line: 493 -- upvalues: u134 (ref), u109 (upval), eventDoor (upval)
        if u134 then
            if u109 == true then
                return
            end
            u109 = true
            eventDoor.play()
        end
    end)
    task.delay(0.25, function() -- Line: 499
        -- upvalues: tween (upval), NumberValue (upval), u134 (ref), pullCharacterIntoDoor (upval), u144 (ref), a1 (val)
        -- upvalues: TweenService (upval), u93 (upval), Shaker (upval), DepthOfFieldEffect (upval)
        -- upvalues: zoomOutEffect (upval)
        local v1 = TweenInfo.new(2, Enum.EasingStyle.Linear)
        tween(NumberValue, v1, {Value = 0.5})
        task.wait(2)
        v1 = TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
        tween(NumberValue, v1, {Value = 1.25})
        task.wait(1.5)
        warn("doing this")
        if not u134 then
            return
        end
        if pullCharacterIntoDoor(3.7) then
            u144 = a1.Position.Y
        end
        local EventSuckEffect = workspace.Lobby:FindFirstChild("EventSuckEffect")
        if EventSuckEffect then
            local v2, v3
            for i, j in EventSuckEffect:GetDescendants() do
                if j:IsA("ParticleEmitter") then
                    local Enabled = j.Enabled
                    local Rate = j.Rate
                    j.Rate = 0
                    j.Enabled = true
                    v3 = TweenService
                    v2 = TweenInfo.new(4, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
                    local u71 = v3:Create(j, v2, {Rate = 90})
                    u93:Mark(function() -- Line: 529 -- upvalues: u71 (val), j (val), Enabled (val), Rate (val)
                        u71:Cancel()
                        u71:Destroy()
                        if j.Parent then
                            j.Enabled = Enabled
                            j.Rate = Rate
                        end
                    end)
                    u71:Play()
                end
            end
        end
        Shaker:Shake({6, 12, 5, 4, 4}, 10, 15)
        tween(DepthOfFieldEffect, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {FarIntensity = 0})
        tween(workspace.CurrentCamera, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {FieldOfView = 48})
        task.wait(2)
        if not u134 then
            return
        end
        local v4 = TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.In)
        tween(NumberValue, v4, {Value = 100})
        zoomOutEffect(1.7)
    end)
    RunService:BindToRenderStep("LiveEventCameraSpline", Enum.RenderPriority.Camera.Value + 1, function(a1_2) -- Line: 570
        -- upvalues: a1 (val), LocalPlayer (upval), u114 (ref), NumberValue (upval), u107 (val), u113 (val), u144 (ref)
        -- upvalues: Y (val), u115 (ref), createPathFlash (upval), a2 (val)
        if a1.Parent and a1.Parent == LocalPlayer.Character then
            u114 = u114 + a1_2 * NumberValue.Value
            local v1 = math.clamp(u114 / 15, 0, 1)
            local UniformParameter = u107:GetUniformParameter(v1)
            local v2 = u107:SolveCFrame(UniformParameter)
            local Y_2 = u113:SolvePosition(UniformParameter).Y
            local v3 = Vector3.new(0, ((u144 or a1.Position.Y) - Y) * Y_2, 0)
            workspace.CurrentCamera.CFrame = v2 + v3
            if v1 >= 0.55 then
                local v4 = u115 or createPathFlash(a2)
                u115 = v4
                v4((v1 - 0.55) / 0.44999999999999996)
            end
            return
        end
    end)
    return function() -- Line: 596 -- upvalues: u134 (ref), RunService (upval)
        u134 = false
        RunService:UnbindFromRenderStep("LiveEventCameraSpline")
    end
end

local function runEffects(a1) -- Line: 602
    -- upvalues: u110 (ref), LocalPlayer (val), Animation (val), Animation_2 (val), NumberValue (val)
    -- upvalues: DepthOfFieldEffect (val), Lighting (val), TweenService (val), u93 (val), MusicController (val)
    -- upvalues: u103 (val), GameState (val), TowerPetsController (val), cameraSpline (val), setCharacterPosition (val)
    -- upvalues: u108 (val), Shaker (val)
    u110 = a1 == false
    local v1 = LocalPlayer.Character.Humanoid:LoadAnimation(Animation)
    local u17 = LocalPlayer.Character.Humanoid:LoadAnimation(Animation_2)
    while v1.Length <= 0 do
        task.wait()
    end
    local Character_3 = LocalPlayer.Character
    local HumanoidRootPart = Character_3 and Character_3:FindFirstChild("HumanoidRootPart")
    if HumanoidRootPart and HumanoidRootPart:IsA("BasePart") then
        NumberValue.Value = 1
        DepthOfFieldEffect.FarIntensity = 0
        DepthOfFieldEffect.Parent = Lighting
        local u51 = TweenService:Create(DepthOfFieldEffect, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {FarIntensity = 1})
        u93:Mark(function() -- Line: 627 -- upvalues: u51 (val), DepthOfFieldEffect (upval)
            u51:Cancel()
            u51:Destroy()
            DepthOfFieldEffect.Parent = nil
        end)
        u51:Play()
        for i, j in LocalPlayer.PlayerGui:GetChildren() do
            if j:IsA("ScreenGui")
                and not j:GetAttribute("LiveEventControl")
                and not string.find(string.lower(j.Name), "glitcheffect")
                and not string.find(string.lower(j.Name), "loading") then
                local Enabled = j.Enabled
                j.Enabled = false
                u93:Mark(function() -- Line: 647 -- upvalues: j (val), Enabled (val)
                    j.Enabled = Enabled
                end)
            end
        end
        MusicController.Disabled = true
        MusicController.Global:Stop()
        u103:Play()
        local ControlModule = require(LocalPlayer.PlayerScripts.PlayerModule.ControlModule)
        GameState.Replicator:Set("GlitchEffect", true)
        task.delay(1, function() -- Line: 662 -- upvalues: GameState (upval)
            GameState.Replicator:Set("GlitchEffect", false)
        end)
        task.spawn(function() -- Line: 666 -- upvalues: TowerPetsController (upval)
            TowerPetsController.SetEnabled(false)
        end)
        ControlModule:Disable()
        u93:Mark((cameraSpline(HumanoidRootPart, a1)))
        setCharacterPosition(HumanoidRootPart.CFrame + Vector3.new(0, 15, 0), u108)
        v1:Play(0)
        v1.Stopped:Connect(function() -- Line: 676 -- upvalues: u17 (val)
            u17:Play()
        end)
        Shaker:Shake({6, 15, 0, 7, 4}, 0.1, 6)
        return
    end
end

function v1.PlaySequence() -- Line: 685
    -- upvalues: u109 (ref), runEffects (val), u124 (ref), u122 (ref), u123 (ref), u118 (val), u119 (ref), u120 (ref)
    -- upvalues: u121 (ref), u93 (val), eventDoor (val), LocalPlayer (val)
    local u0 = u109
    local u4 = task.spawn(runEffects, false)
    return function() -- Line: 688
        -- upvalues: u4 (val), u124 (upval), u122 (upval), u123 (upval), u118 (upval), u119 (upval), u120 (upval)
        -- upvalues: u121 (upval), u93 (upval), u0 (val), u109 (upval), eventDoor (upval), LocalPlayer (upval)
        if coroutine.status(u4) ~= "dead" then
            task.cancel(u4)
        end
        if u124 then
            u124()
            u124 = nil
        end
        if u122 then
            u122:Cancel()
            u122:Destroy()
            u122 = nil
        end
        if u123 then
            u123:Cancel()
            u123:Destroy()
            u123 = nil
        end
        u118:Sweep()
        u119 = nil
        u120 = nil
        u121 = nil
        u93:Sweep()
        local v1 = u0
        if u109 ~= v1 then
            u109 = v1
            if not v1 then
                eventDoor.close()
            else
                eventDoor.play()
            end
        end
        require(LocalPlayer.PlayerScripts.PlayerModule.ControlModule):Enable()
    end
end

task.spawn(function() -- Line: 699
    -- upvalues: u109 (ref), eventDoor (val), runEffects (val), u124 (ref), u122 (ref), u123 (ref), u118 (val)
    -- upvalues: u119 (ref), u120 (ref), u121 (ref), u93 (val), LocalPlayer (val), releaseCharacter (val)
    local DoorHitBox = (workspace:WaitForChild("Lobby")):WaitForChild("DoorHitBox")
    ;(DoorHitBox:GetPropertyChangedSignal("CanCollide")):Connect(function() -- Line: 701 -- upvalues: DoorHitBox (val), u109 (upval), eventDoor (upval)
        local v1 = not DoorHitBox.CanCollide
        if u109 == v1 then
            return
        end
        u109 = v1
        if v1 then
            eventDoor.play()
            return
        end
        eventDoor.close()
    end)
    local v1 = not DoorHitBox.CanCollide
    if u109 ~= v1 then
        u109 = v1
        if not v1 then
            eventDoor.close()
        else
            eventDoor.play()
        end
    end

    local function update(a1) -- Line: 708
        -- upvalues: runEffects (upval), u124 (upval), u122 (upval), u123 (upval), u118 (upval), u119 (upval)
        -- upvalues: u120 (upval), u121 (upval), u93 (upval)
        if a1 then
            runEffects()
            return
        end
        if u124 then
            u124()
            u124 = nil
        end
        if u122 then
            u122:Cancel()
            u122:Destroy()
            u122 = nil
        end
        if u123 then
            u123:Cancel()
            u123:Destroy()
            u123 = nil
        end
        u118:Sweep()
        u119 = nil
        u120 = nil
        u121 = nil
        u93:Sweep()
    end

    LocalPlayer.CharacterRemoving:Connect(releaseCharacter)
    ;(workspace:GetAttributeChangedSignal("AdminAbuseEffects")):Connect(function() -- Line: 718
        -- upvalues: runEffects (upval), u124 (upval), u122 (upval), u123 (upval), u118 (upval), u119 (upval)
        -- upvalues: u120 (upval), u121 (upval), u93 (upval)
        if workspace:GetAttribute("AdminAbuseEffects") == true then
            runEffects()
            return
        end
        if u124 then
            u124()
            u124 = nil
        end
        if u122 then
            u122:Cancel()
            u122:Destroy()
            u122 = nil
        end
        if u123 then
            u123:Cancel()
            u123:Destroy()
            u123 = nil
        end
        u118:Sweep()
        u119 = nil
        u120 = nil
        u121 = nil
        u93:Sweep()
    end)
    if workspace:GetAttribute("AdminAbuseEffects") == true then
        runEffects()
        return
    end
    if u124 then
        u124()
        u124 = nil
    end
    if u122 then
        u122:Cancel()
        u122:Destroy()
        u122 = nil
    end
    if u123 then
        u123:Cancel()
        u123:Destroy()
        u123 = nil
    end
    u118:Sweep()
    u119 = nil
    u120 = nil
    u121 = nil
    u93:Sweep()
end)
v1.SetCharacterPosition = setCharacterPosition
v1.ReleaseCharacter = releaseCharacter
return v1
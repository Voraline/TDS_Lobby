-- Script path: ReplicatedStorage.Client.Controllers.Shared.UnboxingController
-- Decompile time: 55.82 ms

local ContentProvider = game:GetService("ContentProvider")
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local RichText = require(ReplicatedStorage.Shared.UI.Components.RichText)
local LegacyInterface = ReplicatedStorage.Client.Interfaces.LegacyInterface
local InstanceButton = require(LegacyInterface.Components.InstanceButton)
local ItemController = require(LegacyInterface.Controllers.ItemController)
local TowerDisplayName = require(ReplicatedStorage.Shared.Modules.TowerDisplayName)
local ViewController = require(LegacyInterface.Controllers.ViewController)
local Asset = require(ReplicatedStorage.Shared.Modules.Asset)
local PlayerCharacterReplicator = require(ReplicatedStorage.Client.Modules.Replicators.PlayerCharacterReplicator)
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local EmitterUtil = require(ReplicatedStorage.Shared.Modules.EmitterUtil)
local EmoteReplicator = require(ReplicatedStorage.Client.Modules.Replicators.EmoteReplicator)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local Network = require(ReplicatedStorage.Shared.Modules.Network)
local ItemPresentations = require(ReplicatedStorage.Shared.UI.ItemPresentations)
local Promise = require(ReplicatedStorage.Shared.Modules.Promise)
local Sound = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Sound)
local SpringClass = require(ReplicatedStorage.Shared.Modules.Standalone.SpringClass)
local Streaming = Network.Channel("Streaming")
local u126 = {}
local BindableEvent = Instance.new("BindableEvent")
local Mouse = Players.LocalPlayer:GetMouse()
local Effect = ReplicatedStorage.Assets.Effects.Misc.Unboxing.Effect
local u140 = Random.new()
local DepthOfFieldEffect = Lighting:FindFirstChildOfClass("DepthOfFieldEffect")
if not DepthOfFieldEffect then
    DepthOfFieldEffect = Create("DepthOfFieldEffect", {Parent = Lighting})
end
local u149 = {}
setmetatable(u149, {__mode = "k"})
local u154 = {}
local v1 = {}
task.spawn(function() -- Line: 52 -- upvalues: ContentProvider (val)
    local v1 = {}
    for i, j in {15670476628, 15670473959, 15670474777, 15670475749} do
        table.insert(v1, (("rbxassetid://%*"):format(j)))
    end
    ContentProvider:PreloadAsync(v1)
end)

local function emitParticles(a1) -- Line: 115 -- types: a1: userdata
    local Attribute
    for i, j in a1:GetDescendants() do
        if j:IsA("ParticleEmitter") then
            Attribute = j:GetAttribute("EmitCount")
            j:Emit(Attribute or 1)
        end
    end
end

local function colorParticles(a1, a2) -- Line: 123 -- types: a1: userdata, a2: userdata
    local v1
    for i, j in a1:GetDescendants() do
        if j:IsA("ParticleEmitter") then
            v1 = a2
            if j.Name == "Sparkles" then
                v1 = Color3.new(1, 0.890196, 0.258824)
            end
            j.Color = ColorSequence.new(j.Color.Keypoints[1].Value:Lerp(v1, 0.8))
        end
    end
end

local function createParticles(a1) -- Line: 136
    -- upvalues: Create (val), Effect (val), EmitterUtil (val)
    local v1 = Create
    local v2 = {
        Name = "FX",
        Size = Vector3.new(1, 1, 1),
        Transparency = 1,
        CanCollide = false,
        CanTouch = false,
        CanQuery = false,
        Anchored = true,
        [0] = Create("PointLight", {Brightness = 2, Range = 8}),
        (Create("Attachment", {
            Name = "Front",
            WorldAxis = Vector3.new(0.906000018119812, -0.026599999517202377, 0.42399999499320984),
            WorldSecondaryAxis = Vector3.new(0.060600001364946365, 0.9959999918937683, -0.06700000166893005),
            CFrame = CFrame.new(0, 0, 0.1),
        })),
    }
    local v3 = Create
    local v4 = {
        Name = "Behind",
        CFrame = CFrame.new(0, 0, 0),
        WorldAxis = Vector3.new(0.906000018119812, -0.026599999517202377, 0.42399999499320984),
        WorldSecondaryAxis = Vector3.new(0.060600001364946365, 0.9959999918937683, -0.06700000166893005),
        (Create("ParticleEmitter", {
            Name = "Glow",
            LightEmission = 1,
            LockedToPart = true,
            Enabled = false,
            Rate = 5,
            Texture = "rbxassetid://867619398",
            ZOffset = -1,
            Lifetime = NumberRange.new(0.5),
            Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 1.64), (NumberSequenceKeypoint.new(1, 1.64))}),
            Speed = NumberRange.new(0),
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 1),
                NumberSequenceKeypoint.new(0.5, 0.75),
                (NumberSequenceKeypoint.new(1, 1)),
            }),
        })),
    }
    local v5 = Create
    local v6 = {
        Name = "Rays",
        LightEmission = 1,
        LockedToPart = true,
        Enabled = false,
        Rate = 8,
        Texture = "rbxassetid://1084999891",
        ZOffset = -1,
        Lifetime = NumberRange.new(1),
        RotSpeed = NumberRange.new(-25, 25),
        Rotation = NumberRange.new(-180, 180),
        Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 1.64), (NumberSequenceKeypoint.new(1, 1.64))}),
        Speed = NumberRange.new(0),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.5, 0.75),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }
    v4[2] = (v5("ParticleEmitter", v6))
    v2[2] = (v3("Attachment", v4))
    v1 = v1("Part", v2)
    local v7 = Effect.ItemObtain:Clone()
    v2 = Effect.CrateHit:Clone()
    v7.Parent = v1.Front
    v2.Parent = v1.Front
    if a1 then
        local v8
        EmitterUtil:scaleEmitter(v1.Behind.Glow, a1, false)
        EmitterUtil:scaleEmitter(v1.Behind.Rays, a1, false)
        for i, j in v2:GetChildren() do
            if j:IsA("ParticleEmitter") then
                v6 = EmitterUtil
                v8 = a1 * 0.5
                v6:scaleEmitter(j, v8, false)
            end
        end
        for k, n in v7:GetChildren() do
            if n:IsA("ParticleEmitter") then
                v6 = EmitterUtil
                v8 = a1 * 0.5
                v6:scaleEmitter(n, v8, false)
            end
        end
    end
    return v1
end

local function createDisplay(a1, a2) -- Line: 240
    -- upvalues: Create (val), InstanceButton (val)
    local v1 = "BillboardGui"
    local v2 = {
        Size = UDim2.fromScale(2, 0.33),
        StudsOffset = Vector3.new(0, -0.8500000238418579, 0),
        AlwaysOnTop = true,
        Active = true,
    }
    local v3 = Create
    local v4 = {Name = "Info", BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, -60)}
    local v5 = {
        Name = "ItemName",
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
    }
    v5.Text = a1.title and a1.title:upper() or ""
    local titleColor = a1.titleColor or Color3.new(1, 1, 1)
    v5.TextColor3 = titleColor
    v5.TextScaled = true
    v5.TextSize = 14
    v5.TextWrapped = true
    v5.AnchorPoint = Vector2.new(0.5, 0)
    v5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v5.BackgroundTransparency = 1
    v5.Position = UDim2.fromScale(0.5, 0)
    v5.Size = UDim2.fromScale(1, 0.5)
    v5.ZIndex = 10
    v5[1] = (Create("UIStroke", {
        Name = "UIStroke",
        Thickness = 0.1,
        Transparency = 0,
        LineJoinMode = Enum.LineJoinMode.Miter,
        StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
    }))
    v4[1] = (Create("TextLabel", v5))
    v5 = {
        Name = "ItemRarity",
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
        Text = a1.subTitle or "",
    }
    local subTitleColor = a1.subTitleColor or Color3.new(1, 1, 1)
    v5.TextColor3 = subTitleColor
    v5.TextScaled = true
    v5.TextSize = 14
    v5.TextWrapped = true
    v5.AnchorPoint = Vector2.new(0.5, 0)
    v5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v5.BackgroundTransparency = 1
    v5.Position = UDim2.fromScale(0.5, 0.5)
    v5.Size = UDim2.fromScale(1, 0.4)
    v5.ZIndex = 10
    v5[1] = (Create("UIStroke", {
        Name = "UIStroke",
        Transparency = 0,
        Thickness = 0.1,
        LineJoinMode = Enum.LineJoinMode.Miter,
        StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
    }))
    v4[2] = (Create("TextLabel", v5))
    v2[1] = (v3("Frame", v4))
    local v6 = Create(v1, v2)
    if a2 then
        v2 = {
            AnchorPoint = Vector2.new(0.5, 0),
            Position = UDim2.new(0.5, 0, 1, -45),
            Size = UDim2.fromOffset(130, 45),
        }
        v3 = a1.claimText and not (a1.claimText:lower() ~= "next") and Color3.fromRGB(10, 220, 80) or Color3.fromRGB(255, 226, 0)
        v2.Color = v3
        v2.Text = a1.claimText and a1.claimText:upper() or "CLAIM"
        v2.Clicked = a2
        v1 = InstanceButton(v2)
        v1.Name = "Claimed"
        v1.Parent = v6
    end
    return v6
end

local function tween(a1, a2, a3, a4) -- Line: 331
    -- upvalues: TweenService (val)
    local v1 = TweenService:Create(a1, a2, a3)
    v1:Play()
    if a4 == true then
        v1.Completed:Wait()
    end
    return v1
end

local function customTween(a1, a2, a3) -- Line: 347
    -- upvalues: Create (val), TweenService (val)
    local u6 = Create("NumberValue", {Value = 0})
    ;(u6:GetPropertyChangedSignal("Value")):Connect(function() -- Line: 352 -- upvalues: a2 (val), u6 (val)
        a2(u6.Value)
    end)
    local v1 = TweenService:Create(u6, a1, {Value = 1})
    v1:Play()
    v1.Completed:Connect(function() -- Line: 357 -- upvalues: u6 (val)
        u6:Destroy()
    end)
    if a3 == true then
        v1.Completed:Wait()
    end
    return v1
end

local function fixCollisions(a1) -- Line: 368 -- types: a1: userdata
    for i, j in a1:GetDescendants() do
        if j:IsA("BasePart") then
            j.CanCollide = false
            j.CanTouch = false
            j.CanQuery = false
        end
    end
end

local function springUpdate(a1, a2) -- Line: 378 -- upvalues: RunService (val) -- types: a2: function
    local u7 = RunService.RenderStepped:Connect(function() -- Line: 379 -- upvalues: a2 (val), a1 (val)
        a2(a1.p)
    end)
    return function() -- Line: 383 -- upvalues: u7 (val)
        if u7.Connected then
            u7:Disconnect()
        end
    end
end

local function processAttached() -- Line: 390 -- upvalues: RunService (val), u149 (val)
    local u0 = nil
    u0 = RunService.RenderStepped:Connect(function() -- Line: 392 -- upvalues: u149 (upval), u0 (ref)
        local v1
        local v2 = false
        local CurrentCamera = workspace.CurrentCamera
        local CFrame_2 = CurrentCamera and CurrentCamera.CFrame or CFrame.identity
        for i, j in u149 do
            v2 = true
            if i:IsA("Model") then
                v1 = CFrame_2 * j
                i:PivotTo(v1)
            elseif not i:IsA("BasePart") then
                u149[i] = nil
            else
                i.CFrame = CFrame_2 * j
            end
        end
        if not v2 then
            u0:Disconnect()
        end
    end)
    return function() -- Line: 415 -- upvalues: u0 (ref)
        if u0.Connected then
            u0:Disconnect()
        end
    end
end

local function playStage(a1, ...) -- Line: 422 -- upvalues: u154 (val) -- types: a1: string
    local v1 = u154[a1]
    assert(v1, (string.format("Crate stage %q does not exist", a1)))
    return v1(u154, ...)
end

local function process() -- Line: 428
    -- upvalues: u126 (val), ViewController (val), LocalPlayer (val), createParticles (val), Create (val)
    -- upvalues: fixCollisions (val), createDisplay (val), u149 (val), RunService (val), playStage (val)
    -- upvalues: colorParticles (val)
    local v1 = table.remove(u126, 1)
    if not v1 then
        return false
    end
    if v1.reward and v1.metadata and typeof(v1.reward) == "Instance" then
        local v2
        local v3 = ViewController:getCurrentView()
        ViewController:setView("Crate")
        LocalPlayer.CameraMinZoomDistance = 4
        local v4 = createParticles(1)
        local v5 = Create("Model", {
            Name = "Item Open",
            Parent = workspace.CurrentCamera,
            Create("Highlight", {
                FillTransparency = 1,
                OutlineTransparency = 0.8,
                OutlineColor = Color3.new(0, 0, 0),
                FillColor = Color3.new(1, 1, 1),
            }),
            v4,
        })
        local v6 = nil
        local v7 = nil
        local metadata = v1.metadata
        if v1.crate then
            v6 = v1.crate:Clone()
            v6:ScaleTo(metadata.crateScale or 1)
            fixCollisions(v6)
            createDisplay({title = "SPAM TAP TO OPEN!"}).Parent = v6
        end
        if v1.reward then
            v7 = v1.reward:Clone()
            v7:ScaleTo(metadata.rewardScale or 1)
            fixCollisions(v7)
        end
        if v6 then
            v2 = u149
            local cratePosition = metadata.cratePosition or CFrame.identity
            v2[v6] = cratePosition
        end
        v2 = u149
        local rewardPosition = metadata.rewardPosition or CFrame.identity
        v2[v7] = rewardPosition
        u149[v4] = (CFrame.new(0, 0, -2))
        local u113 = nil
        u113 = RunService.RenderStepped:Connect(function() -- Line: 392 -- upvalues: u149 (upval), u113 (ref)
            local v1
            local v2 = false
            local CurrentCamera = workspace.CurrentCamera
            local CFrame_2 = CurrentCamera and CurrentCamera.CFrame or CFrame.identity
            for i, j in u149 do
                v2 = true
                if i:IsA("Model") then
                    v1 = CFrame_2 * j
                    i:PivotTo(v1)
                elseif not i:IsA("BasePart") then
                    u149[i] = nil
                else
                    i.CFrame = CFrame_2 * j
                end
            end
            if not v2 then
                u113:Disconnect()
            end
        end)

        function v2() -- Line: 415 -- upvalues: u113 (ref)
            if u113.Connected then
                u113:Disconnect()
            end
        end

        local v8 = playStage("Blur", true, nil, metadata.fadeIn)
        if v6 then
            if v6 and metadata.crateCreated then
                metadata.crateCreated(v6)
            end
            playStage("CrateOpen", v6, v5, metadata)
        end
        playStage("Flash", v7)
        if metadata.exclusivityColor then
            colorParticles(v4, metadata.exclusivityColor)
        end
        playStage("RewardOpen", v7, v5, metadata)()
        playStage("Blur", false, v8, metadata.fadeOut)
        playStage("RewardLeave", v7, v5, metadata.fadeOut)
        if v6 then
            v6:Destroy()
        end
        v7:Destroy()
        v5:Destroy()
        v2()
        ViewController:setView(v3)
        if metadata.finished then
            metadata.finished()
        end
        LocalPlayer.CameraMinZoomDistance = 0.5
        return true
    end
    return true
end

function u154.Blur(a1, a2, a3, a4) -- Line: 539
    -- upvalues: DepthOfFieldEffect (val), TweenService (val)
    local v1 = {
        FarIntensity = DepthOfFieldEffect.FarIntensity,
        FocusDistance = DepthOfFieldEffect.FocusDistance,
        InFocusRadius = DepthOfFieldEffect.InFocusRadius,
        NearIntensity = DepthOfFieldEffect.NearIntensity,
    }
    if not a2 then
        if a4 ~= false then
            TweenService:Create(DepthOfFieldEffect, TweenInfo.new(0.2), a3):Play()
            task.delay(0.2, function() -- Line: 570 -- upvalues: DepthOfFieldEffect (upval)
                DepthOfFieldEffect.Enabled = false
            end)
            return
        end
        for k, v in pairs(a3) do
            DepthOfFieldEffect[k] = v
        end
        DepthOfFieldEffect.Enabled = false
        return
    end
    DepthOfFieldEffect.Enabled = true
    local v2 = {FarIntensity = 1, FocusDistance = 0, InFocusRadius = 1, NearIntensity = 0}
    if a4 == false then
        for k2, i in pairs(v2) do
            DepthOfFieldEffect[k2] = i
        end
        return v1
    end
    local v3 = TweenService:Create(DepthOfFieldEffect, TweenInfo.new(0.4), v2)
    v3:Play()
    v3.Completed:Wait()
    return v1
end

function u154.Flash(a1) -- Line: 583 -- upvalues: Create (val), Players (val), TweenService (val)
    local u13 = Create("Frame", {
        BackgroundTransparency = 0.4,
        BorderSizePixel = 0,
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
    })
    local u26 = Create("ScreenGui", {
        Name = "Flash",
        Parent = Players.LocalPlayer:WaitForChild("PlayerGui"),
        ResetOnSpawn = false,
        IgnoreGuiInset = true,
        u13,
    })
    task.spawn(function() -- Line: 599 -- upvalues: u13 (val), TweenService (upval), u26 (val)
        local v1 = u13
        local v2 = TweenInfo.new(1)
        local v3 = TweenService:Create(v1, v2, {BackgroundTransparency = 1})
        v3:Play()
        v3.Completed:Wait()
        u26:Destroy()
    end)
end

function u154.CrateOpen(a1, a2, a3, a4) -- Line: 608
    -- upvalues: SpringClass (val), RunService (val), u149 (val), Promise (val), Mouse (val), emitParticles (val)
    -- upvalues: Sound (val), TweenService (val)
    local cratePosition = a4.cratePosition
    if not cratePosition then
        cratePosition = CFrame.identity
    end
    local crateRotation = a4.crateRotation or CFrame.identity
    local Rotation = crateRotation.Rotation
    local u16 = SpringClass.new(70, 0.8, 20)
    u16.t = 70
    u16.p = 70
    u16.v = 0
    local u25 = SpringClass.new(Vector3.new(0, 0, 0), 0.2, 30)
    u25.t = Vector3.new(0, 0, 0)

    local function u27(a1) -- Line: 620 -- types: a1: number
        if workspace.CurrentCamera then
            workspace.CurrentCamera.FieldOfView = a1
        end
    end

    local u33 = RunService.RenderStepped:Connect(function() -- Line: 379 -- upvalues: u27 (val), u16 (val)
        u27(u16.p)
    end)

    local function u35(a1) -- Line: 626
        -- upvalues: u149 (upval), a2 (val), cratePosition (val), Rotation (val)
        if not u149[a2] then
            return nil
        end
        u149[a2] = cratePosition * Rotation * CFrame.Angles(a1.X, a1.Y, a1.Z)
    end

    local u45 = RunService.RenderStepped:Connect(function() -- Line: 379 -- upvalues: u35 (val), u25 (val)
        u35(u25.p)
    end)
    a2.Parent = a3
    if a4.crateCreated then
        a4.crateCreated(a2)
    end
    Promise.new(function(a1) -- Line: 643
        -- upvalues: Mouse (upval), u25 (val), emitParticles (upval), a3 (val), u16 (val), Sound (upval)
        -- upvalues: TweenService (upval)
        local u1 = 0
        local u2 = nil
        local v1 = Mouse.Button1Down:Connect(function() -- Line: 647
            -- upvalues: Mouse (upval), u1 (ref), u25 (upval), emitParticles (upval), a3 (upval), u16 (upval)
            -- upvalues: Sound (upval), u2 (ref), a1 (val), TweenService (upval)
            local Unit = (Vector2.new(Mouse.ViewSizeX, Mouse.ViewSizeY) / 2 - Vector2.new(Mouse.X, Mouse.Y)).Unit
            u1 = u1 + 1
            local v1 = u25
            v1.v = v1.v + Vector3.new(Unit.Y, Unit.X, 0) * 8 * u1
            emitParticles(a3.FX.Front.CrateHit)
            if workspace.CurrentCamera then
                v1 = u16
                v1.v = v1.v - u1 / 2 * 187
            end
            ;(Sound((("GiftHit%*"):format((math.random(1, 3)))))):Play(true, 0.9 + u1 * (math.random(0.2, 0.3)))
            if u1 >= 5 then
                u2:Disconnect()
                a1()
                return
            end
            a3.Highlight.FillTransparency = 0
            TweenService:Create(a3.Highlight, TweenInfo.new(0.8, Enum.EasingStyle.Sine), {FillTransparency = 1}):Play()
        end)
    end):await()
    ;(function() -- Line: 383 -- upvalues: u33 (val)
        if u33.Connected then
            u33:Disconnect()
        end
    end)()
    ;(function() -- Line: 383 -- upvalues: u45 (val)
        if u45.Connected then
            u45:Disconnect()
        end
    end)()
    a2.Parent = nil
end

function u154.RewardOpen(a1, a2, a3, a4) -- Line: 686
    -- upvalues: Create (val), Players (val), createDisplay (val), emitParticles (val), Sound (val), SpringClass (val)
    -- upvalues: u140 (val), u149 (val), RunService (val), customTween (val), UserInputService (val)
    a2.Parent = a3
    if a4.rewardCreated then
        a4.rewardCreated(a2)
    end
    local rewardPosition = a4.rewardPosition
    if not rewardPosition then
        rewardPosition = CFrame.identity
    end
    local rewardRotation = a4.rewardRotation
    if not rewardRotation then
        rewardRotation = CFrame.identity
    end
    local u14 = true
    local u25 = rewardPosition * CFrame.new(0, 0, -2) * rewardRotation.Rotation
    local Scale = a2:GetScale()
    local u32 = u25
    local BindableEvent = Instance.new("BindableEvent")
    local u42 = Create("ScreenGui", {Name = "RewardOpenUI", ResetOnSpawn = false, Parent = Players.LocalPlayer.PlayerGui})
    local u43 = false
    local u55 = createDisplay({
        title = a4.name,
        subTitle = a4.exclusivity,
        subTitleColor = a4.exclusivityColor,
        claimText = a4.claimText,
    }, function() -- Line: 710 -- upvalues: u43 (ref), BindableEvent (val)
        if u43 then
            return
        end
        u43 = true
        BindableEvent:Fire()
    end)
    u55.Adornee = a3.FX
    u55.Parent = u42
    a3.FX.Behind.Glow.Enabled = true
    a3.FX.Behind.Rays.Enabled = true
    emitParticles(a3.FX.Front.ItemObtain)
    if a4.rewardSound ~= "" then
        Sound(a4.rewardSound or "GiftOpen"):Play(true)
    end
    task.spawn(function() -- Line: 740
        -- upvalues: SpringClass (upval), u140 (upval), u14 (ref), u149 (upval), a2 (val), u32 (ref), RunService (upval)
        local p
        local v1 = SpringClass.new(-3.141592653589793, 0.3, 20)
        v1.t = 0
        local v2 = SpringClass.new(Vector3.new(0, 0, 0), 0.5, 1)
        v2.t = Vector3.new(0.07500000298023224, 0.07500000298023224, 0)
        v2.v = v2.v + u140:NextUnitVector() * 0.075
        while u14 do
            p = v2.p
            u149[a2] = u32 * CFrame.new((math.cos((tick()))) * p.X, (math.sin((tick()))) * p.Y, 0) * CFrame.Angles(0, v1.p, v1.p)
            RunService.RenderStepped:Wait()
        end
    end)
    customTween(TweenInfo.new(0.4, Enum.EasingStyle.Exponential), function(a1) -- Line: 763
        -- upvalues: u32 (ref), u25 (val), rewardPosition (val), rewardRotation (val), a2 (val), Scale (val)
        u32 = u25:Lerp(rewardPosition * rewardRotation.Rotation, a1)
        a2:ScaleTo((math.max(0.01, Scale * a1)))
    end, false)
    local v1 = UserInputService.InputEnded:Connect(function(a1) -- Line: 768 -- upvalues: u43 (ref), BindableEvent (val) -- types: a1: userdata
        if a1.UserInputType ~= Enum.UserInputType.MouseButton1
            and a1.UserInputType ~= Enum.UserInputType.Touch
            and a1.KeyCode ~= Enum.KeyCode.ButtonA then
            return
        end
        if u43 then
            return
        end
        u43 = true
        BindableEvent:Fire()
    end)
    BindableEvent.Event:Wait()
    v1:Disconnect()
    customTween(TweenInfo.new(0.2), function(a1) -- Line: 780 -- upvalues: u55 (ref)
        local Info = u55:FindFirstChild("Info")
        if Info then
            Info.ItemName.TextTransparency = a1
            Info.ItemName.UIStroke.Transparency = 0.5 + a1 * 0.5
            Info.ItemRarity.TextTransparency = a1
            Info.ItemRarity.UIStroke.Transparency = 0.5 + a1 * 0.5
        end
        local Claimed = u55:FindFirstChild("Claimed")
        if Claimed then
            Claimed.Button.ImageTransparency = a1
            Claimed.Button.Value.TextTransparency = a1
            Claimed.Button.Value.UIStroke.Transparency = 0.5 + a1 * 0.5
        end
    end, false)
    task.delay(0.2, function() -- Line: 798 -- upvalues: u42 (val)
        u42:Destroy()
    end)
    return function() -- Line: 802 -- upvalues: u14 (ref)
        u14 = false
    end
end

function u154.RewardLeave(a1, a2, a3, a4) -- Line: 807
    -- upvalues: customTween (val)
    if a4 == false then
        return
    end
    customTween(TweenInfo.new(0.2, Enum.EasingStyle.Sine), function(a1) -- Line: 812 -- upvalues: a3 (val)
        a3:ScaleTo((math.max(0.01, 1 - a1)))
    end, true)
end

task.spawn(function() -- Line: 817 -- upvalues: process (val), BindableEvent (val)
    local result, success
    while true do
        success, result = pcall(process)
        if not success then
            warn((("ERROR while attempting to unbox:\n%*"):format(result)))
        end
        if success and not result then
            BindableEvent.Event:Wait()
        end
    end
end)

function v1.Unbox(a1, a2, a3) -- Line: 830
    -- upvalues: u126 (val), BindableEvent (val)
    local v1 = #u126 < 1
    table.insert(u126, {crate = a1, reward = a2, metadata = a3})
    if v1 then
        BindableEvent:Fire()
    end
end

function v1.Present(a1, a2) -- Line: 839 -- upvalues: u126 (val), BindableEvent (val) -- types: a1: userdata, a2: table
    local v1 = #u126 < 1
    table.insert(u126, {reward = a1, metadata = a2})
    if v1 then
        BindableEvent:Fire()
    end
end

function v1.GetMetadataForReward(a1, a2, ...) -- Line: 848
    -- upvalues: Streaming (val), Asset (val), ItemPresentations (val), TowerDisplayName (val), Enum (val), Create (val)
    -- upvalues: Players (val), LocalPlayer (val), EmoteReplicator (val), PlayerCharacterReplicator (val)
    -- upvalues: ItemController (val), RichText (val), RunService (val), ReplicatedStorage (val)
    local v1, v2, v3
    local v4 = nil
    local v5 = {}
    if a1 ~= "Tower" and a1 ~= "Skin" then
        if a1 == "Crate" then
            local u7 = Asset("NewCrates", a2)
            assert(u7, (("Crate \"%*\" does not exist!"):format(a2)))
            local Model = Create("Model")
            return Model, {
                exclusivity = "",
                rewardScale = 0.2,
                name = ("%*"):format(a2),
                rewardPosition = CFrame.new(0, 0, -2),
                rewardRotation = CFrame.Angles(0, 0, 0),
                rewardCreated = function(a1) -- Line: 935 -- upvalues: Model (val), Create (upval), u7 (val) -- types: a1: userdata
                    Model:Destroy()
                    local v1 = Create
                    local v2 = {
                        Name = "Root",
                        Size = Vector3.new(1, 1, 0.10000000149011612),
                        Anchored = true,
                        CanCollide = false,
                        CanQuery = false,
                        CanTouch = false,
                        Transparency = 1,
                    }
                    local v3 = Create
                    local v4 = {
                        Name = "Display",
                        CanvasSize = Vector2.new(300, 60),
                        Brightness = 2,
                        LightInfluence = 0,
                        PixelsPerStud = 300,
                        SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud,
                        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
                        ZOffset = -0.1,
                        Face = Enum.NormalId.Back,
                        AutoLocalize = false,
                        AlwaysOnTop = true,
                    }
                    local v5 = Create
                    local v6 = {Name = "Icon", BackgroundTransparency = 1}
                    local Icon_3 = if not tonumber(u7.Icon) then u7.Icon else ("rbxassetid://%*"):format(u7.Icon)
                    v6.Image = Icon_3
                    v6.Size = UDim2.fromScale(1, 1)
                    v6.AnchorPoint = Vector2.new(0.5, 0.5)
                    v6.Position = UDim2.fromScale(0.5, 0.5)
                    v6.ScaleType = Enum.ScaleType.Fit
                    v4[1] = (v5("ImageLabel", v6))
                    v2[1] = (v3("SurfaceGui", v4))
                    v1 = v1("Part", v2)
                    v1.Parent = a1
                    a1.PrimaryPart = v1
                end,
            }
        end
        if a1 == "Emote" then
            local u38 = nil
            v3 = Asset("NewEmotes", a2)
            assert(v3, (("Emote \"%*\" does not exist!"):format(a2)))
            local u56 = Players:CreateHumanoidModelFromUserId(LocalPlayer.UserId)
            return u56, {
                rewardScale = 0.2,
                name = ("%*"):format(a2),
                exclusivity = v3 and Enum.SkinRarity.ToString(v3.Rarity) or "Common",
                rewardPosition = CFrame.new(0, 0, -2),
                rewardRotation = (CFrame.Angles(0, 0.7853981633974483, 0)) * CFrame.Angles(0, 3.141592653589793, 0),
                rewardCreated = function(a1) -- Line: 995
                    -- upvalues: u56 (val), u38 (ref), EmoteReplicator (upval), LocalPlayer (upval)
                    -- upvalues: PlayerCharacterReplicator (upval), a2 (val)
                    u56:Destroy()
                    local new = EmoteReplicator.new
                    local v1 = {
                        Player = LocalPlayer,
                        Instance = a1,
                        Root = a1.PrimaryPart,
                        Humanoid = a1.Humanoid,
                    }
                    local Animator = a1.Humanoid:FindFirstChild("Animator") or Instance.new("Animator", a1.Humanoid)
                    v1.Animator = Animator
                    v1.AddAccessories = PlayerCharacterReplicator.AddAccessories
                    v1.RemoveAccessories = PlayerCharacterReplicator.RemoveAccessories
                    u38 = new(v1, a2)
                    u38:Play((workspace:GetServerTimeNow()))
                    for i, j in a1:GetDescendants() do
                        if j:IsA("BasePart") then
                            j.CollisionGroup = "Players"
                        end
                    end
                end,
                finished = function() -- Line: 1021 -- upvalues: u38 (ref)
                    u38:Destroy()
                end,
            }
        end
        if a1 == "Consumable" then
            local u99 = Asset("Consumables", a2)
            assert(u99, (("Consumable \"%*\" does not exist!"):format(a2)))
            local Model_2 = Create("Model")
            return Model_2, {
                rewardScale = 0.2,
                name = ("%*"):format(a2),
                exclusivityColor = ItemController:consumable(a2).rarityColor,
                exclusivity = u99.Rarity and Enum.ConsumableRarity.ToString(u99.Rarity) or "Common",
                rewardPosition = CFrame.new(0, 0, -2),
                rewardRotation = CFrame.Angles(0, 0, 0),
                rewardCreated = function(a1) -- Line: 1043 -- upvalues: Model_2 (val), Create (upval), u99 (val) -- types: a1: userdata
                    Model_2:Destroy()
                    local v1 = Create("Part", {
                        Name = "Root",
                        Size = Vector3.new(1, 1, 0.10000000149011612),
                        Anchored = true,
                        CanCollide = false,
                        CanQuery = false,
                        CanTouch = false,
                        Transparency = 1,
                        (Create("SurfaceGui", {
                            Name = "Display",
                            CanvasSize = Vector2.new(300, 60),
                            Brightness = 2,
                            LightInfluence = 0,
                            PixelsPerStud = 300,
                            SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud,
                            ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
                            ZOffset = -0.1,
                            Face = Enum.NormalId.Back,
                            AutoLocalize = false,
                            AlwaysOnTop = true,
                            (Create("ImageLabel", {
                                Name = "Icon",
                                BackgroundTransparency = 1,
                                Image = ("rbxassetid://%*"):format(u99.Icon),
                                Size = UDim2.fromScale(1, 1),
                                AnchorPoint = Vector2.new(0.5, 0.5),
                                Position = UDim2.fromScale(0.5, 0.5),
                                ScaleType = Enum.ScaleType.Fit,
                            })),
                        })),
                    })
                    v1.Parent = a1
                    a1.PrimaryPart = v1
                end,
            }
        end
        if a1 == "Tag" then
            local v6 = Asset("NewTags", a2)
            assert(v6, (("Nametag \"%*\" does not exist!"):format(a2)))
            local Model_3 = Create("Model")
            return Model_3, {
                rewardScale = 0.2,
                name = ("%*"):format(a2),
                exclusivity = v6 and Enum.SkinRarity.ToString(v6.Rarity) or "Common",
                rewardPosition = CFrame.new(0, 0, -2),
                rewardRotation = CFrame.Angles(0, 0, 0),
                rewardCreated = function(a1) -- Line: 1100
                    -- upvalues: Model_3 (val), Create (upval), RichText (upval), a2 (val), RunService (upval)
                    Model_3:Destroy()
                    local v1 = Create("Part", {
                        Name = "Root",
                        Size = Vector3.new(3, 1, 1),
                        Anchored = true,
                        CanCollide = false,
                        CanQuery = false,
                        CanTouch = false,
                        Transparency = 1,
                        [2] = Create("SurfaceGui", {
                            Name = "Display",
                            Brightness = 2,
                            LightInfluence = 0,
                            PixelsPerStud = 300,
                            ZOffset = -0.1,
                            AutoLocalize = false,
                            AlwaysOnTop = true,
                            CanvasSize = Vector2.new(300, 60),
                            SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud,
                            ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
                            Face = Enum.NormalId.Back,
                        }),
                    })
                    local u43 = RichText({
                        textScale = 1,
                        textSettings = {Font = "GothamBold"},
                        text = string.format("<%s>%s</%s>", a2:lower(), a2, a2:lower()),
                        adornee = v1,
                        Parent = v1.Display,
                    })
                    v1.Parent = a1
                    local u49 = RunService.RenderStepped:Connect(function(a1) -- Line: 1145 -- upvalues: u43 (val)
                        u43:Step(a1)
                    end)
                    a1.PrimaryPart = v1
                    a1.Destroying:Connect(function() -- Line: 1150 -- upvalues: u49 (val), u43 (val)
                        u49:Disconnect()
                        u43:Destroy()
                    end)
                end,
                finished = function() end,
            }
        end
        if a1 == "Stat" then
            v3 = {Coins = "Coins", SpinTickets = "Spin", TimescaleTickets = "Timescale"}
            local v7 = {Coins = "Coins", SpinTickets = "Spin Ticket(s)", TimescaleTickets = "Time Scale Ticket(s)"}
            local u208 = (require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Icons))[v3[a2] or "Coins"]
            v1 = v7[a2] or a2
            local Model_4 = Create("Model")
            v4 = Model_4
            local v8 = {exclusivity = "Currency", rewardScale = 0.3}
            local v9 = ...
            v8.name = ("%* %*"):format(v9, v1)
            v8.exclusivityColor = Color3.fromRGB(255, 215, 0)
            v8.rewardPosition = CFrame.new(0, 0, -2)
            v8.rewardRotation = CFrame.Angles(0, 0, 0)

            function v8.rewardCreated(a1) -- Line: 1192
                -- upvalues: Model_4 (val), Create (upval), u208 (val)
                Model_4:Destroy()
                local v1 = Create("Part", {
                    Name = "Root",
                    Size = Vector3.new(1, 1, 0.10000000149011612),
                    Anchored = true,
                    CanCollide = false,
                    CanQuery = false,
                    CanTouch = false,
                    Transparency = 1,
                    Create("Decal", {Texture = u208, Face = Enum.NormalId.Back}),
                    (Create("SurfaceGui", {
                        Name = "Display",
                        CanvasSize = Vector2.new(200, 200),
                        Brightness = 2,
                        LightInfluence = 0,
                        PixelsPerStud = 200,
                        SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud,
                        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
                        ZOffset = -0.1,
                        Face = Enum.NormalId.Back,
                        AutoLocalize = false,
                        AlwaysOnTop = true,
                        (Create("ImageLabel", {
                            Name = "Icon",
                            BackgroundTransparency = 1,
                            Size = UDim2.fromScale(1, 1),
                            Image = u208,
                            ScaleType = Enum.ScaleType.Fit,
                        })),
                    })),
                })
                v1.Parent = a1
                a1.PrimaryPart = v1
            end

            v5 = v8
        end
        return v4, v5
    end
    local u245 = ...
    if not (u245 ~= nil) then
        u245 = "Default"
    end
    Streaming:FireServer("SelectTower", a2, u245)
    local v10 = Asset("Troops", a2)
    local v11 = v10.Properties.SkinData[u245]
    local u280 = Asset("TroopsModel", a2, u245)
    v1 = ItemPresentations("Towers", a2)
    if v1 and a2 ~= "Mercenary Base" then
        v2 = v1.Init(u280, {}, false)
        if v2 then
            u280 = v2
        end
    end
    u280.WorldPivot = u280.PrimaryPart.CFrame
    v2 = TowerDisplayName.fromAsset(a2, nil)
    local DisplayName = v11 and v11.DisplayName or u245
    v4 = u280
    local v12 = {rewardScale = 0.5, name = if not v3 then v2 else ("%* %*"):format(DisplayName, v2)}
    v12.exclusivity = if a1 ~= "Skin" then "Common" else if not v10 then "Common" else if not v11 then "Common" else Enum.SkinRarity.ToString(v11.Rarity)
    v12.rewardPosition = CFrame.new(0, 0, -2)
    v12.rewardRotation = (CFrame.Angles(0, 0.7853981633974483, 0)) * CFrame.Angles(0, 3.141592653589793, 0)

    function v12.rewardCreated(a1) -- Line: 897 -- upvalues: u280 (ref)
        local AnimationController = a1:FindFirstChildOfClass("AnimationController")
        local Animations = a1 and a1:FindFirstChild("Animations")
        local Idle = Animations and Animations:FindFirstChild("Idle")
        if AnimationController and Idle then
            local v1 = AnimationController:LoadAnimation(Idle:FindFirstChild("0") or Idle:GetChildren()[1])
            v1:Play(0)
            v1:AdjustSpeed(0)
        end
        u280:Destroy()
    end

    function v12.finished() -- Line: 916 -- upvalues: Streaming (upval), a2 (val), u245 (ref)
        Streaming:FireServer("RemoveTowers", {[a2] = {u245}})
    end

    return v4, v12
end

return v1
-- Script path: ReplicatedStorage.Client.Modules.Replicators.HighlightArea
-- Decompile time: 12.37 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Network = require(ReplicatedStorage.Shared.Modules.Network)
local spr = require(ReplicatedStorage.Shared.Modules.spr)
local u30 = {}
local u31 = {}
local HighlightArea = Network.Channel("HighlightArea")
local Trash = workspace:WaitForChild("Trash")
local PointerArrow = ReplicatedStorage.Assets.Models.PointerArrow
local u47 = Color3.fromRGB(233, 218, 137)
local u52 = Color3.fromRGB(255, 248, 99)
local u57 = CFrame.Angles(-1.5707963267948966, 0, 0)

function u30.CreateAt(a1, a2, a3, a4) -- Line: 41
    -- upvalues: u47 (val), PointerArrow (val), Trash (val), u31 (val), spr (val), Players (val), TweenService (val)
    -- upvalues: u30 (val)
    local v1 = a3 or Color3.fromRGB(255, 255, 255)
    local v2 = a2 or 5
    local Part = Instance.new("Part")
    Part.Anchored = true
    Part.CanCollide = false
    Part.CanTouch = false
    Part.CanQuery = false
    Part.Transparency = 1
    Part.Position = a1
    Part.Color = v1
    Part.Size = Vector3.new(0, 0, 0)
    local SurfaceGui = Instance.new("SurfaceGui")
    SurfaceGui.SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud
    SurfaceGui.Name = "GUI"
    SurfaceGui.Face = Enum.NormalId.Top
    local Frame = Instance.new("Frame")
    Frame.Name = "Base"
    Frame.BackgroundTransparency = 1
    Frame.Size = UDim2.fromScale(0.95, 0.95)
    Frame.AnchorPoint = Vector2.new(0.5, 0.5)
    Frame.Position = UDim2.fromScale(0.5, 0.5)
    local UIStroke = Instance.new("UIStroke")
    UIStroke.Transparency = 1
    UIStroke.Color = u47
    UIStroke.Thickness = 10
    UIStroke.Parent = Frame
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(1, 0)
    UICorner.Parent = Frame
    Frame.Parent = SurfaceGui
    local Decal = Instance.new("Decal")
    Decal.Name = "Inside"
    Decal.Texture = "rbxassetid://16442967399"
    Decal.Face = Enum.NormalId.Top
    Decal.Transparency = 1
    Decal.Color3 = u47
    Decal.Parent = Part
    SurfaceGui.Parent = Part
    local v3 = PointerArrow:Clone()
    v3.Transparency = 1
    v3.Color = v1
    v3.Size = Vector3.new(0, 0, 0)
    v3:SetAttribute("Offset", a4 or Vector3.new(0, 0, 0))
    Part.Parent = Trash
    v3.Parent = Trash
    local Part_2 = Instance.new("Part")
    Part_2.Anchored = true
    Part_2.CanCollide = false
    Part_2.CanTouch = false
    Part_2.CanQuery = false
    Part_2.Transparency = 1
    Part_2.Size = Vector3.new(1, 1, 1)
    Part_2.Position = a1
    Part_2.Parent = Trash
    local Attachment = Instance.new("Attachment")
    Attachment.Parent = Part_2
    local Beam = Instance.new("Beam")
    Beam.Name = "Beam"
    Beam.Brightness = 2.5
    Beam.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 30, 30)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 204, 76))),
    })
    Beam.FaceCamera = true
    Beam.Segments = 1
    Beam.Texture = "rbxassetid://12338397670"
    Beam.TextureLength = 1.5
    Beam.TextureMode = Enum.TextureMode.Static
    Beam.TextureSpeed = 2
    Beam.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), (NumberSequenceKeypoint.new(1, 0))})
    Beam.Width0 = 2
    Beam.Width1 = 2
    Beam.Attachment1 = Attachment
    Beam.Parent = Part_2
    u31[a1] = {
        ringPart = Part,
        arrow = v3,
        radius = v2,
        beam = Beam,
        beamAnchor = Part_2,
    }
    spr.target(v3, 0.5, 1, {Transparency = 0.5, Size = PointerArrow.Size})
    spr.target(Part, 1, 1, {Size = Vector3.new(v2, 0, v2)})
    spr.target(Decal, 1, 1, {Transparency = 0.5})
    spr.target(Part.GUI.Base.UIStroke, 1, 3, {Transparency = 0})
    local CurrentCamera = workspace.CurrentCamera
    local Character = Players.LocalPlayer.Character
    local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")
    if CurrentCamera and HumanoidRootPart then
        local Position = HumanoidRootPart.Position
        local v4 = CurrentCamera.CFrame.Position - Position
        local Magnitude = v4.Magnitude
        local Y = v4.Y
        local v5 = (a1 - Position) * Vector3.new(1, 0, 1)
        if 0.01 < v5.Magnitude then
            local v6 = CFrame.lookAt(Position - v5.Unit * Magnitude + Vector3.new(0, Y + 5, 0), Position)
            CurrentCamera.CameraType = Enum.CameraType.Scriptable
            local v7 = TweenService:Create(CurrentCamera, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {CFrame = v6})
            v7:Play()
            v7.Completed:Once(function() -- Line: 185 -- upvalues: CurrentCamera (val)
                CurrentCamera.CameraType = Enum.CameraType.Custom
            end)
        end
    end
    return function() -- Line: 191 -- upvalues: u30 (upval), a1 (val)
        u30.clear(a1)
    end
end

function u30.clear(a1) -- Line: 196 -- upvalues: u31 (val), spr (val) -- types: a1: vector
    local u2 = u31[a1]
    u31[a1] = nil
    if u2 then
        spr.target(u2.arrow, 1, 3, {Size = Vector3.new(0, 0, 0), Transparency = 1})
        spr.target(u2.ringPart, 1, 3, {Size = Vector3.new(0, 0, 0)})
        spr.target(u2.ringPart.GUI.Base.UIStroke, 1, 3, {Transparency = 1})
        spr.target(u2.ringPart.Inside, 1, 3, {Transparency = 1})
        if u2.beamAttachment0 then
            u2.beamAttachment0:Destroy()
        end
        if u2.beamAnchor then
            u2.beamAnchor:Destroy()
        end
        spr.completed(u2.arrow, function() -- Line: 222 -- upvalues: u2 (val)
            u2.arrow:Destroy()
        end)
        spr.completed(u2.ringPart, function() -- Line: 226 -- upvalues: u2 (val)
            u2.ringPart:Destroy()
        end)
    end
end

function u30.clearAll() -- Line: 232 -- upvalues: u31 (val), u30 (val)
    for k, v in pairs(u31) do
        u30.clear(k)
    end
end

RunService.Heartbeat:Connect(function() -- Line: 238 -- upvalues: u47 (val), u52 (val), Players (val), u31 (val), u57 (val)
    local Attachment, Attribute, arrow, ringPart, v1
    local CurrentCamera = workspace.CurrentCamera
    if not CurrentCamera then
        return
    end
    local Position = CurrentCamera.CFrame.Position
    local v2 = tick()
    local v3 = math.sin(v2)
    local v4 = (math.sin(v2 * 2) + 1) * 0.5
    local v5 = u47:Lerp(u52, v4)
    local v6 = Vector3.new(0, math.abs(v3) + 2, 0)
    local Character = Players.LocalPlayer.Character
    local PrimaryPart = Character and Character.PrimaryPart
    for k, v in pairs(u31) do
        ringPart = v.ringPart
        arrow = v.arrow
        ringPart.CFrame = (CFrame.new(k)) * CFrame.Angles(0, v2, 0)
        ringPart.GUI.Base.UIStroke.Color = v5
        ringPart.Inside.Color3 = v5
        arrow.Color = v5
        ringPart.GUI.Base.UIStroke.Thickness = v4 * 3 + 10
        v1 = k + v6
        Attribute = arrow:GetAttribute("Offset")
        arrow.CFrame = (CFrame.lookAt(v1, (Vector3.new(Position.X, k.Y, Position.Z)))) * u57 + Attribute
        if v.beam and PrimaryPart then
            if not v.beamAttachment0 or v.beamAttachment0.Parent ~= PrimaryPart then
                if v.beamAttachment0 then
                    v.beamAttachment0:Destroy()
                end
                Attachment = Instance.new("Attachment")
                Attachment.Parent = PrimaryPart
                v.beam.Attachment0 = Attachment
                v.beamAttachment0 = Attachment
            end
        end
    end
end)
HighlightArea:On("CreateAt", u30.CreateAt)
HighlightArea:On("Clear", u30.clear)
HighlightArea:On("ClearAll", u30.clearAll)
return u30
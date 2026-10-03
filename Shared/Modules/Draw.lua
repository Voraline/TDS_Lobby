-- Script path: ReplicatedStorage.Shared.Modules.Draw
-- Decompile time: 5.10 ms

local RunService = game:GetService("RunService")
local TextService = game:GetService("TextService")
local Workspace = game:GetService("Workspace")
local Terrain = Workspace.Terrain
local u20 = Color3.new(1, 0, 0)
local u21 = {_defaultColor = u20}

function u21.setColor(a1) -- Line: 24 -- upvalues: u21 (val)
    u21._defaultColor = a1
end

function u21.resetColor() -- Line: 30 -- upvalues: u21 (val), u20 (val)
    u21._defaultColor = u20
end

function u21.setRandomColor() -- Line: 37 -- upvalues: u21 (val)
    u21.setColor(Color3.fromHSV(math.random(), 0.5 + 0.5 * math.random(), 1))
end

function u21.ray(a1, a2, a3, a4, a5) -- Line: 50 -- upvalues: u21 (val)
    assert(typeof(a1) == "Ray", "Bad typeof(ray) for Ray")
    local v1 = a2 or u21._defaultColor
    local v2 = a3 or u21.getDefaultParent()
    local v3 = a4 or 0.2
    local v4 = a5 or 0.2
    local v5 = a1.Origin + a1.Direction / 2
    local Part = Instance.new("Part")
    Part.Material = Enum.Material.ForceField
    Part.Anchored = true
    Part.Archivable = false
    Part.CanCollide = false
    Part.CastShadow = false
    Part.CFrame = (CFrame.new(v5, a1.Origin + a1.Direction)) * CFrame.Angles(1.5707963267948966, 0, 0)
    Part.Color = v1
    Part.Name = "DebugRay"
    Part.Shape = Enum.PartType.Cylinder
    Part.Size = Vector3.new(v4, a1.Direction.Magnitude, v4)
    Part.TopSurface = Enum.SurfaceType.Smooth
    Part.Transparency = 0.5
    local Part_2 = Instance.new("Part")
    Part_2.Anchored = true
    Part_2.Archivable = false
    Part_2.CanCollide = false
    Part_2.CastShadow = false
    Part_2.CFrame = CFrame.new(a1.Origin, a1.Origin + a1.Direction)
    Part_2.Transparency = 1
    Part_2.Size = Vector3.new(1, 1, 1)
    Part_2.Parent = Part
    local LineHandleAdornment = Instance.new("LineHandleAdornment")
    LineHandleAdornment.Length = a1.Direction.Magnitude
    LineHandleAdornment.Thickness = 5 * v4
    LineHandleAdornment.ZIndex = 3
    LineHandleAdornment.Color3 = v1
    LineHandleAdornment.AlwaysOnTop = true
    LineHandleAdornment.Transparency = 0
    LineHandleAdornment.Adornee = Part_2
    LineHandleAdornment.Parent = Part_2
    local SpecialMesh = Instance.new("SpecialMesh")
    SpecialMesh.Scale = Vector3.new(0, 1, 0) + Vector3.new(v3, 0, v3) / v4
    SpecialMesh.Parent = Part
    Part.Parent = v2
    return Part
end

function u21.text(a1, a2, a3) -- Line: 111 -- upvalues: Terrain (val), u21 (val)
    if typeof(a1) ~= "Vector3" then
        if typeof(a1) == "Instance" then
            return u21._textOnAdornee(a1, a2, a3)
        end
        error("Bad adornee")
        return
    end
    local Attachment = Instance.new("Attachment")
    Attachment.WorldPosition = a1
    Attachment.Parent = Terrain
    Attachment.Name = "DebugTextAttachment"
    u21._textOnAdornee(Attachment, a2, a3)
    return Attachment
end

function u21._textOnAdornee(a1, a2, a3) -- Line: 128 -- upvalues: u21 (val), TextService (val)
    local BillboardGui = Instance.new("BillboardGui")
    BillboardGui.Name = "DebugBillboardGui"
    BillboardGui.SizeOffset = Vector2.new(0, 0.5)
    BillboardGui.ExtentsOffset = Vector3.new(0, 1, 0)
    BillboardGui.AlwaysOnTop = true
    BillboardGui.Adornee = a1
    BillboardGui.StudsOffset = Vector3.new(0, 0, 0.009999999776482582)
    local Frame = Instance.new("Frame")
    Frame.Name = "Background"
    Frame.Size = UDim2.new(1, 0, 1, 0)
    Frame.Position = UDim2.new(0.5, 0, 1, 0)
    Frame.AnchorPoint = Vector2.new(0.5, 1)
    Frame.BackgroundTransparency = 0.3
    Frame.BorderSizePixel = 0
    Frame.BackgroundColor3 = a3 or u21._defaultColor
    Frame.Parent = BillboardGui
    local TextLabel = Instance.new("TextLabel")
    TextLabel.Text = tostring(a2)
    TextLabel.TextScaled = true
    TextLabel.TextSize = 32
    TextLabel.BackgroundTransparency = 1
    TextLabel.BorderSizePixel = 0
    TextLabel.TextColor3 = Color3.new(1, 1, 1)
    TextLabel.Size = UDim2.new(1, 0, 1, 0)
    TextLabel.Parent = Frame
    if not tonumber(a2) then
        TextLabel.Font = Enum.Font.GothamSemibold
    else
        TextLabel.Font = Enum.Font.Code
    end
    local TextSize_2 = TextService:GetTextSize(TextLabel.Text, TextLabel.TextSize, TextLabel.Font, (Vector2.new(1024, 1000000)))
    local v1 = TextSize_2.y / TextLabel.TextSize
    local v2 = TextLabel.TextSize * 0.5
    local v3 = TextSize_2.y + 2 * v2
    local v4 = TextSize_2.x + 2 * v2
    local v5 = v4 / v3
    local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
    UIAspectRatioConstraint.AspectRatio = v5
    UIAspectRatioConstraint.Parent = Frame
    local UIPadding = Instance.new("UIPadding")
    UIPadding.PaddingBottom = UDim.new(v2 / v3, 0)
    UIPadding.PaddingTop = UDim.new(v2 / v3, 0)
    UIPadding.PaddingLeft = UDim.new(v2 / v4, 0)
    UIPadding.PaddingRight = UDim.new(v2 / v4, 0)
    UIPadding.Parent = Frame
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(v2 / v3 / 2, 0)
    UICorner.Parent = Frame
    local v6 = v1 * 2 * 2 * 0.5
    BillboardGui.Size = UDim2.new(v6 * v5, 0, v6, 0)
    BillboardGui.Parent = a1
    return BillboardGui
end

function u21.point(a1, a2, a3, a4) -- Line: 211 -- upvalues: u21 (val)
    assert(typeof(a1) == "Vector3", "Vector3 not")
    local p = if typeof(a1) ~= "CFrame" then a1 else a1.p
    local v1 = a2 or u21._defaultColor
    local v2 = a3 or u21.getDefaultParent()
    local v3 = a4 or 1
    local Part = Instance.new("Part")
    Part.Material = Enum.Material.ForceField
    Part.Anchored = true
    Part.Archivable = false
    Part.BottomSurface = Enum.SurfaceType.Smooth
    Part.CanCollide = false
    Part.CastShadow = false
    Part.CFrame = CFrame.new(p)
    Part.Color = v1
    Part.Name = "DebugPoint"
    Part.Shape = Enum.PartType.Ball
    Part.Size = Vector3.new(v3, v3, v3)
    Part.TopSurface = Enum.SurfaceType.Smooth
    Part.Transparency = 0.5
    local SphereHandleAdornment = Instance.new("SphereHandleAdornment")
    SphereHandleAdornment.Archivable = false
    SphereHandleAdornment.Radius = v3 / 4
    SphereHandleAdornment.Color3 = v1
    SphereHandleAdornment.AlwaysOnTop = true
    SphereHandleAdornment.Adornee = Part
    SphereHandleAdornment.ZIndex = 2
    SphereHandleAdornment.Parent = Part
    Part.Parent = v2
    return Part
end

function u21.cframe(a1) -- Line: 256 -- upvalues: u21 (val)
    local Model = Instance.new("Model")
    Model.Name = "DebugCFrame"
    local Position = a1.Position
    u21.point(Position, nil, Model, 0.1)
    local v1 = u21.ray(Ray.new(Position, a1.XVector), Color3.new(0.75, 0.25, 0.25), Model, 0.1)
    v1.Name = "XVector"
    local v2 = u21.ray(Ray.new(Position, a1.YVector), Color3.new(0.25, 0.75, 0.25), Model, 0.1)
    v2.Name = "YVector"
    local v3 = u21.ray(Ray.new(Position, a1.ZVector), Color3.new(0.25, 0.25, 0.75), Model, 0.1)
    v3.Name = "ZVector"
    Model.Parent = u21.getDefaultParent()
    return Model
end

function u21.box(a1, a2, a3) -- Line: 287 -- upvalues: u21 (val)
    assert(typeof(a2) == "Vector3", "not Vector3")
    local v1 = a3 or u21._defaultColor
    local v2 = not (typeof(a1) ~= "Vector3") and CFrame.new(a1) or a1
    local Part = Instance.new("Part")
    Part.Color = v1
    Part.Material = Enum.Material.ForceField
    Part.Name = "DebugPart"
    Part.Anchored = true
    Part.CanCollide = false
    Part.CastShadow = false
    Part.Archivable = false
    Part.BottomSurface = Enum.SurfaceType.Smooth
    Part.TopSurface = Enum.SurfaceType.Smooth
    Part.Transparency = 0.75
    Part.Size = a2
    Part.CFrame = v2
    local BoxHandleAdornment = Instance.new("BoxHandleAdornment")
    BoxHandleAdornment.Adornee = Part
    BoxHandleAdornment.Size = a2
    BoxHandleAdornment.Color3 = v1
    BoxHandleAdornment.AlwaysOnTop = true
    BoxHandleAdornment.Transparency = 0.75
    BoxHandleAdornment.ZIndex = 1
    BoxHandleAdornment.Parent = Part
    Part.Parent = u21.getDefaultParent()
    return Part
end

function u21.region3(a1, a2) -- Line: 327 -- upvalues: u21 (val)
    return u21.box(a1.CFrame, a1.Size, a2)
end

function u21.terrainCell(a1, a2) -- Line: 337 -- upvalues: Terrain (val), u21 (val)
    local v1 = Terrain:WorldToCell(a1)
    local v2 = u21.box(CFrame.new((Terrain:CellCenterToWorld(v1.x, v1.y, v1.z))), Vector3.new(4, 4, 4), a2)
    v2.Name = "DebugTerrainCell"
    return v2
end

function u21.line(a1, a2, a3, a4, a5) -- Line: 358 -- upvalues: u21 (val)
    return u21.ray(Ray.new(a1, a2 - a1), a3, a4, nil, a5)
end

function u21.vector(a1, a2, a3, a4, a5) -- Line: 371 -- upvalues: u21 (val)
    return u21.ray(Ray.new(a1, a2), a3, a4, a5)
end

function u21.getDefaultParent() -- Line: 375 -- upvalues: RunService (val), Workspace (val)
    if not RunService:IsRunning() then
        return Workspace.CurrentCamera
    end
    return RunService:IsServer() and Workspace or Workspace.CurrentCamera
end

return u21
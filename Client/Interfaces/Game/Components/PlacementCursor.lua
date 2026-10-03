-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.PlacementCursor
-- Decompile time: 1.96 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
require(ReplicatedStorage.Shared.UI.ReactTypes)
local createElement = React.createElement
return function(a1) -- Line: 13 -- upvalues: createElement (val) -- types: a1: table
    return createElement("Part", {
        Anchored = true,
        CanCollide = false,
        CanQuery = false,
        CanTouch = false,
        CastShadow = false,
        EnableFluidForces = false,
        Transparency = 1,
        BottomSurface = Enum.SurfaceType.Smooth,
        TopSurface = Enum.SurfaceType.Smooth,
        CFrame = a1.cframe,
        Color = Color3.fromRGB(136, 136, 136),
        Material = Enum.Material.Glass,
        Size = Vector3.new(a1.size, 0.001, a1.size),
    }, {
        mesh = createElement("SpecialMesh", {
            MeshId = "rbxassetid://3746001467",
            MeshType = Enum.MeshType.FileMesh,
            Scale = Vector3.new(a1.size, 0.001, a1.size),
        }),
        border = createElement("SurfaceGui", {
            AlwaysOnTop = true,
            PixelsPerStud = 32,
            SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud,
            Face = Enum.NormalId.Top,
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        }, {
            border1 = createElement("ImageLabel", {
                Image = "rbxassetid://13022105306",
                BackgroundTransparency = 1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(1, 1),
            }),
        }),
        boundary = createElement("SurfaceGui", {
            Brightness = 2,
            PixelsPerStud = 32,
            SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud,
            Face = Enum.NormalId.Top,
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        }, {
            frame = createElement("Frame", {
                BorderSizePixel = 0,
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromOffset(2, 30),
            }),
            frame1 = createElement("Frame", {
                BorderSizePixel = 0,
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromOffset(30, 2),
            }),
        }),
        highlight = createElement("Highlight", {
            FillTransparency = 0.8,
            OutlineTransparency = 1,
            DepthMode = Enum.HighlightDepthMode.Occluded,
            FillColor = Color3.fromRGB(255, 255, 255),
        }),
    })
end
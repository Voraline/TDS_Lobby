-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.NewTowerRange.TowerBoundary
-- Decompile time: 1.63 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
return (React.memo(function(a1) -- Line: 14 -- upvalues: createElement (val) -- types: a1: table
    local Radius = a1.Radius
    local v1 = a1.ShowOnlyBoundary or false
    local u5 = if not v1 then 1 else 2
    local v2 = Radius:map(function(a1) -- Line: 19 -- upvalues: u5 (val)
        return UDim2.fromOffset(a1 * 32 * u5, a1 * 32 * u5)
    end)
    local Color = if not v1 then a1.Color else Color3.fromRGB(255, 52, 52)
    return createElement("SurfaceGui", {
        Brightness = 2,
        PixelsPerStud = 32,
        SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud,
        Face = Enum.NormalId.Top,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        Enabled = Radius:map(function(a1) -- Line: 32
            return a1 > 0
        end),
    }, {
        canvasGroup = createElement("CanvasGroup", {
            GroupTransparency = 0.8,
            BackgroundTransparency = 1,
            BackgroundColor3 = Color,
            Size = UDim2.fromScale(1, 1),
        }, {
            bounding = createElement("ImageLabel", {
                Image = "rbxassetid://300134974",
                ZIndex = 5,
                ImageTransparency = if not v1 then 0 else 1,
                ImageColor3 = Color,
                ScaleType = Enum.ScaleType.Tile,
                SliceCenter = Rect.new(0, 256, 0, 256),
                TileSize = UDim2.fromOffset(30, 30),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color,
                BackgroundTransparency = if not v1 then 1 else 0,
                Position = UDim2.fromScale(0.5, 0.5),
                Size = v2,
            }, {
                uICorner = createElement("UICorner", {CornerRadius = UDim.new(1, 0)}),
                uiStroke = createElement("UIStroke", {Thickness = 1, Color = Color3.fromRGB(255, 107, 107), Enabled = v1}),
            }),
        }),
        bounding1 = createElement("Frame", {
            BackgroundTransparency = 1,
            ZIndex = 5,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color,
            Position = UDim2.fromScale(0.5, 0.5),
            Size = v2,
        }, {
            uIStroke = createElement("UIStroke", {Thickness = 2, Color = Color}),
            uICorner3 = createElement("UICorner", {CornerRadius = UDim.new(1, 0)}),
        }),
    })
end, function(a1, a2) -- Line: 86
    local v1 = false
    if a1.Radius == a2.Radius then
        v1 = false
        if a1.Color == a2.Color then
            v1 = a1.ShowOnlyBoundary == a2.ShowOnlyBoundary
        end
    end
    return v1
end))
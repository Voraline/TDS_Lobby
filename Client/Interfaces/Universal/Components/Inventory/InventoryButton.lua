-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Inventory.InventoryButton
-- Decompile time: 1.82 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local useScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useScale)
local createElement = React.createElement
return React.memo(function(a1) -- Line: 16 -- upvalues: useScale (val), createElement (val) -- types: a1: table
    local v1 = useScale(1, nil, true)
    local color = a1.color
    local v2 = Color3.fromRGB(math.clamp(color.R * 255 + 20, 0, 255), math.clamp(color.G * 255 + 20, 0, 255), (math.clamp(color.B * 255 + 20, 0, 255)))
    local v3 = {
        Selectable = true,
        Active = true,
        AnchorPoint = Vector2.new(0.5, 0.5),
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundColor3 = color,
        ImageColor3 = v2,
        Position = UDim2.fromScale(0.25, 0.94),
        ScaleType = Enum.ScaleType.Tile,
        Size = UDim2.fromScale(0, 1),
        TileSize = UDim2.fromOffset(45, 45),
    }
    local v4 = {
        uICorner = createElement("UICorner", {CornerRadius = UDim.new(0.0615385, 0)}),
        UIScale = createElement("UIScale", {Scale = v1}),
        uIGradient = createElement("UIGradient", {
            Rotation = 90,
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
                (ColorSequenceKeypoint.new(1, Color3.fromRGB(130, 130, 130))),
            }),
        }),
        uIStroke = createElement("UIStroke", {Thickness = 2, Color = color}),
        textLabel = createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextSize = 25,
            AnchorPoint = Vector2.new(0.5, 0.5),
            AutomaticSize = Enum.AutomaticSize.X,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0, 0.5),
            Text = a1.text,
            TextColor3 = Color3.new(1, 1, 1),
        }, {
            uIStroke = createElement("UIStroke", {Thickness = 2, Transparency = 0.5, LineJoinMode = Enum.LineJoinMode.Bevel}),
        }),
        uIListLayout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            Padding = UDim.new(0.05, 0),
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
    }
    local image = a1.image and createElement("ImageLabel", {
        BackgroundTransparency = 1,
        LayoutOrder = -1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Image = a1.image,
        Size = UDim2.fromScale(0.8, 0.8),
    }, {uIAspectRatioConstraint = createElement("UIAspectRatioConstraint")})
    v4.imageLabel = image
    v4.uIPadding = createElement("UIPadding", {PaddingLeft = UDim.new(0, 25), PaddingRight = UDim.new(0, 25)})
    return createElement("ImageButton", v3, v4)
end)
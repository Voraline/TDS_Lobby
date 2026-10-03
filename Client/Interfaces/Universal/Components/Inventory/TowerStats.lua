-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Inventory.TowerStats
-- Decompile time: 1.83 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Comma = require(ReplicatedStorage.Client.Modules.Comma)
local React = require(ReplicatedStorage.Shared.UI.React)
local Sift = require(ReplicatedStorage.Packages.Sift)
require(ReplicatedStorage.Client.Interfaces.Hooks.useFontScale)
local useMediaQuery = require(ReplicatedStorage.Client.Interfaces.Hooks.useMediaQuery)
local createElement = React.createElement

local function stat(a1) -- Line: 21 -- upvalues: createElement (val), Comma (val) -- types: a1: table
    return createElement("Frame", {
        BackgroundTransparency = 1.25,
        AutomaticSize = Enum.AutomaticSize.X,
        Size = UDim2.fromOffset(0, 80),
    }, {
        UIScale = createElement("UIScale", {Scale = 1}),
        UIListLayout = createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            FillDirection = Enum.FillDirection.Horizontal,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            Padding = UDim.new(0, 10),
        }),
        imageLabel = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = a1.image,
            ScaleType = Enum.ScaleType.Fit,
            Size = UDim2.fromScale(0.8, 0.8),
        }, {UIAspectRatio = createElement("UIAspectRatioConstraint", {AspectRatio = 1})}),
        textLabel = createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextScaled = true,
            AnchorPoint = Vector2.new(0, 0.5),
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Position = UDim2.fromScale(0.4, 0.5),
            Size = UDim2.fromScale(2, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            Text = Comma((tonumber(a1.title))),
            TextColor3 = Color3.new(1, 1, 1),
            TextXAlignment = Enum.TextXAlignment.Left,
        }, {uIStroke = createElement("UIStroke", {Thickness = 2})}),
    })
end

return React.memo(function(a1) -- Line: 73
    -- upvalues: createElement (val), stat (val), useMediaQuery (val), Sift (val), React (val)
    local v1 = {}
    for i, j in a1.stats do
        table.insert(v1, (createElement(stat, {title = j.title, image = j.image, sizeMult = j.sizeMult})))
    end
    local v2 = not useMediaQuery("large")
    local join = Sift.Dictionary.join
    local v3 = {BackgroundTransparency = 1, ZIndex = 3}
    local Position = a1.Position or UDim2.fromScale(0.112958, 0.124986)
    v3.Position = Position
    local Size = a1.Size or UDim2.fromScale(0.1, 0)
    v3.Size = Size
    v3.AutomaticSize = Enum.AutomaticSize.Y
    local AnchorPoint = a1.AnchorPoint or Vector2.new(0, 0)
    v3.AnchorPoint = AnchorPoint
    local v4 = join(v3, a1.native)
    local v5 = {}
    local v6 = {}
    local scale = a1.scale or (if not v2 then 1 else 1.5)
    v6.Scale = scale
    v5.uIScale = createElement("UIScale", v6)
    v5.uIAspectRatio = createElement("UIAspectRatioConstraint", {AspectRatio = 0.25})
    v5.uIListLayout = createElement("UIListLayout", {
        VerticalFlex = "Fill",
        SortOrder = Enum.SortOrder.LayoutOrder,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        Padding = UDim.new(0, 0),
    })
    v5.items = createElement(React.Fragment, nil, v1)
    return createElement("Frame", v4, v5)
end)
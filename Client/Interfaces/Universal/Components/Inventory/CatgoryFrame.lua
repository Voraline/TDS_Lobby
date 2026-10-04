-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Inventory.CatgoryFrame
-- Decompile time: 3.58 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local React = require(ReplicatedStorage.Shared.UI.React)
local useScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useScale)
local RarityColors = require(ReplicatedStorage.Shared.Modules.RarityColors)
local createElement = React.createElement
local memo = React.memo
local u28 = {}
u28[Enum.TowerCategory.Starter] = (Color3.fromRGB(255, 255, 255))
u28[Enum.TowerCategory.Intermediate] = RarityColors[Enum.Rarity.Uncommon]
u28[Enum.TowerCategory.Advanced] = RarityColors[Enum.Rarity.Rare]
u28[Enum.TowerCategory.Hardcore] = RarityColors[Enum.Rarity.Legendary]
u28[Enum.TowerCategory.Evolved] = (Color3.fromRGB(0, 208, 212))
u28[Enum.TowerCategory.Exclusive] = RarityColors[Enum.Rarity.Event]
u28[Enum.TowerCategory.Event] = RarityColors[Enum.Rarity.Event]
return memo(function(a1) -- Line: 29 -- upvalues: useScale (val), createElement (val), Enum (val), u28 (val) -- types: a1: table
    local v1 = useScale(1, nil, true)
    local v2 = {
        BackgroundTransparency = 1,
        Position = UDim2.fromScale(0, 0),
        Size = UDim2.fromScale(1, 0.072749),
        LayoutOrder = a1.layOutOrder,
    }
    local v3 = {}
    local v4 = {
        BackgroundTransparency = 1,
        LayoutOrder = -1,
        TextSize = 40,
        TextWrapped = false,
        AnchorPoint = Vector2.new(0, 0.5),
        AutomaticSize = Enum.AutomaticSize.X,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Position = UDim2.fromScale(0.02, 0.5),
        Size = UDim2.fromScale(0, 0.9),
        Text = a1.title,
    }
    local color = a1.color or a1.catg and u28[tostring(a1.catg)] or Color3.new(1, 1, 1)
    v4.TextColor3 = color
    v4.TextXAlignment = Enum.TextXAlignment.Left
    v3.archtype = createElement("TextLabel", v4, {
        uIScale = createElement("UIScale", {Scale = v1}),
        iStroke = createElement("UIStroke", {Thickness = 3}),
        uIFlexItem = createElement("UIFlexItem"),
    })
    v3.iListLayout = createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalFlex = Enum.UIFlexAlignment.Fill,
        Padding = UDim.new(0, 16 * v1),
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Center,
    })
    v3.divider = createElement("Frame", {
        BackgroundTransparency = 0.45,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.new(1, 1, 1),
        BorderColor3 = Color3.new(),
        Position = UDim2.fromScale(0.284, 0.5),
        Size = UDim2.new(1, 0, 0, 2),
    }, {uIFlexItem = createElement("UIFlexItem", {FlexMode = Enum.UIFlexMode.Fill})})
    v3.iAspectRatioConstraint = createElement("UIAspectRatioConstraint", {AspectRatio = 14, AspectType = Enum.AspectType.ScaleWithParentSize})
    v3.uIPadding = createElement("UIPadding", {PaddingRight = UDim.new(0, 28 * v1)})
    return createElement("Frame", v2, v3)
end)
-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.ShopRevamp.PreviewInfo.Tab
-- Decompile time: 3.36 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage.Client
local Modules_2 = Client.Modules
local Modules = ReplicatedStorage.Shared.Modules
local Packages = ReplicatedStorage.Packages
local Interfaces = Client.Interfaces
local Components = Interfaces.Components
local Hooks = Interfaces.Hooks
require(Modules_2.Comma)
require(Modules.Enum)
require(Components.IconButton)
require(Interfaces.LegacyInterface.Icons)
require(Interfaces.Contexts.InventoryContext)
require(Modules.RarityColors)
local React = require(Packages.React)
local TextLabel = require(Components.TextLabel)
require(Hooks.useProductInfoMap)
local memo = React.memo
local createElement = React.createElement
local u48 = Color3.fromRGB(185, 185, 185)
return memo(function(a1) -- Line: 36 -- upvalues: createElement (val), u48 (val), TextLabel (val) -- types: a1: table
    local v1 = {Size = UDim2.fromScale(0, 1), AutomaticSize = Enum.AutomaticSize.X}
    local color = a1.color or u48
    v1.BackgroundColor3 = color
    v1.BackgroundTransparency = a1.transparency
    v1.LayoutOrder = a1.layoutOrder or 0
    return createElement("Frame", v1, {
        UICorner = createElement("UICorner", {CornerRadius = UDim.new(0.15, 0)}),
        UIGradient = createElement("UIGradient", {
            Rotation = 90,
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                (ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 100, 100))),
            }),
        }),
        UIStroke = createElement("UIStroke", {
            Thickness = 0.075,
            Color = Color3.fromRGB(255, 255, 255),
            Transparency = a1.transparency,
            StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
        }, {
            UIGradient = createElement("UIGradient", {
                Rotation = 90,
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                    (ColorSequenceKeypoint.new(1, Color3.fromRGB(138, 138, 138))),
                }),
            }),
        }),
        UIListLayout = createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder,
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            Padding = UDim.new(0, 0),
        }),
        PaddingFrameLeft = createElement("Frame", {BackgroundTransparency = 1, LayoutOrder = 0, Size = UDim2.fromScale(0.025, 0)}),
        TextLabel = createElement(TextLabel, {
            BackgroundTransparency = 1,
            TextScaled = true,
            StrokeThickness = 1,
            LayoutOrder = 1,
            Text = a1.text,
            Size = UDim2.fromScale(0, 0.65),
            TextXAlignment = Enum.TextXAlignment.Center,
            TextYAlignment = Enum.TextYAlignment.Center,
            AutomaticSize = Enum.AutomaticSize.X,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            FontFace = Font.fromName("Montserrat", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
            StrokeTransparency = a1.transparency,
            TextTransparency = a1.transparency,
        }),
        PaddingFrameRight = createElement("Frame", {BackgroundTransparency = 1, LayoutOrder = 2, Size = UDim2.fromScale(0.025, 0)}),
    })
end)
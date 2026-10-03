-- Script path: ReplicatedStorage.Client.Interfaces.Components.Settings.Keybinds
-- Decompile time: 2.90 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
return function(a1) -- Line: 6 -- upvalues: createElement (val), React (val)
    local v1 = a1.Title ~= "Abilities"
    local v2 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundColor3 = Color3.fromRGB(121, 121, 121),
        Size = UDim2.new(1, -4, 0, 0),
        LayoutOrder = a1.LayoutOrder,
    }
    local v3 = {
        uICorner = createElement("UICorner", {CornerRadius = UDim.new(0, 6)}),
        uIListLayout = createElement("UIListLayout", {Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder}),
        title = createElement("Frame", {
            BackgroundTransparency = 1,
            LayoutOrder = 1,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Size = UDim2.new(1, 0, 0, 32),
        }, {
            textLabel = createElement("TextLabel", {
                TextSize = 24,
                BackgroundTransparency = 1,
                FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                Text = a1.Title,
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextXAlignment = Enum.TextXAlignment.Left,
                AnchorPoint = Vector2.new(0, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                Position = UDim2.new(0, 8, 0.5, 0),
                Size = UDim2.fromScale(0.5, 0.8),
            }),
            frame = createElement("Frame", {
                BorderSizePixel = 0,
                AnchorPoint = Vector2.new(0.5, 1),
                BackgroundColor3 = Color3.fromRGB(121, 121, 121),
                Position = UDim2.new(0.5, 0, 1, 2),
                Size = UDim2.new(0.9, 0, 0, 2),
            }),
        }),
    }
    local v4 = {
        BackgroundTransparency = 1,
        LayoutOrder = 2,
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
    }
    local v5 = {}
    local v6 = {CellPadding = UDim2.fromOffset(8, 8)}
    local v7 = if not v1 then UDim2.new(1, 0, 0, 64) else UDim2.new(0.5, -4, 0, 64)
    v6.CellSize = v7
    v6.SortOrder = Enum.SortOrder.LayoutOrder
    v5.uiGridLayout = createElement("UIGridLayout", v6)
    v5.components = React.createElement(React.Fragment, {}, a1.children or {})
    v3.content = createElement("Frame", v4, v5)
    return createElement("Frame", v2, v3)
end
-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.TopBar.TopBar
-- Decompile time: 1.35 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
return function(a1) -- Line: 12 -- upvalues: createElement (val), React (val) -- types: a1: table
    return createElement("Frame", {
        BackgroundTransparency = 1,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(27, 42, 53),
        Position = UDim2.fromOffset(0, 0),
        Size = UDim2.new(1, 0, 1, 0),
        Visible = a1.Visible,
    }, {
        items = createElement("Frame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromOffset(-8, 8),
            Size = UDim2.new(1, 0, 1, -8),
        }, {
            uIListLayout = createElement("UIListLayout", {
                Padding = UDim.new(0, 15),
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Right,
                SortOrder = Enum.SortOrder.LayoutOrder,
            }),
            content = React.createElement(React.Fragment, {}, a1.children or {}),
        }),
    })
end
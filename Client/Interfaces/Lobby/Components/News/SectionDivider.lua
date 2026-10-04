-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.News.SectionDivider
-- Decompile time: 1.89 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local TextLabel = require(ReplicatedStorage.Client.Interfaces.Components.TextLabel)
local createElement = React.createElement
return function(a1) -- Line: 18 -- upvalues: createElement (val), TextLabel (val), React (val) -- types: a1: table
    local v1 = {BackgroundTransparency = 1}
    local Size = a1.Size or UDim2.fromScale(1, 0)
    v1.Size = Size
    v1.Position = a1.Position
    v1.AnchorPoint = a1.AnchorPoint
    v1.AutomaticSize = Enum.AutomaticSize.Y
    v1.LayoutOrder = a1.LayoutOrder
    return createElement("Frame", v1, {
        uiList = createElement("UIListLayout", {
            Padding = UDim.new(0, 0),
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Top,
        }),
        title = createElement(TextLabel, {
            TextSize = 30,
            TextScaled = false,
            TextWrapped = true,
            LayoutOrder = 0,
            FontWeight = "Bold",
            AutomaticSize = Enum.AutomaticSize.Y,
            Size = UDim2.new(1, 0, 0, 30),
            Text = a1.SectionName,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Top,
            TextTransparency = a1.Transparency,
        }),
        bar = createElement("Frame", {
            BorderSizePixel = 1,
            LayoutOrder = 1,
            BackgroundTransparency = a1.Transparency or 0,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(84, 84, 84),
            Size = UDim2.new(1, -20, 0, 2),
            AnchorPoint = Vector2.new(0.5, 0),
        }),
        content = createElement("Frame", {
            BackgroundTransparency = 1,
            LayoutOrder = 2,
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
        }, {
            content = React.createElement(React.Fragment, {}, a1.Content),
            uiList = createElement("UIListLayout", {
                Padding = UDim.new(0, 0),
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Top,
            }),
        }),
    })
end
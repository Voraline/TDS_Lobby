-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Sandbox.Paywall
-- Decompile time: 2.09 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local TextLabel = require(ReplicatedStorage.Client.Interfaces.Components.TextLabel)
local createElement = React.createElement
return function() -- Line: 7 -- upvalues: createElement (val), TextLabel (val)
    return createElement("Frame", {
        ZIndex = 999,
        BackgroundTransparency = 0.4,
        Visible = true,
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
    }, {
        uICorner = createElement("UICorner"),
        content = createElement("Frame", {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.48, 0.36),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
        }, {
            list = createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 10),
            }),
            image = createElement("ImageLabel", {
                Image = "rbxassetid://1197061307",
                LayoutOrder = 0,
                BackgroundTransparency = 1,
                ZIndex = 999,
                ScaleType = Enum.ScaleType.Fit,
                Size = UDim2.fromScale(0.7, 0.7),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
            }, {ratio = createElement("UIAspectRatioConstraint", {AspectRatio = 1})}),
            text = createElement(TextLabel, {
                LayoutOrder = 1,
                Text = "Unlock this feature with the Admin mode gamepass!",
                FontWeight = "ExtraBold",
                StrokeThickness = 4,
                Size = UDim2.new(0.8, 0, 0.7, 0),
                Position = UDim2.new(0.5, 0, 0, 10),
                AnchorPoint = Vector2.new(0.5, 0),
                StrokeColor = Color3.fromRGB(0, 0, 0),
            }),
        }),
    })
end
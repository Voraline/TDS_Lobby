-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.News.NewsfeedBanner
-- Decompile time: 1.38 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageLabel = require(ReplicatedStorage.Client.Interfaces.Components.ImageLabel)
local React = require(ReplicatedStorage.Shared.UI.React)
local TextLabel = require(ReplicatedStorage.Client.Interfaces.Components.TextLabel)
local createElement = React.createElement
return function(a1) -- Line: 19 -- upvalues: createElement (val), ImageLabel (val), TextLabel (val) -- types: a1: table
    local v1 = {BackgroundTransparency = 1, LayoutOrder = 0}
    local Size = a1.Size or UDim2.new(1, 0, 0, 125)
    v1.Size = Size
    v1.Position = a1.Position
    v1.AnchorPoint = a1.AnchorPoint
    v1.AutomaticSize = Enum.AutomaticSize.Y
    v1.ImageColor3 = Color3.fromRGB(126, 126, 126)
    v1.Image = "rbxassetid://" .. a1.ImageId
    v1.ImageTransparency = a1.Transparency
    v1.ScaleType = Enum.ScaleType.Crop
    return createElement(ImageLabel, v1, {
        uiCorner = createElement("UICorner", {CornerRadius = UDim.new(0, 8)}),
        uiAspectRatio = createElement("UIAspectRatioConstraint", {
            AspectRatio = 3.5,
            AspectType = Enum.AspectType.ScaleWithParentSize,
            DominantAxis = Enum.DominantAxis.Height,
        }),
        logo = createElement(ImageLabel, {
            ZIndex = 2,
            BackgroundTransparency = 1,
            Image = "rbxassetid://8013123216",
            AnchorPoint = Vector2.new(0.5, 0),
            Position = UDim2.fromScale(0.5, 0.078),
            Size = UDim2.fromScale(0.412, 0.481),
            ScaleType = Enum.ScaleType.Fit,
            ImageTransparency = a1.Transparency,
        }, {
            uiAspect = createElement("UIAspectRatioConstraint", {
                AspectRatio = 3,
                AspectType = Enum.AspectType.ScaleWithParentSize,
                DominantAxis = Enum.DominantAxis.Height,
            }),
        }),
        detail = createElement(TextLabel, {
            ZIndex = 1,
            FontWeight = "Bold",
            TextSize = 30,
            TextScaled = true,
            StrokeThickness = 3,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.717),
            Size = UDim2.fromScale(0.75, 0.155),
            Text = a1.Title,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextTransparency = a1.Transparency,
            StrokeColor = Color3.fromRGB(0, 0, 0),
            StrokeTransparency = a1.Transparency,
        }, {textSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 25})}),
        version = createElement(TextLabel, {
            ZIndex = 1,
            FontWeight = "Medium",
            TextSize = 14,
            TextScaled = true,
            StrokeThickness = 3,
            AnchorPoint = Vector2.new(1, 1),
            Position = UDim2.fromScale(0.99, 0.99),
            Size = UDim2.fromScale(0.765, 0.146),
            Text = a1.Version,
            TextTransparency = a1.Transparency,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextXAlignment = Enum.TextXAlignment.Right,
            TextYAlignment = Enum.TextYAlignment.Bottom,
            StrokeColor = Color3.fromRGB(0, 0, 0),
            StrokeTransparency = a1.Transparency,
        }, {textSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 21})}),
    })
end
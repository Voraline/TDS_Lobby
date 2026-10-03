-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.PVPRankedNew.RankRewards.PVPLevel
-- Decompile time: 2.56 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageLabel = require(ReplicatedStorage.Client.Interfaces.Components.ImageLabel)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local createElement = React.createElement
local useEffect = React.useEffect
local useTween = ReactFlow.useTween
return React.memo(function(a1) -- Line: 12
    -- upvalues: useTween (val), useEffect (val), createElement (val), ImageLabel (val), React (val)
    local color = a1.color
    if not color then
        color = Color3.fromRGB(110, 110, 110)
    end
    local v1, u15 = useTween({
        info = TweenInfo.new(0.2, Enum.EasingStyle.Sine),
        start = color,
        target = color,
    })
    local v2 = {color}
    useEffect(function() -- Line: 20 -- upvalues: u15 (val), color (val)
        u15({target = color})
    end, v2)
    v2 = {BackgroundTransparency = 1, BorderSizePixel = 0}
    local Position = a1.Position or UDim2.fromScale(0.00481, 0.876)
    v2.Position = Position
    local Size = a1.Size or UDim2.fromScale(0.99, 0.124)
    v2.Size = Size
    v2.AnchorPoint = a1.AnchorPoint
    v2.LayoutOrder = a1.LayoutOrder or 1
    v2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    return createElement("Frame", v2, {
        uiAspectRatioConstraint = createElement("UIAspectRatioConstraint", {AspectRatio = 1}),
        bG1 = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Image = "rbxassetid://90548260210429",
            ImageTransparency = 0.4,
            ZIndex = -1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            ImageColor3 = v1,
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.75, 0.75),
        }, {
            uiCorner = createElement("UICorner", {CornerRadius = UDim.new(0.1, 0)}),
            uiStroke = createElement("UIStroke", {Thickness = 2, Transparency = 0, Color = v1}),
        }),
        bG2 = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Image = "rbxassetid://85205412837336",
            ImageTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            ImageColor3 = v1,
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1.2, 1.2),
        }),
        blur = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Image = "rbxassetid://103656828580888",
            ImageTransparency = 0.75,
            ZIndex = -2,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            ImageColor3 = v1,
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1.1, 1.1),
        }),
        shadow = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Image = "rbxassetid://120984827765904",
            ImageTransparency = 1,
            ZIndex = -3,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            ImageColor3 = Color3.fromRGB(),
            Position = UDim2.fromScale(0.5, 0.55),
            Size = UDim2.fromScale(1, 1),
        }),
        icon = createElement(ImageLabel, {
            BackgroundTransparency = 1,
            ZIndex = 2,
            Position = UDim2.fromScale(0.5, 0.525),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Size = UDim2.fromScale(0.9, 0.8),
            SizeConstraint = Enum.SizeConstraint.RelativeYY,
            ScaleType = Enum.ScaleType.Fit,
            Image = a1.levelIcon or 116954190056947,
        }),
        UserRankLabel = React.createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextScaled = true,
            ZIndex = 3,
            AnchorPoint = Vector2.new(0.5, 1),
            Position = UDim2.fromScale(0.5, 0.8),
            Size = UDim2.fromScale(1, 0.125),
            FontFace = Font.fromName("Montserrat", Enum.FontWeight.Bold),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            Text = a1.levelText,
        }, {
            UIStroke = React.createElement("UIStroke", {Transparency = 0, Thickness = 2, Color = Color3.fromRGB(0, 0, 0)}),
        }),
        XPLabel = React.createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextScaled = true,
            ZIndex = 5,
            AnchorPoint = Vector2.new(0.5, 1),
            Position = UDim2.fromScale(0.5, 1.175),
            Size = UDim2.fromScale(0.8, 0.175),
            FontFace = Font.fromName("Montserrat", Enum.FontWeight.Bold),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            Text = if not (0 < a1.rank) then "Starter" else a1.rank,
        }, {
            UIStroke = React.createElement("UIStroke", {Thickness = 1, Transparency = 0.75, Color = v1}),
            UIGradient = React.createElement("UIGradient", {
                Rotation = -90,
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, color),
                    (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))),
                }),
            }),
        }),
        children = createElement(React.Fragment, {}, a1.children),
    })
end)
-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Matchmaking.MatchmakingMenu
-- Decompile time: 6.81 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Button = require(ReplicatedStorage.Client.Interfaces.Components.Button)
local IconButton = require(ReplicatedStorage.Client.Interfaces.Components.IconButton)
local Icons = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Icons)
local React = require(ReplicatedStorage.Shared.UI.React)
local useMediaQuery = require(ReplicatedStorage.Client.Interfaces.Hooks.useMediaQuery)
local useScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useScale)
local createElement = React.createElement
return function(a1) -- Line: 20
    -- upvalues: useScale (val), useMediaQuery (val), createElement (val), IconButton (val), Button (val), Icons (val)
    -- upvalues: React (val)
    local u5 = useScale(1, nil, true)
    local v1 = math.max(1, 1 + (1 - u5))
    local v2 = useMediaQuery("medium", true)
    local v3 = {
        BackgroundTransparency = 0.5,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.6, 0.7),
    }
    local v4 = {
        uIGradient = createElement("UIGradient", {
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 1),
                NumberSequenceKeypoint.new(0.5, 0.3),
                (NumberSequenceKeypoint.new(1, 1)),
            }),
        }),
        uIAspectRatioConstraint = createElement("UIAspectRatioConstraint", {AspectRatio = 1.7}),
        textLabel = createElement("TextLabel", {
            Text = "Matchmaking is currently in BETA!\nMore improvements will come over time!",
            TextScaled = true,
            TextSize = 14,
            TextTransparency = 0.4,
            TextWrapped = true,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.Medium, Enum.FontStyle.Normal),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            AnchorPoint = Vector2.new(0.5, 0),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.new(0.5, 0, 1, 8),
            Size = UDim2.fromScale(1, 0.08),
        }, {
            uIAspectRatioConstraint1 = createElement("UIAspectRatioConstraint", {AspectRatio = 12}),
            uIPadding = createElement("UIPadding", {PaddingBottom = UDim.new(0.1, 0), PaddingTop = UDim.new(0.1, 0)}),
        }),
        title = createElement("Frame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0.5, 0),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.5, v1 * 0.025),
            Size = UDim2.fromScale(0.4, 0.1),
        }, {
            textLabel = createElement("TextLabel", {
                TextScaled = true,
                TextSize = 14,
                TextWrapped = true,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                Text = a1.title or "Choose a Gamemode",
                TextColor3 = Color3.fromRGB(255, 255, 255),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(1, 0.6),
            }, {
                uIStroke = createElement("UIStroke", {Thickness = 4, Color = Color3.fromRGB(102, 102, 102)}, {
                    uIGradient = createElement("UIGradient", {
                        Rotation = 90,
                        Color = ColorSequence.new({
                            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                            (ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 40, 40))),
                        }),
                    }),
                }),
            }),
            leave = createElement(IconButton, {
                Position = UDim2.fromScale(1, 0.5),
                Size = UDim2.fromScale(0.7, 0.7),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Color = Color3.fromRGB(255, 60, 60),
                Clicked = a1.onClose,
            }, {aspectRatio = createElement("UIAspectRatioConstraint")}),
        }),
    }
    local showBack = a1.showBack and createElement(Button, {
        IconScale = 0.8,
        TextFontSize = 24,
        Text = "Back",
        Icon = Icons.Previous,
        TextSize = UDim2.new(0, 80, 0.5, 0),
        AnchorPoint = Vector2.new(0.5, 1),
        Size = UDim2.fromOffset(200, 60),
        Position = v2:map(function(a1) -- Line: 140 -- upvalues: u5 (val)
            return a1 and UDim2.new(0.5, 0, 1, -20 * u5) or UDim2.new(0, 25, 1, -15)
        end),
        Color = Color3.fromRGB(150, 150, 150),
        Clicked = a1.onBack,
    }, {
        scale = createElement("UIScale", {
            Scale = v2:map(function(a1) -- Line: 148 -- upvalues: u5 (val)
                return a1 and 1 * u5 or 0.35
            end),
        }),
    })
    v4.back = showBack
    v4.children = createElement(React.Fragment, {}, a1.children or {})
    return createElement("Frame", v3, v4)
end
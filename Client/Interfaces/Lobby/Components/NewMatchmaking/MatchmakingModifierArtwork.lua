-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.NewMatchmaking.MatchmakingModifierArtwork
-- Decompile time: 4.80 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
require(ReplicatedStorage.Shared.UI.ReactTypes)
local ImageLabel = require(ReplicatedStorage.Client.Interfaces.Components.ImageLabel)
local MatchmakingStyle = require(script.Parent.MatchmakingStyle)
local MatchmakingTrialData = require(script.Parent.MatchmakingTrialData)
local TextLabel = require(ReplicatedStorage.Client.Interfaces.Components.TextLabel)
local useCountdown = require(ReplicatedStorage.Client.Interfaces.Hooks.useCountdown)
local useFontScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useFontScale)
local createElement = React.createElement

local function ArtworkTag(a1) -- Line: 32
    -- upvalues: useFontScale (val), MatchmakingStyle (val), createElement (val), TextLabel (val)
    return createElement("Frame", {
        BorderSizePixel = 0,
        ZIndex = 6,
        AnchorPoint = Vector2.new(1, 0),
        BackgroundColor3 = Color3.fromRGB(238, 237, 224),
        Position = UDim2.fromScale(0.98397, 0.10653),
        Size = UDim2.fromScale(0.13833, 0.21424),
    }, {
        Corner = createElement("UICorner", {CornerRadius = MatchmakingStyle.cornerRadius.tag}),
        Label = createElement(TextLabel, {
            BackgroundTransparency = 1,
            FontWeight = "Bold",
            TextScaled = false,
            ZIndex = 7,
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.new(1, -10, 1, -6),
            StrokeColor = Color3.fromRGB(0, 0, 0),
            StrokeThickness = MatchmakingStyle.strokeThickness.thin,
            StrokeTransparency = MatchmakingStyle.transparency.stroke,
            Text = a1.text,
            TextColor3 = MatchmakingStyle.colors.text,
            TextSize = useFontScale(MatchmakingStyle.getFontSize("body", a1.compact)),
            TextTruncate = Enum.TextTruncate.AtEnd,
        }),
        SizeConstraint = createElement("UISizeConstraint", {
            MaxSize = Vector2.new(180, 42),
            MinSize = Vector2.new(if not a1.compact then 112 else 88, if not a1.compact then 30 else 26),
        }),
        Stroke = createElement("UIStroke", {
            Transparency = 0.8,
            Color = Color3.fromRGB(0, 0, 0),
            Thickness = MatchmakingStyle.strokeThickness.thin,
        }),
    })
end

local function ArtworkTimer(a1) -- Line: 79
    -- upvalues: useFontScale (val), MatchmakingStyle (val), createElement (val), ImageLabel (val), TextLabel (val)
    return createElement("Frame", {
        BorderSizePixel = 0,
        ZIndex = 6,
        AnchorPoint = Vector2.new(1, 0),
        BackgroundColor3 = Color3.fromRGB(238, 237, 224),
        Position = UDim2.fromScale(0.98132, 0.4),
        Size = UDim2.fromScale(0.13132, 0.2545),
    }, {
        Clock = createElement(ImageLabel, {
            BackgroundTransparency = 1,
            Image = 82991540492128,
            ZIndex = 7,
            disableSpinner = true,
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.fromScale(0, 0.5),
            ScaleType = Enum.ScaleType.Fit,
            Size = UDim2.fromScale(0.27884, 0.79135),
        }),
        Corner = createElement("UICorner", {CornerRadius = MatchmakingStyle.cornerRadius.tag}),
        Gradient = createElement("UIGradient", {
            Rotation = 90,
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(225, 85, 255)),
                (ColorSequenceKeypoint.new(1, Color3.fromRGB(125, 35, 211))),
            }),
        }),
        Label = createElement(TextLabel, {
            BackgroundTransparency = 1,
            FontWeight = "Bold",
            TextScaled = false,
            ZIndex = 7,
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.fromScale(0.21647, 0.5),
            Size = UDim2.fromScale(0.68141, 0.79135),
            StrokeColor = Color3.fromRGB(0, 0, 0),
            StrokeThickness = MatchmakingStyle.strokeThickness.thin,
            StrokeTransparency = MatchmakingStyle.transparency.stroke,
            Text = a1.text,
            TextColor3 = MatchmakingStyle.colors.text,
            TextSize = useFontScale(MatchmakingStyle.getFontSize("body", a1.compact)),
            TextTruncate = Enum.TextTruncate.AtEnd,
        }),
        SizeConstraint = createElement("UISizeConstraint", {
            MaxSize = Vector2.new(170, 48),
            MinSize = Vector2.new(if not a1.compact then 116 else 100, if not a1.compact then 34 else 30),
        }),
        Stroke = createElement("UIStroke", {
            Color = MatchmakingStyle.colors.text,
            Thickness = MatchmakingStyle.strokeThickness.thin,
        }),
    })
end

return function(a1) -- Line: 143
    -- upvalues: useCountdown (val), MatchmakingTrialData (val), createElement (val), MatchmakingStyle (val)
    -- upvalues: ImageLabel (val), ArtworkTag (val), ArtworkTimer (val)
    local v1 = (useCountdown(a1.timerEndsAt)):map(MatchmakingTrialData.formatSecondsLeft)
    local imageOffset = a1.imageOffset
    if not imageOffset then
        imageOffset = UDim2.fromScale(0, 0)
    end
    local v2 = math.max(a1.imageScale or 1, 0)
    return createElement("Frame", {
        BorderSizePixel = 0,
        ClipsDescendants = true,
        ZIndex = 1,
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundColor3 = Color3.fromRGB(5, 19, 31),
        Position = UDim2.fromScale(0.5, 0),
        Size = a1.size,
    }, {
        Corner = createElement("UICorner", {CornerRadius = MatchmakingStyle.cornerRadius.panel}),
        Visuals = createElement("Frame", {
            BorderSizePixel = 0,
            ZIndex = 1,
            BackgroundColor3 = MatchmakingStyle.colors.text,
            Size = UDim2.fromScale(1, 1),
        }, {
            BackgroundGradient = createElement("UIGradient", {
                Rotation = -5,
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(5, 19, 31)),
                    (ColorSequenceKeypoint.new(1, Color3.fromRGB(44, 86, 88))),
                }),
            }),
            GridTexture = createElement(ImageLabel, {
                BackgroundTransparency = 1,
                ImageTransparency = 0.7,
                ZIndex = 2,
                disableSpinner = true,
                Image = a1.gridTexture,
                ScaleType = Enum.ScaleType.Tile,
                Size = UDim2.new(1.0053, 0, 1, 0),
                TileSize = UDim2.fromScale(0.054, 0.35),
            }),
            MapMotion = createElement("Frame", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ZIndex = 3,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = a1.artworkOffset:map(function(a1) -- Line: 188 -- upvalues: imageOffset (val)
                    return (UDim2.fromScale(0.5, 0.5)) + imageOffset + UDim2.fromOffset(a1.X, a1.Y)
                end),
                Size = UDim2.fromScale(v2 * 1.04, v2 * 1.04),
            }, {
                Scale = createElement("UIScale", {Scale = a1.artworkScale}),
                Map = createElement(ImageLabel, {
                    BackgroundTransparency = 0,
                    ZIndex = 3,
                    disableSpinner = true,
                    BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                    Image = a1.mapImage,
                    Position = UDim2.fromScale(0.22582, -0.42858),
                    Size = UDim2.fromScale(0.54227, 2.04359),
                    ScaleType = Enum.ScaleType.Crop,
                }, {
                    Gradient = createElement("UIGradient", {
                        Transparency = NumberSequence.new({
                            NumberSequenceKeypoint.new(0, 1),
                            NumberSequenceKeypoint.new(0.15, 0.5),
                            NumberSequenceKeypoint.new(0.50053, 0),
                            NumberSequenceKeypoint.new(0.85, 0.5),
                            (NumberSequenceKeypoint.new(1, 1)),
                        }),
                    }),
                }),
            }),
            Icon = if not a1.icon then nil else createElement(ImageLabel, {
                BackgroundTransparency = 1,
                ZIndex = 5,
                disableSpinner = true,
                Image = a1.icon,
                Position = UDim2.fromScale(0.03814, -0.08),
                ScaleType = Enum.ScaleType.Fit,
                Size = UDim2.fromScale(0.13475, 1.00173),
            }),
        }),
        Tag = if not a1.tag then nil else createElement(ArtworkTag, {compact = a1.compact, text = a1.tag}),
        Timer = if not a1.timerEndsAt then nil else createElement(ArtworkTimer, {compact = a1.compact, text = v1}),
    })
end
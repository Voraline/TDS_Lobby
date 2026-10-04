-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.NewMatchmaking.MatchmakingSquadArtwork
-- Decompile time: 1.62 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ImageLabel = require(ReplicatedStorage.Client.Interfaces.Components.ImageLabel)
local createElement = React.createElement
return React.memo(function(a1) -- Line: 15 -- upvalues: createElement (val), ImageLabel (val) -- types: a1: table
    return createElement("Frame", {
        BorderSizePixel = 0,
        ClipsDescendants = true,
        BackgroundColor3 = Color3.fromRGB(88, 88, 88),
        Size = UDim2.fromScale(1, 1),
    }, {
        Background = createElement(ImageLabel, {
            BackgroundTransparency = 1,
            ZIndex = 1,
            disableSpinner = true,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Image = a1.backgroundImage,
            ImageColor3 = Color3.fromRGB(176, 176, 176),
            Position = UDim2.fromScale(0.5, 0.5),
            ScaleType = Enum.ScaleType.Crop,
            Size = UDim2.fromScale(1.2, 1.2),
        }),
        BackgroundGradient = createElement("UIGradient", {
            Rotation = 90,
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(134, 137, 144)),
                (ColorSequenceKeypoint.new(1, Color3.fromRGB(45, 47, 54))),
            }),
        }),
        Foreground = createElement(ImageLabel, {
            BackgroundTransparency = 1,
            ZIndex = 2,
            disableSpinner = true,
            AnchorPoint = Vector2.new(0.5, 0.4),
            Image = a1.foregroundImage,
            Position = UDim2.fromScale(0.5, 0.5),
            ScaleType = Enum.ScaleType.Fit,
            Size = UDim2.fromScale(2, 2),
        }),
    })
end)
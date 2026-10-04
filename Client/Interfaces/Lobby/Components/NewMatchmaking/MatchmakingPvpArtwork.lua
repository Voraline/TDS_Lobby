-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.NewMatchmaking.MatchmakingPvpArtwork
-- Decompile time: 2.05 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ImageLabel = require(ReplicatedStorage.Client.Interfaces.Components.ImageLabel)
local createElement = React.createElement
return React.memo(function(a1) -- Line: 22 -- upvalues: createElement (val), ImageLabel (val) -- types: a1: table
    return createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        Size = UDim2.fromScale(1, 1),
    }, {
        Background = createElement(ImageLabel, {
            BackgroundTransparency = 1,
            ZIndex = 1,
            disableSpinner = true,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Image = if not a1.ranked then 113772329697782 else 120068087064373,
            Position = UDim2.fromScale(0.5, 0.5),
            ScaleType = Enum.ScaleType.Crop,
            Size = UDim2.fromScale(1.1, 1.1),
        }),
        Foreground = createElement(ImageLabel, {
            BackgroundTransparency = 1,
            ZIndex = 2,
            disableSpinner = true,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Image = if not a1.ranked then if a1.teamSize ~= 2 then 130127513715986 else 87184116814466 else if a1.teamSize ~= 2 then 76949470576285 else 122391824849328,
            Position = UDim2.fromScale(0.5, 0.5),
            ScaleType = Enum.ScaleType.Fit,
            Size = UDim2.fromScale(1.1, 1.1),
        }),
    })
end)
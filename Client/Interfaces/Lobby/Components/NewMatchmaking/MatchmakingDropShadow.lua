-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.NewMatchmaking.MatchmakingDropShadow
-- Decompile time: 0.53 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ImageLabel = require(ReplicatedStorage.Client.Interfaces.Components.ImageLabel)
local MatchmakingStyle = require(script.Parent.MatchmakingStyle)
local createElement = React.createElement
return React.memo(function(a1) -- Line: 19 -- upvalues: createElement (val), ImageLabel (val), MatchmakingStyle (val) -- types: a1: table
    local v1 = a1.overscan or 14
    return createElement(ImageLabel, {
        Active = false,
        BackgroundTransparency = 1,
        Image = "rbxassetid://9239716855",
        disableSpinner = true,
        AnchorPoint = Vector2.new(0.5, 0.5),
        ImageTransparency = MatchmakingStyle.transparency.dropShadow,
        Position = UDim2.fromScale(0.5, 0.5),
        ScaleType = Enum.ScaleType.Slice,
        Size = UDim2.new(1, v1, 1, v1),
        SliceCenter = Rect.new(14, 14, 64, 24),
        ZIndex = a1.zIndex or 0,
    })
end)
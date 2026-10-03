-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.PVPRankedNew.PVPUserRank.RankDisplay
-- Decompile time: 1.45 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
return function(a1) -- Line: 5 -- upvalues: React (val)
    local Icon = a1.Icon
    local v1 = a1.Visible
    if v1 then
        local createElement = React.createElement
        local v2 = {BackgroundTransparency = 1, ZIndex = 5}
        local AnchorPoint = a1.AnchorPoint or Vector2.new(0.5, 0.5)
        v2.AnchorPoint = AnchorPoint
        local Size = a1.Size or UDim2.fromScale(1, 1)
        v2.Size = Size
        local Position = a1.Position or UDim2.fromScale(0.5, 0.5)
        v2.Position = Position
        local v3 = {
            UIAspectRatioConstraint = React.createElement("UIAspectRatioConstraint", {AspectRatio = 1}),
            RankDescriptionLabel = React.createElement("TextLabel", {
                BackgroundTransparency = 1,
                TextScaled = true,
                ZIndex = 3,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.6),
                Size = UDim2.fromScale(0.8, 0.075),
                FontFace = Font.fromName("Montserrat", Enum.FontWeight.Bold),
                TextColor3 = Color3.fromRGB(255, 196, 85),
                Text = a1.RankDescriptionText,
            }),
        }
        local createElement_3 = React.createElement
        local v4 = {
            BackgroundTransparency = 1,
            TextScaled = true,
            ZIndex = 3,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.7),
            Size = UDim2.fromScale(0.8, 0.125),
            FontFace = Font.fromName("Montserrat", Enum.FontWeight.Bold),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            Text = a1.UserRankText,
        }
        local v5 = {}
        local HighlightRank = a1.HighlightRank and React.createElement("UIStroke", {Transparency = 0.85, Thickness = 2, Color = Color3.fromRGB(255, 255, 255)})
        v5.UIStroke = HighlightRank
        v3.UserRankLabel = createElement_3("TextLabel", v4, v5)
        v3.RankImage = React.createElement("ImageLabel", {
            BackgroundTransparency = 1,
            ZIndex = 3,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Size = UDim2.fromScale(0.6, 0.4),
            Position = UDim2.fromScale(0.51, 0.4),
            Image = ("rbxassetid://%*"):format(Icon),
            ScaleType = Enum.ScaleType.Fit,
        })
        v1 = createElement("Frame", v2, v3)
    end
    return v1
end
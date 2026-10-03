-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.PVPProfileCard
-- Decompile time: 1.70 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PVPCurrentRank = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.PVPProfileCard.PVPCurrentRank)
local PVPPlayerInfo = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.PVPProfileCard.PVPPlayerInfo)
local PVPTitle = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.PVPProfileCard.PVPTitle)
local React = require(ReplicatedStorage.Shared.UI.React)
local useTransparencyModifier = require(ReplicatedStorage.Client.Interfaces.Hooks.useTransparencyModifier)
local createElement = React.createElement
return React.memo(function(a1) -- Line: 40
    -- upvalues: useTransparencyModifier (val), createElement (val), PVPCurrentRank (val), PVPPlayerInfo (val)
    -- upvalues: PVPTitle (val)
    local v1 = useTransparencyModifier(a1.transparency)
    local v2 = {BackgroundTransparency = 1}
    local anchorPoint = a1.anchorPoint or Vector2.new(0.5, 0.5)
    v2.AnchorPoint = anchorPoint
    local position = a1.position or UDim2.fromScale(0.670046, 0.521967)
    v2.Position = position
    local size = a1.size or UDim2.fromScale(0.17, 0.17)
    v2.Size = size
    v2.SizeConstraint = a1.sizeConstraint
    local v3 = {
        uIAspectRatioConstraint = if not a1.aspectRatio then nil else createElement("UIAspectRatioConstraint", {
            AspectRatio = a1.aspectRatio,
            DominantAxis = Enum.DominantAxis.Width,
            AspectType = Enum.AspectType.ScaleWithParentSize,
        }),
    }
    local v4 = {
        BackgroundColor3 = Color3.new(),
        BackgroundTransparency = v1(0.1),
        Position = UDim2.fromScale(3.37035e-07, 0),
        Size = UDim2.fromScale(1, 1),
    }
    local v5 = {
        uIStroke = createElement("UIStroke", {
            Color = Color3.new(1, 1, 1),
            Thickness = if not a1.physical then 3 else 0,
            Transparency = v1(0.8),
        }),
        uICorner = createElement("UICorner", {CornerRadius = UDim.new(if not a1.physical then 0.0552486 else 0, 0)}),
        currentRank = createElement(PVPCurrentRank, {
            size = UDim2.fromScale(0.492, 0.724),
            rankName = a1.rankName,
            rankIcon = a1.rankIcon,
            transparency = a1.transparency,
            physical = a1.physical,
        }),
        playerInfo = createElement(PVPPlayerInfo, {
            size = UDim2.fromScale(0.492, 0.724),
            position = UDim2.fromScale(0.508, 0.276),
            wins = a1.wins,
            losses = a1.losses,
            enemiesKilled = a1.enemiesKilled,
            enemiesSent = a1.enemiesSent,
            maxGlobalRank = a1.maxGlobalRank,
            globalRank = a1.globalRank,
            transparency = a1.transparency,
            physical = a1.physical,
        }),
    }
    local v6 = {userName = a1.userName}
    local displayName = a1.displayName or a1.userName
    v6.displayName = displayName
    v6.userId = a1.userId
    v6.transparency = a1.transparency
    v5.title = createElement(PVPTitle, v6)
    v3.content = createElement("Frame", v4, v5)
    v3.dropShadow = createElement("ImageLabel", {
        BackgroundTransparency = 1,
        Image = "rbxassetid://18610113607",
        ZIndex = -1,
        ImageColor3 = Color3.new(),
        ImageTransparency = v1(0.8),
        Position = UDim2.fromScale(-0.127281, -0.120995),
        Size = UDim2.fromScale(1.26043, 1.25193),
    })
    return createElement("Frame", v2, v3)
end)
-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.PVPProfileCard.PVPPlayerInfo
-- Decompile time: 2.30 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Comma = require(ReplicatedStorage.Client.Modules.Comma)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactUtils = require(ReplicatedStorage.Shared.UI.ReactUtils)
local useTransparencyModifier = require(ReplicatedStorage.Client.Interfaces.Hooks.useTransparencyModifier)
local createElement = React.createElement
local memo = React.memo
local u30 = memo(function(a1) -- Line: 29 -- upvalues: useTransparencyModifier (val), createElement (val)
    local v1 = useTransparencyModifier(a1.transparency)
    local v2 = {
        BackgroundTransparency = 1,
        LayoutOrder = a1.layoutOrder,
        AnchorPoint = a1.anchorPoint,
    }
    local position = a1.position or UDim2.fromScale(0, 0.127482)
    v2.Position = position
    local size = a1.size or UDim2.fromScale(1, 0.137405)
    v2.Size = size
    return createElement("Frame", v2, {
        uIListLayout = createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            Padding = UDim.new(0, 5),
            SortOrder = Enum.SortOrder.LayoutOrder,
        }),
        title = createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextScaled = true,
            AnchorPoint = Vector2.new(0.5, 0),
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Position = UDim2.fromScale(0, -0.277778),
            Size = UDim2.fromScale(4, 0.447002),
            Text = a1.title,
            TextColor3 = Color3.new(1, 1, 1),
            TextTransparency = v1(0),
        }),
        value = createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextScaled = true,
            AnchorPoint = Vector2.new(0.5, 0),
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json"),
            Position = UDim2.fromScale(0, -1.84955e-06),
            Size = UDim2.fromScale(4, 0.447002),
            Text = a1.value,
            TextColor3 = Color3.new(1, 1, 1),
            TextYAlignment = Enum.TextYAlignment.Top,
            TextTransparency = v1(0),
        }),
    })
end)
return memo(function(a1) -- Line: 76
    -- upvalues: useTransparencyModifier (val), createElement (val), ReactUtils (val), Comma (val), u30 (val)
    local v1 = UDim2.fromScale(1, if not a1.maxGlobalRank or not a1.globalRank then 0.18 else 0.137)
    local v2 = useTransparencyModifier(a1.transparency)
    local v3 = {
        BackgroundTransparency = v2(0.99),
        BackgroundColor3 = Color3.new(1, 1, 1),
        Position = a1.position,
        AnchorPoint = a1.anchorPoint,
    }
    local size = a1.size or UDim2.fromScale(1, 1)
    v3.Size = size
    local v4 = {
        list = createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            Padding = UDim.new(0.0572519, 0),
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
    }
    v4.corner = createElement("UICorner", {CornerRadius = UDim.new(a1.physical or 0.11236, 0)})
    v4.stroke = createElement("UIStroke", {Color = Color3.new(1, 1, 1), Transparency = v2(0.95)})
    v4.rankCounter = if not a1.maxGlobalRank or not a1.globalRank then nil else createElement("TextLabel", {
        BackgroundTransparency = 1,
        TextScaled = true,
        AnchorPoint = Vector2.new(0.5, 0),
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json"),
        Size = UDim2.fromScale(4, 0.07),
        TextTransparency = v2(0),
        Text = ReactUtils.mapMultiple({a1.globalRank, a1.maxGlobalRank}, function(a1_2, a2) -- Line: 114 -- upvalues: Comma (upval), a1 (val)
            return (("Rank %*/%*"):format(Comma(a1.globalRank or 0), a1.maxGlobalRank or 200))
        end),
        TextColor3 = Color3.new(1, 1, 1),
    }, {uITextSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 24})})
    v4.wins = createElement(u30, {
        title = "Wins",
        layoutOrder = 1,
        value = a1.wins or 0,
        transparency = a1.transparency,
        size = v1,
    })
    v4.losses = createElement(u30, {
        title = "Losses",
        layoutOrder = 2,
        value = a1.losses or 0,
        transparency = a1.transparency,
        size = v1,
    })
    v4.mobKills = createElement(u30, {
        title = "Enemies Killed",
        layoutOrder = 3,
        value = a1.enemiesKilled or 0,
        transparency = a1.transparency,
        size = v1,
    })
    v4.mobSent = createElement(u30, {
        title = "Enemies Sent",
        layoutOrder = 4,
        value = a1.enemiesSent or 0,
        transparency = a1.transparency,
        size = v1,
    })
    return createElement("Frame", v3, v4)
end)
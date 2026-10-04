-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.NewMatchmaking.MatchmakingCardHoverDetails
-- Decompile time: 10.47 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Comma = require(ReplicatedStorage.Client.Modules.Comma)
local MatchmakingStyle = require(script.Parent.MatchmakingStyle)
local React = require(ReplicatedStorage.Shared.UI.React)
require(ReplicatedStorage.Shared.UI.ReactTypes)
local useFontScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useFontScale)
local createElement = React.createElement
local u33 = {
    Experience = "rbxassetid://6794340240",
    Coins = "rbxassetid://131637335676840",
    Gems = "rbxassetid://80540700708777",
}
local u34 = {"Experience", "Coins", "Gems"}

local function formatRange(a1) -- Line: 37 -- upvalues: Comma (val) -- types: a1: userdata
    if a1.Min == a1.Max then
        return Comma(a1.Min)
    end
    return (("%* - %*"):format(Comma(a1.Min), (Comma(a1.Max))))
end

local function formatMinutes(a1) -- Line: 45 -- types: a1: number
    local v1 = math.floor(a1 * 60 + 0.5)
    return string.format("%d:%02d", math.floor(v1 / 60), v1 % 60)
end

local function createDetailRow(a1) -- Line: 50
    -- upvalues: createElement (val), MatchmakingStyle (val)
    local v1 = a1.prominent == true
    local v2 = if not a1.compact then 24 else 18
    local v3 = if not a1.compact then if not v1 then 20 else 22 else 16
    local v4 = a1.hoverAlpha:map(function(a1) -- Line: 62
        return 1 - math.clamp(a1, 0, 1)
    end)
    return createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 8,
        AutomaticSize = Enum.AutomaticSize.X,
        LayoutOrder = a1.layoutOrder,
        Size = UDim2.fromOffset(0, v2),
    }, {
        Layout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            Padding = UDim.new(0, if not a1.compact then 6 else 4),
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
        IconHolder = createElement("Frame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            LayoutOrder = 1,
            ZIndex = 8,
            Size = UDim2.fromOffset(v3, v3),
        }, {
            Shadow = createElement("ImageLabel", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ZIndex = 8,
                Image = a1.icon,
                ImageColor3 = Color3.fromRGB(0, 0, 0),
                ImageTransparency = a1.hoverAlpha:map(function(a1) -- Line: 96
                    return 1 - math.clamp(a1, 0, 1) * 0.55
                end),
                Position = UDim2.fromOffset(1, 1),
                ScaleType = Enum.ScaleType.Fit,
                Size = UDim2.fromScale(1, 1),
            }),
            Icon = createElement("ImageLabel", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ZIndex = 9,
                Image = a1.icon,
                ImageTransparency = v4,
                ScaleType = Enum.ScaleType.Fit,
                Size = UDim2.fromScale(1, 1),
            }),
        }),
        Value = createElement("TextLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            LayoutOrder = 2,
            TextScaled = false,
            ZIndex = 9,
            AutomaticSize = Enum.AutomaticSize.X,
            FontFace = Font.fromName("Montserrat", if not v1 then Enum.FontWeight.Bold else Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
            Size = UDim2.new(0, 0, 1, 0),
            Text = a1.text,
            TextColor3 = MatchmakingStyle.colors.text,
            TextSize = a1.textSize,
            TextTransparency = v4,
            TextTruncate = Enum.TextTruncate.AtEnd,
            TextXAlignment = Enum.TextXAlignment.Left,
        }, {
            Stroke = createElement("UIStroke", {
                Color = Color3.fromRGB(0, 0, 0),
                LineJoinMode = Enum.LineJoinMode.Round,
                Thickness = if not v1 then 1.5 else 2,
                Transparency = a1.hoverAlpha:map(function(a1) -- Line: 65
                    return 1 - math.clamp(a1, 0, 1) * 0.68
                end),
            }),
        }),
    })
end

return React.memo(function(a1) -- Line: 144
    -- upvalues: useFontScale (val), MatchmakingStyle (val), u34 (val), createElement (val), createDetailRow (val)
    -- upvalues: u33 (val), Comma (val)
    local v1, v2, v3
    local v4 = useFontScale(MatchmakingStyle.getFontSize("header3", a1.compact))
    local v5 = useFontScale(MatchmakingStyle.getFontSize("body", a1.compact))
    local v6 = {}
    for i, j in u34 do
        if a1.details.rewards[j] then
            table.insert(v6, j)
        end
    end
    local v7 = #v6 + 2
    local v8 = if not a1.compact then 24 else 18
    local v9 = if not a1.compact then 2 else 1
    local v10 = if not a1.compact then 8 else 4
    local v11 = if not a1.compact then 6 else 4
    local v12 = {
        Layout = createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            Padding = UDim.new(0, v9),
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
    }
    v12.Boss = createDetailRow({
        icon = "rbxassetid://5547582812",
        layoutOrder = 1,
        prominent = true,
        compact = a1.compact,
        hoverAlpha = a1.hoverAlpha,
        text = a1.details.boss,
        textSize = v4,
    })
    local v13 = nil
    local v14 = nil
    local v15 = a1
    for k, n in v6, v13, v14 do
        v1 = ("Reward_%*"):format(n)
        v2 = {
            compact = v15.compact,
            hoverAlpha = v15.hoverAlpha,
            icon = u33[n],
            layoutOrder = k + 1,
        }
        v3 = v15.details.rewards[n]
        v2.text = if v3.Min ~= v3.Max then ("%* - %*"):format(Comma(v3.Min), (Comma(v3.Max))) else Comma(v3.Min)
        v2.textSize = v5
        v12[v1] = (createDetailRow(v2))
    end
    local v16 = createDetailRow
    v13 = {
        icon = "rbxassetid://5577896365",
        compact = v15.compact,
        hoverAlpha = v15.hoverAlpha,
        layoutOrder = v7,
    }
    local v17 = math.floor(v15.details.estimatedTime * 60 + 0.5)
    v13.text = string.format("%d:%02d", math.floor(v17 / 60), v17 % 60)
    v13.textSize = v5
    v12.Time = v16(v13)
    v14 = {}
    local tag = if not v15.compact then MatchmakingStyle.cornerRadius.details else MatchmakingStyle.cornerRadius.tag
    v14.CornerRadius = tag
    v12.Corner = createElement("UICorner", v14)
    v12.Padding = createElement("UIPadding", {
        PaddingBottom = UDim.new(0, v11),
        PaddingLeft = UDim.new(0, v10),
        PaddingRight = UDim.new(0, v10),
        PaddingTop = UDim.new(0, v11),
    })
    return createElement("Frame", {
        Active = false,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 8,
        AnchorPoint = Vector2.new(0.5, 0.5),
        AutomaticSize = Enum.AutomaticSize.X,
        Position = v15.hoverAlpha:map(function(a1) -- Line: 225
            return UDim2.new(0.5, 0, 0.5, (math.round((1 - (math.clamp(a1, 0, 1))) * 8)))
        end),
        Size = UDim2.fromOffset(0, v7 * v8 + math.max(v7 - 1, 0) * v9 + v11 * 2),
    }, v12)
end)
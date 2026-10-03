-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.PVPRankedNew.RankRewards
-- Decompile time: 5.03 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local PVPConstants = require(ReplicatedStorage.Shared.Modules.PVPConstants)
local React = require(ReplicatedStorage.Shared.UI.React)
local useRef = React.useRef
local useState = React.useState
local createElement = React.createElement
local memo = React.memo
local Fragment = React.Fragment
local Change = React.Change
local PVPRewards = require(script.PVPRewards)
local u30 = {
    [PVPConstants.RANK_DIFFICULTIES.PVP_lowRanks.Min] = "rbxassetid://96068039844843",
    [PVPConstants.RANK_DIFFICULTIES.PVP_midRanks.Min] = "rbxassetid://111007445869339",
    [PVPConstants.RANK_DIFFICULTIES.PVP_highRanks.Min] = "rbxassetid://88240765692605",
}
local u43 = {
    [PVPConstants.RANK_DIFFICULTIES.PVP_lowRanks.Min] = "Basic Arena",
    [PVPConstants.RANK_DIFFICULTIES.PVP_midRanks.Min] = "Molten Arena",
    [PVPConstants.RANK_DIFFICULTIES.PVP_highRanks.Min] = "Fallen Arena",
}

local function getArenaData(a1) -- Line: 32 -- upvalues: PVPConstants (val), u30 (val), u43 (val) -- types: a1: number
    local v1 = ""
    local v2 = ""
    if a1 <= PVPConstants.RANK_DIFFICULTIES.PVP_lowRanks.Max then
        v1 = u30[PVPConstants.RANK_DIFFICULTIES.PVP_lowRanks.Min]
        v2 = u43[PVPConstants.RANK_DIFFICULTIES.PVP_lowRanks.Min]
    elseif not (PVPConstants.RANK_DIFFICULTIES.PVP_lowRanks.Min < a1) then
        if PVPConstants.RANK_DIFFICULTIES.PVP_midRanks.Min <= a1 then
            v1 = u30[PVPConstants.RANK_DIFFICULTIES.PVP_highRanks.Min]
            v2 = u43[PVPConstants.RANK_DIFFICULTIES.PVP_highRanks.Min]
        end
    elseif a1 <= PVPConstants.RANK_DIFFICULTIES.PVP_midRanks.Max then
        v1 = u30[PVPConstants.RANK_DIFFICULTIES.PVP_midRanks.Min]
        v2 = u43[PVPConstants.RANK_DIFFICULTIES.PVP_midRanks.Min]
    elseif PVPConstants.RANK_DIFFICULTIES.PVP_midRanks.Min <= a1 then
        v1 = u30[PVPConstants.RANK_DIFFICULTIES.PVP_highRanks.Min]
        v2 = u43[PVPConstants.RANK_DIFFICULTIES.PVP_highRanks.Min]
    end
    return {Image = v1, Name = v2}
end

local function u57(a1, a2, a3) -- Line: 56
    -- upvalues: createElement (val), React (val)
    return createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 0.015), LayoutOrder = a3}, {
        ArenaImage = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            ImageTransparency = 0,
            ZIndex = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0),
            Size = UDim2.fromScale(2.5, 2.5),
            Image = a1,
        }, {
            {
                uiAspectRatio = createElement("UIAspectRatioConstraint", {AspectRatio = 2.6391752577319587}),
            },
        }),
        UserRankLabel = React.createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextScaled = true,
            ZIndex = 3,
            AnchorPoint = Vector2.new(0.5, 1),
            Position = UDim2.fromScale(0.5, 1),
            Size = UDim2.fromScale(1, 0.5),
            FontFace = Font.fromName("Montserrat", Enum.FontWeight.ExtraBold),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            Text = a2,
        }, {
            UIStroke = React.createElement("UIStroke", {Transparency = 0.75, Thickness = 2, Color = Color3.fromRGB(0, 0, 0)}),
            UIGradient = React.createElement("UIGradient", {
                Rotation = -90,
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(144, 220, 255)),
                    (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))),
                }),
            }),
        }),
    })
end

local function u58(a1) -- Line: 105 -- upvalues: createElement (val) -- types: a1: number
    return createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 1), LayoutOrder = a1})
end

local u61 = memo(function(a1) -- Line: 113
    -- upvalues: PVPConstants (val), Enum (val), getArenaData (val), u43 (val), u57 (val), createElement (val)
    -- upvalues: PVPRewards (val), u58 (val), Fragment (val)
    local v1, v2, v3, v4, v5
    local Visible = a1.Visible
    local Transparency = a1.Transparency
    local v6 = tonumber(a1.rank or "") or 0
    local scrollRef = a1.scrollRef
    local rewards = a1.rewards or {}
    local completedRanks = a1.completedRanks or {}
    local v7 = {}
    local v8 = 0
    local v9 = 0
    local v10 = nil
    local v11 = nil
    for i, j in PVPConstants.RANK_DATA, v10, v11 do
        v1 = tonumber(i) * 10
        if i ~= Enum.Rank.Unranked then
            v2 = getArenaData(j.RankRange.Min)
            if v2 and not v7[v2.Name] and u43[j.RankRange.Min] then
                v7[v2.Name] = (u57(v2.Image, v2.Name, v1 - 1))
            end
            v4 = not (table.find(completedRanks, i) ~= nil)
            if v4 then
                v5 = v6 + 1
                v4 = v1 / 10 <= v5
            end
            v8 = v8 + 1
            v7[j.Name] = (createElement(PVPRewards, {
                LayoutOrder = v1,
                Transparency = Transparency,
                Visible = Visible,
                Size = UDim2.fromScale(1, 1),
                selected = v4,
                completed = v3,
                rankRange = j.RankRange,
                level = j.Name,
                levelIcon = j.Icon,
                rewards = rewards[i],
                scrollRef = scrollRef,
                rankMin = j.RankRange.Min,
                rankMax = j.RankRange.Max,
                arenaImage = getArenaData(j.RankRange.Min).Image,
            }))
            v9 = v9 + 1
        end
    end
    table.insert(v7, (u58(-2)))
    table.insert(v7, (u58(100000)))
    return createElement(Fragment, nil, v7)
end)
return function(a1) -- Line: 170 -- upvalues: useRef (val), useState (val), createElement (val), Change (val), u61 (val)
    local items = a1.items or {}
    local v1 = a1.rank or ""
    local v2 = useRef()
    local v3, u12 = useState(UDim2.new())
    local v4 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(1, 1),
        Position = a1.Position,
        Size = UDim2.fromScale(0.5, 0.7),
    }
    local v5 = {
        uiGradient = createElement("UIGradient", {
            Rotation = 90,
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 1),
                NumberSequenceKeypoint.new(0.1, 0),
                NumberSequenceKeypoint.new(0.9, 0),
                (NumberSequenceKeypoint.new(1, 1)),
            }),
        }),
    }
    local v6 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarImageTransparency = 0,
        ScrollBarThickness = 5,
        Selectable = false,
        AutomaticCanvasSize = Enum.AutomaticSize.None,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        CanvasSize = v3,
        ScrollBarImageColor3 = Color3.fromRGB(54, 54, 54),
        ScrollingDirection = Enum.ScrollingDirection.Y,
        Size = UDim2.new(1, 0, 1, 0),
        ZIndex = a1.ZIndex or 2,
        ref = v2,
    }
    local v7 = {}
    local v8 = createElement
    local v9 = {
        FillDirection = Enum.FillDirection.Vertical,
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Bottom,
        Padding = UDim.new(0.025, 0),
    }

    v9[Change.AbsoluteContentSize] = function(a1) -- Line: 220 -- upvalues: u12 (val)
        u12(UDim2.new(0, 0, 0, a1.AbsoluteContentSize.Y))
    end

    v7.uiListLayout = v8("UIListLayout", v9)
    v9 = {rank = v1, items = items, scrollRef = v2, rewards = a1.rewards}
    local completedRanks = a1.completedRanks or {}
    v9.completedRanks = completedRanks
    v9.Transparency = a1.Transparency
    v9.Visible = a1.Visible
    v7.content = createElement(u61, v9)
    v5.scrollingFrame = createElement("ScrollingFrame", v6, v7)
    return createElement("CanvasGroup", v4, v5)
end
-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.PVPRankedNew
-- Decompile time: 4.47 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RadioCloseButton = require(ReplicatedStorage.Client.Interfaces.Game.Components.Radio.RadioCloseButton)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
require(ReplicatedStorage.Client.Interfaces.Components.GlowButton)
local PVPConstants = require(ReplicatedStorage.Shared.Modules.PVPConstants)
require(ReplicatedStorage.Shared.Modules.PVPConstants.PVPSeasons)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local BattlepassWindow = require(script.Parent.Battlepass.BattlepassWindow)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local useReactBindings = require(ReplicatedStorage.Client.Interfaces.Hooks.useReactBindings)
local new_5 = CFrame.new
local new = Vector3.new
local new_2 = UDim.new
local new_3 = UDim2.new
local new_4 = Vector2.new
local useGroupAnimation = ReactFlow.useGroupAnimation
local useAnimation = ReactFlow.useAnimation
local useMemo = React.useMemo
local useState = React.useState
local useEffect = React.useEffect
local useBinding = React.useBinding
local memo = React.memo
local Spring = ReactFlow.Spring
local PVPUserRank = require(script.PVPUserRank)
local RankRewards = require(script.RankRewards)

local function getTimeDelta(a1) -- Line: 31 -- types: a1: number
    return (math.ceil((a1 - (workspace:GetServerTimeNow())) / 86400))
end

local u88 = table.reduce(PVPConstants.RANK_DATA, function(a1, a2, a3) -- Line: 39
    a1[tonumber(a3)] = a2
    return a1
end, {})
return function(a1) -- Line: 44
    -- upvalues: useBinding (val), useState (val), Enum (val), PVPConstants (val), useReactBindings (val), u88 (val)
    -- upvalues: useMemo (val), useGroupAnimation (val), useAnimation (val), Spring (val), useEffect (val), React (val)
    -- upvalues: BattlepassWindow (val), RadioCloseButton (val), PVPUserRank (val), RankRewards (val)
    local u147
    local Visible = a1.Visible
    local period = a1.period or {}
    local rank = a1.rank or useBinding(2800)
    local completedRanks = a1.completedRanks or {}
    local u16, u17 = useState(Enum.Rank.PrivateI)
    local v1 = math.max(0, 4 - #period)
    local v2 = PVPConstants.getLastSeason()
    local v3 = math.ceil((v2.endsAt.UnixTimestamp - (workspace:GetServerTimeNow())) / 86400)
    local v4 = {rank}
    useReactBindings(function(a1) -- Line: 55 -- upvalues: u88 (upval), u17 (val)
        for i, j in u88 do
            if j.RankRange.Min <= a1 and a1 <= j.RankRange.Max then
                u17(i)
                return
            end
        end
        u17(-1)
    end, v4, {})
    local emitter = a1.emitter
    local v5 = {u16}
    local v6 = useMemo(function() -- Line: 67 -- upvalues: u88 (upval), u16 (val)
        return u88[u16]
    end, v5)
    local v7 = {u16}
    v4 = useMemo(function() -- Line: 71 -- upvalues: u16 (val), u88 (upval)
        local v1 = u16 - 1
        if v1 < 1 then
            return nil
        end
        return u88[v1]
    end, v7)
    local v8 = {u16}
    v5 = useMemo(function() -- Line: 79 -- upvalues: u16 (val), u88 (upval)
        local v1 = if u16 ~= -1 then u16 + 1 else 1
        if #u88 < v1 then
            return nil
        end
        return u88[v1]
    end, v8)
    v7, u147 = useGroupAnimation({
        enable = useAnimation({
            WindowPosition = Spring({speed = 16, damper = 0.4, target = UDim2.fromScale(0.5, 0.5)}),
            RankPosition = Spring({speed = 16, damper = 0.45, target = UDim2.fromScale(0.075, 0.7)}),
            UserRankPosition = Spring({speed = 15, damper = 0.45, target = UDim2.fromScale(0.065, 0.925)}),
            RankRewardsPosition = Spring({speed = 14, damper = 0.45, target = UDim2.fromScale(0.93, 0.925)}),
        }),
        disable = useAnimation({
            WindowPosition = Spring({speed = 15, damper = 0.4, target = UDim2.fromScale(0.5, 0.55)}),
            RankPosition = Spring({speed = 16, damper = 0.45, target = UDim2.fromScale(0.155, 0.7)}),
            UserRankPosition = Spring({speed = 10, damper = 0.3, target = UDim2.fromScale(0.065, 1.1)}),
            RankRewardsPosition = Spring({speed = 9, damper = 0.3, target = UDim2.fromScale(0.93, 1.1)}),
        }),
    }, {
        WindowPosition = UDim2.fromScale(0.5, 0.55),
        UserRankPosition = UDim2.fromScale(0.065, 1.1),
        RankRewardsPosition = UDim2.fromScale(0.93, 1.1),
        RankPosition = UDim2.fromScale(0.155, 0.8),
    })
    local v9 = {Visible}
    useEffect(function() -- Line: 140 -- upvalues: Visible (val), u147 (val)
        if Visible then
            u147("enable")
            return
        end
        u147("disable")
    end, v9)
    return React.createElement(BattlepassWindow, {
        render = "92688354089161",
        renderTransparency = 0.8,
        subTransparency = 0,
        AspectRatio = 1.538,
        MaxSize = 1000,
        title = ("PVP Season - %*"):format(v2.name),
        subTitle = if not (v3 > 0) then "Season has ended!" else ("Season ends in %* days!"):format(v3),
        subColor = Color3.fromRGB(255, 196, 85),
        BackgroundColor3 = Color3.fromRGB(15, 15, 15),
        Position = v7.WindowPosition,
        titleSize = UDim2.fromScale(0.622, 0.09),
        subTitleSize = UDim2.fromScale(0.452, 0.05),
        subTitlePosition = UDim2.fromScale(0.0734, 0.14),
        iconPosition = UDim2.fromScale(0.035, 0.165),
        iconSize = UDim2.fromScale(0.0282, 0.038),
        Visible = Visible,
    }, {
        Button = React.createElement(RadioCloseButton, {
            AnchorPoint = Vector2.new(1, 0),
            Position = UDim2.fromScale(0.97, 0.045),
            Size = UDim2.fromScale(0.075, 0.075),
            onActivated = a1.close,
        }),
        PVPUserRank = React.createElement(PVPUserRank, {
            Position = v7.UserRankPosition,
            previousRankData = v4,
            nextRankData = v5,
            rankData = v6,
            rankEnum = u16,
            rank = rank,
            emitter = emitter,
        }),
        RankRewards = React.createElement(RankRewards, {
            Position = v7.RankRewardsPosition,
            rank = u16,
            rewards = v2.rewards,
            completedRanks = completedRanks,
        }),
        Disclaimer = React.createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextScaled = true,
            TextTransparency = 0.4,
            ZIndex = 3,
            Visible = tostring(u16) == "-1",
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Position = v7.RankPosition,
            Size = UDim2.fromScale(0.4, 0.03),
            Text = ("Beat %* %* to get your Rank!"):format(v1, if v1 ~= 1 then "Matches" else "Match"),
            TextColor3 = Color3.new(1, 1, 1),
        }),
    })
end
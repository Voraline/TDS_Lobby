-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Views.Playtime
-- Decompile time: 9.40 ms

local AdService = game:GetService("AdService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local PlaytimeChestData = require(ReplicatedStorage.Shared.Modules.PlaytimeChestData)
local PlaytimeRewardData = require(ReplicatedStorage.Shared.Modules.PlaytimeRewardData)
local PlaytimeRewards = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.PlaytimeRewards)
local useCache = require(ReplicatedStorage.Client.Interfaces.Hooks.useCache)
local useViewEnabled = require(ReplicatedStorage.Client.Interfaces.Hooks.useViewEnabled)
local PlaytimeRewards_2 = NewNetwork.Channel("PlaytimeRewards")
local u52 = {
    Enum.AdAvailabilityResult.PlayerIneligible,
    Enum.AdAvailabilityResult.DeviceIneligible,
    Enum.AdAvailabilityResult.PublisherIneligible,
    Enum.AdAvailabilityResult.ExperienceIneligible,
}
local u57 = {TimescaleTickets = "Time Scale Ticket(s)", SpinTickets = "Spin Ticket(s)", Experience = "XP"}

local function isIneligible(a1) -- Line: 29 -- upvalues: u52 (val)
    for i, j in u52 do
        if a1 == j then
            return true
        end
    end
    return false
end

local function checkForAds() -- Line: 38 -- upvalues: AdService (val), u52 (val)
    local success, result = pcall(function() -- Line: 39 -- upvalues: AdService (upval)
        return AdService:GetAdAvailabilityNowAsync(Enum.AdFormat.RewardedVideo)
    end)
    if success and result.AdAvailabilityResult == Enum.AdAvailabilityResult.IsAvailable then
        return true
    end
    if not success then
        return false
    end
    for i, j in u52 do
        if result.AdAvailabilityResult == j then
            if true then
                return false
            end
            return false
        end
    end
    if false then
        return false
    end
    return false
end

local function processChestData(a1) -- Line: 55 -- upvalues: u57 (val) -- types: a1: table
    local amount, stat, v1, value, weight
    if not a1 then
        return {}
    end
    local v2 = {}
    local v3 = nil
    local v4 = nil
    for i, j in a1, v3, v4 do
        value = j.value
        weight = j.weight
        amount = nil
        if value.type == "stat" then
            stat = value.stat
            amount = value.amount
        elseif value.type == "crate" then
            stat = value.name
            amount = value.amount
        elseif value.type ~= "consumable" then
            stat = if value.type == "nametag" then value.name else if value.type ~= "emote" then if value.type ~= "skin" then "Unknown Reward" else value.skin else value.name
        else
            stat = value.name
            amount = value.amount
        end
        if u57[stat] then
            stat = u57[stat]
        end
        v1 = string.format("%.0f%%", weight * 100)
        table.insert(v2, {
            text = if not amount then if value.type == "crate" then ("1x %* (%*)"):format(stat, v1) else if value.type ~= "consumable" then ("%* (%*)"):format(stat, v1) else ("1x %* (%*)"):format(stat, v1) else ("%*x %* (%*)"):format(amount, stat, v1),
            weight = weight,
        })
    end
    table.sort(v2, function(a1, a2) -- Line: 103
        return a2.weight < a1.weight
    end)
    local v5 = {}
    for k, n in v2 do
        table.insert(v5, n.text)
    end
    return v5
end

return function() -- Line: 116
    -- upvalues: React (val), useViewEnabled (val), checkForAds (val), useCache (val), PlaytimeRewardData (val)
    -- upvalues: processChestData (val), PlaytimeChestData (val), PlaytimeRewards (val), PlaytimeRewards_2 (val)
    local u35
    local v1, u4 = React.useState(false)
    local PlaytimeRewards_3, PlaytimeRewards_4 = useViewEnabled("PlaytimeRewards")
    local u12 = React.useRef(false)
    local v2 = {PlaytimeRewards_3}
    React.useEffect(function() -- Line: 121 -- upvalues: u12 (val), PlaytimeRewards_3 (val), u4 (val), checkForAds (upval)
        if u12.current or PlaytimeRewards_3 == false then
            return
        end
        u12.current = true
        task.spawn(function() -- Line: 129 -- upvalues: u4 (upval), checkForAds (upval)
            u4((checkForAds()))
        end)
    end, v2)
    local u24 = useCache("PlaytimeRewards", {TimePlayedSeconds = 0, CycleStartTime = 0, Claimed = {}, VideosClaimed = {}})
    local useMemo = React.useMemo
    local v3 = {u24.VideosClaimed}
    local v4 = useMemo(function() -- Line: 141 -- upvalues: PlaytimeRewardData (upval), u24 (val)
        local v1 = {}
        local v2 = #PlaytimeRewardData
        local VideosClaimed = u24.VideosClaimed or {}
        local v3 = 0
        for i = 1, v2 do
            v1[i] = "locked"
        end
        for j, k in VideosClaimed do
            if k then
                v1[j] = "claimed"
                v3 = math.max(v3, j)
            end
        end
        local v4 = v3 + 1
        if v4 <= v2 then
            v1[v4] = "claim"
        end
        return v1
    end, v3)
    v2, u35 = React.useState(function() -- Line: 164 -- upvalues: processChestData (upval), PlaytimeChestData (upval), PlaytimeRewardData (upval)
        return (processChestData(PlaytimeChestData[PlaytimeRewardData[1].reward]))
    end)
    local v5, u40 = React.useState(1)
    if not PlaytimeRewards_3 then
        return nil
    end
    local v6 = 0
    if 0 < u24.CycleStartTime then
        v6 = math.max(0, u24.CycleStartTime + 86400 - (workspace:GetServerTimeNow()))
    end
    local createElement = React.createElement
    local v7 = {}
    local Claimed = u24.Claimed or {}
    v7.claimed = Claimed
    v7.playtime = u24.TimePlayedSeconds or 0

    function v7.onClaimed(a1) -- Line: 185 -- upvalues: PlaytimeRewards_2 (upval) -- types: a1: number
        PlaytimeRewards_2:invokeServer("ClaimReward", a1)
    end

    function v7.onClose() -- Line: 188 -- upvalues: PlaytimeRewards_4 (val)
        PlaytimeRewards_4("Hotbar")
    end

    v7.videoStates = v4

    function v7.onVideoClaimed(a1) -- Line: 193 -- upvalues: PlaytimeRewards_2 (upval) -- types: a1: number
        PlaytimeRewards_2:invokeServer("ClaimVideo", a1)
    end

    v7.timeUntilVideoReset = v6
    v7.canSeeAds = v1

    function v7.onRewardInfoSelected(a1) -- Line: 199
        -- upvalues: PlaytimeRewardData (upval), PlaytimeChestData (upval), processChestData (upval), u40 (val)
        -- upvalues: u35 (val)
        local reward = PlaytimeRewardData[a1].reward
        local v1 = PlaytimeChestData[reward]
        local v2 = processChestData(v1)
        u40(a1)
        u35(v2)
    end

    v7.rewardInfo = v2
    v7.selectedRewardInfoIndex = v5
    return createElement(PlaytimeRewards, v7)
end
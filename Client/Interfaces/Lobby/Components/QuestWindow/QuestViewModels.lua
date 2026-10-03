-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.QuestWindow.QuestViewModels
-- Decompile time: 4.66 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ClientAdapter = require(ReplicatedStorage.Shared.Data.Quests.ClientAdapter)
local Comma = require(ReplicatedStorage.Client.Modules.Comma)
local CrateDisplayName = require(ReplicatedStorage.Client.Interfaces.CrateDisplayName)
local Icons = require(ReplicatedStorage.Client.Interfaces.Icons)
local Icons_2 = require(ReplicatedStorage.Shared.Data.Icons)
require(ReplicatedStorage.Shared.Types.QuestTypes)
local u36 = {ClientAdapter = ClientAdapter}
local u37 = {}
u37.coins = {Icons.CoinsTiny, Icons.CoinsSmall, Icons.CoinsChest, Icons.CoinsChestBig}
u37.gems = {Icons.GemsTiny, Icons.GemsSmall, Icons.GemsChest, Icons.GemsChestBig}
u37.xp = Icons.Experience
u37.xmas2023 = Icons.XmasPresent
u37.crates = Icons_2.Crates
u37.tower = Icons_2.Towers

local function iconFromBucket(a1, a2) -- Line: 25 -- types: a2: number
    if type(a1) ~= "table" then
        return a1
    end
    if a2 >= 1000 then
        return a1[4]
    end
    if a2 >= 100 then
        return a1[3]
    end
    if a2 >= 10 then
        return a1[2]
    end
    return a1[1]
end

local function titleCaseWords(a1) -- Line: 41 -- types: a1: string
    local v1 = {}
    for i in string.gmatch(string.gsub(a1, "[_%-]+", " "), "%S+") do
        table.insert(v1, (string.upper((string.sub(i, 1, 1)))) .. (string.lower((string.sub(i, 2)))))
    end
    return table.concat(v1, " ")
end

function u36.getRewardIcon(a1) -- Line: 55 -- upvalues: u37 (val)
    local v1
    local type_2 = a1.type
    local v2 = a1.amount or 1
    if type_2 == "currency" then
        v1 = u37[a1.currency]
        if type(v1) ~= "table" then
            return v1
        end
        if v2 >= 1000 then
            return v1[4]
        end
        if v2 >= 100 then
            return v1[3]
        end
        if v2 >= 10 then
            return v1[2]
        end
        return v1[1]
    end
    if type_2 == "tower" then
        local v3 = u37.tower[a1.tower]
        if v3 then
            return v3[a1.skin or "Default"] or v3.Default
        end
        return nil
    end
    if type_2 == "crates" then
        return u37.crates[a1.crate]
    end
    v1 = u37[type_2]
    if type(v1) ~= "table" then
        return v1
    end
    if v2 >= 1000 then
        return v1[4]
    end
    if v2 >= 100 then
        return v1[3]
    end
    if v2 >= 10 then
        return v1[2]
    end
    return v1[1]
end

function u36.getRewardValue(a1) -- Line: 78 -- upvalues: Comma (val)
    if a1.type == "tower" then
        return a1.skin or a1.tower or "Tower"
    end
    if a1.type == "crates" then
        return a1.crate or tostring(a1.amount or 1)
    end
    if a1.type ~= "nametag" and a1.type ~= "tag" then
        return Comma(a1.amount or 1)
    end
    return a1.tag or a1.name or "Tag"
end

function u36.getRewardName(a1) -- Line: 94 -- upvalues: titleCaseWords (val), CrateDisplayName (val)
    if type(a1.displayName) == "string" and a1.displayName ~= "" then
        return a1.displayName
    end
    if type(a1.name) == "string" and a1.name ~= "" then
        return a1.name
    end
    if a1.type == "currency" then
        if a1.currency == "coins" then
            return "Coins"
        end
        if a1.currency == "gems" then
            return "Gems"
        end
        if type(a1.currency) == "string" and a1.currency ~= "" then
            return titleCaseWords(a1.currency)
        end
        return "Currency"
    end
    if a1.type == "xp" then
        return "Experience"
    end
    if a1.type == "crates" then
        if type(a1.crate) == "string" and a1.crate ~= "" then
            return CrateDisplayName.withSuffix(a1.crate)
        end
        return "Crate"
    end
    if a1.type == "tower" then
        if type(a1.skin) == "string" and a1.skin ~= "" then
            if type(a1.tower) == "string" and a1.tower ~= "" then
                return (("%* %*"):format(a1.skin, a1.tower))
            end
            return a1.skin
        end
        if type(a1.tower) == "string" and a1.tower ~= "" then
            return a1.tower
        end
        return "Tower"
    end
    if a1.type ~= "nametag" and a1.type ~= "tag" then
        if type(a1.type) == "string" and a1.type ~= "" then
            return titleCaseWords(a1.type)
        end
        return "Reward"
    end
    if type(a1.tag) == "string" and a1.tag ~= "" then
        return a1.tag
    end
    if type(a1.name) == "string" and a1.name ~= "" then
        return a1.name
    end
    return "Name Tag"
end

function u36.toRewardItemProps(a1, a2) -- Line: 146 -- upvalues: u36 (val) -- types: a2: number
    local v1 = {
        RewardValue = u36.getRewardValue(a1),
        RewardName = u36.getRewardName(a1),
        RewardIcon = u36.getRewardIcon(a1),
    }
    v1.RewardCrate = if a1.type ~= "crates" then nil else a1.crate
    v1.RewardNametag = if a1.type == "nametag" then a1.tag or a1.name else if a1.type ~= "tag" then nil else a1.tag or a1.name
    v1.RewardType = a1.type
    v1.LayoutOrder = a2
    return v1
end

function u36.formatSecondsLeft(a1) -- Line: 160 -- types: a1: number
    local v1 = math.max(0, (math.ceil(a1)))
    local v2 = math.floor(v1 / 86400)
    local v3 = string.format("%02d:%02d:%02d", math.floor(v1 % 86400 / 3600), math.floor(v1 % 3600 / 60), v1 % 60)
    if v2 > 0 then
        return (("%*d %*"):format(v2, v3))
    end
    return v3
end

function u36.formatTimeLeft(a1) -- Line: 175 -- upvalues: u36 (val) -- types: a1: number?
    if not a1 then
        return nil
    end
    return u36.formatSecondsLeft(a1 - workspace:GetServerTimeNow())
end

function u36.getSectionTitle(a1) -- Line: 183 -- upvalues: titleCaseWords (val) -- types: a1: string
    if a1 == "daily" then
        return "Daily Quests"
    end
    if a1 == "weekly" then
        return "Weekly Quests"
    end
    if a1 == "seasonal" then
        return "Seasonal Quests"
    end
    if a1 == "missions" then
        return "Active Missions"
    end
    local v1 = titleCaseWords(a1)
    if v1 == "" then
        return "Quests"
    end
    local v2 = string.lower(v1)
    if not string.find(v2, "quest", 1, true) and not string.find(v2, "mission", 1, true) then
        return (("%* Quests"):format(v1))
    end
    return v1
end

function u36.getGroupAccent(a1) -- Line: 207 -- types: a1: string?
    if a1 == "weekly" then
        return Color3.fromRGB(255, 112, 126)
    end
    if a1 == "seasonal" then
        return Color3.fromRGB(0, 170, 255)
    end
    if a1 == "missions" then
        return Color3.fromRGB(112, 180, 255)
    end
    return Color3.fromRGB(255, 216, 92)
end

function u36.getActionColor(a1) -- Line: 219 -- types: a1: string?
    if a1 == "claim" then
        return Color3.fromRGB(10, 220, 80)
    end
    if a1 == "cancelMission" then
        return Color3.fromRGB(255, 80, 80)
    end
    if a1 == "purchaseMission" then
        return Color3.fromRGB(84, 218, 93)
    end
    if a1 ~= "track" and a1 ~= "untrack" then
        return Color3.fromRGB(0, 170, 255)
    end
    return Color3.fromRGB(72, 159, 255)
end

function u36.getProgressText(a1) -- Line: 233 -- upvalues: ClientAdapter (val), Comma (val)
    local v1 = ClientAdapter.getProgress(a1)
    return (("%* / %*"):format(Comma((math.min(v1.totalCurrent, v1.totalAmount))), (Comma(v1.totalAmount))))
end

function u36.getMissionPriceText(a1) -- Line: 240 -- upvalues: Comma (val)
    if a1.price and not (a1.price <= 0) then
        return (("%* %*"):format(Comma(a1.price), a1.currency or "coins"))
    end
    return nil
end

return u36
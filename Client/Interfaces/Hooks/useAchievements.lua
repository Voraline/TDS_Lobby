-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useAchievements
-- Decompile time: 7.11 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Components = ReplicatedStorage.Client.Interfaces.Lobby.Components
local Content = require(ReplicatedStorage.Shared.Modules.Content)
local React = require(ReplicatedStorage.Shared.UI.React)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local useMemo = React.useMemo
local Achievement = Content("Achievement")
local u29 = {
    "Defender",
    "Breached",
    "Interdimensional Explorer",
    "Cosmic Drifter",
    "Cult Destroyer",
    "Exos Nemesis",
    "Evil Within",
    "Death Touched",
    "Against The Odds",
    "First Contact",
    "Decimator",
    "Doom-bringer",
    "Harbinger",
    "Scorched Earth",
    "Living Weapon",
    "Recruit",
    "Average Joe",
    "Battle Hardened",
    "Warlord",
    "Usurper",
    "Security Guard",
    "Buckshot",
    "Plague Doctor",
    "Doctor",
    "Cursed Soul",
    "Outlaw",
    "The Cure",
    "Student",
    "Undergrad",
    "Scholar",
    "Keeper of Knowledge",
    "Officer",
    "Warhawk",
    "The Gambit",
    "Mastermind",
    "Commander in Chief",
    "Paladin",
    "Slayer",
    "Sentinel",
    "Ascended",
    "tH3 GL1tcH",
    "Fully Loaded",
    "Arsenal",
    "Weaponsmith",
    "Master of Arms",
    "Thrifty",
    "Stylist",
    "Hype Beast",
    "Collector",
    "The Vault",
    "One of a kind",
    "Errand Boy",
    "Special Agent",
    "Black Ops",
    "Commander’s Favorite",
    "Task Master",
}

local function _sortAchievements(a1) -- Line: 81 -- upvalues: table (val)
    local dfs
    local u1 = {}
    local v1 = {}
    local u3 = {}
    for i in a1 do
        u1[i] = {}
    end
    for j, k in a1 do
        if k.lockedBehind then
            table.insert(u1[k.lockedBehind], j)
        end
    end
    for n, m in u1 do
        table.sort(m)
    end
    for i5, i6 in a1 do
        if not i6.lockedBehind then
            table.insert(v1, i5)
        end
    end
    table.sort(v1)

    function dfs(a1_2) -- Line: 108 -- upvalues: table (upval), u3 (val), a1 (val), u1 (val), dfs (val)
        table.insert(u3, {name = a1_2, value = a1[a1_2]})
        for k, v in pairs(u1[a1_2]) do
            dfs(v)
        end
    end

    for k2, v in pairs(v1) do
        dfs(v)
    end
    return u3
end

local function tempSortAchievements(a1, a2) -- Line: 123 -- upvalues: table (val), u29 (val) -- types: a2: table
    local v1 = {}
    for i, j in a1 do
        table.insert(v1, {name = i, value = j})
    end
    table.sort(v1, function(a1, a2_2) -- Line: 130 -- upvalues: table (upval), u29 (upval), a2 (val)
        local v1 = table.find(u29, a1.name)
        local v2 = table.find(u29, a2_2.name)
        local v3 = a2[a1.name]
        local v4 = a2[a2_2.name]
        local v5 = v3 == true
        local v6 = v4 == true
        local completed = not v5 and v5 and v5.completed
        local completed_2 = not v6 and v4 and v4.completed
        if completed and completed_2 then
            if v1 and v2 then
                return v1 < v2
            end
            if v1 then
                return true
            end
            if v2 then
                return false
            end
            return a1.name < a2_2.name
        end
        if completed and not completed_2 then
            return true
        end
        if not completed and completed_2 then
            return false
        end
        if v5 and v6 then
            if v1 and v2 then
                return v1 < v2
            end
            if v1 then
                return true
            end
            if v2 then
                return false
            end
            return a1.name < a2_2.name
        end
        if v5 and not v6 then
            return false
        end
        if not v5 and v6 then
            return true
        end
        local amount = v3 and v3.amount or 0
        local amount_2 = v4 and v4.amount or 0
        if not (amount > 0) and not (amount_2 > 0) then
            if v1 and v2 then
                return v1 < v2
            end
            if v1 then
                return true
            end
            if v2 then
                return false
            end
            return a1.name < a2_2.name
        end
        return amount_2 < amount
    end)
    return v1
end

return function(a1) -- Line: 182
    -- upvalues: useMemo (val), Achievement (val), table (val), tempSortAchievements (val)
    local u4 = useMemo(function() -- Line: 183 -- upvalues: Achievement (upval), table (upval)
        local v1 = {}
        for i, j in Achievement:GetDescendants() do
            if j:IsA("ModuleScript") then
                table.insert(v1, j)
            end
        end
        return table.reduce(v1, function(a1, a2) -- Line: 191
            a1[a2.Name] = (require(a2))
            return a1
        end, {})
    end, {})
    local v1 = {a1}
    return u4, useMemo(function() -- Line: 198 -- upvalues: tempSortAchievements (upval), u4 (val), a1 (val)
        return (tempSortAchievements(u4, a1))
    end, v1)
end
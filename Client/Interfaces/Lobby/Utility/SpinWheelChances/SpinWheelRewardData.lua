-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Utility.SpinWheelChances.SpinWheelRewardData
-- Decompile time: 9.43 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Asset = require(ReplicatedStorage.Shared.Modules.Asset)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local Icons = require(ReplicatedStorage.Client.Interfaces.Icons)
local SharedDailyRewards = require(ReplicatedStorage.Shared.Modules.SharedDailyRewards)
local u25 = {
    Coins = Icons.CoinsTiny,
    Gems = Icons.GemsTiny,
    Revive = Icons.Revive,
    Timescale = Icons.Timescale,
    Spin = Icons.Spin,
}
local u31 = {
    Coins = "Coins",
    Gems = "Gems",
    Revive = "Revive Ticket",
    Timescale = "Time Scale Ticket",
    Spin = "Spin Ticket",
}
local u32 = {
    ["Revive Ticket"] = "Revive Tickets",
    ["Time Scale Ticket"] = "Time Scale Tickets",
    ["Spin Ticket"] = "Spin Tickets",
}

local function getRewardKey(a1) -- Line: 32
    local v1 = {}
    for i, j in a1.value do
        v1[i] = (tostring(j))
    end
    return (("%*:%*"):format(a1.type, (table.concat(v1, ":"))))
end

local function pluralize(a1, a2) -- Line: 41 -- upvalues: u32 (val) -- types: a1: string, a2: number?
    if a2 == 1 then
        return a1
    end
    local v1 = u32[a1]
    if v1 then
        return v1
    end
    if a1:sub(-1) == "s" then
        return a1
    end
    return (("%*s"):format(a1))
end

local function getAmount(a1) -- Line: 58 -- types: a1: table
    local v1
    for i = #a1, 1, -1 do
        v1 = a1[i]
        if typeof(v1) == "number" then
            return v1
        end
    end
    return nil
end

local function formatRewardName(a1, a2, a3) -- Line: 69
    -- upvalues: u32 (val)
    local v1
    if not a2 then
        return a1
    end
    if a3 ~= "Currency" then
        if a2 > 1 then
            return (("%*x %*"):format(a2, a1))
        end
        return a1
    end
    if a2 ~= 1 then
        local v2 = u32[a1]
        v1 = if not v2 then if a1:sub(-1) ~= "s" then ("%*s"):format(a1) else a1 else v2
    else
        v1 = a1
    end
    return (("%* %*"):format(a2, v1))
end

local function resolveImage(a1) -- Line: 85
    if typeof(a1) == "number" then
        return (("rbxassetid://%*"):format(a1))
    end
    return a1 or ""
end

local function getRewardPresentation(a1) -- Line: 93 -- upvalues: u31 (val), u25 (val), u32 (val), Asset (val)
    local DisplayName, DisplayName_2, DisplayName_3, Icon, Icon_2, Icon_3, Icon_4, Name, SkinData, v1, v2, v3, v4, v5, v6, v7, v8
    local type = a1.type
    local value = a1.value
    for i = #value, 1, -1 do
        v7 = value[i]
        if typeof(v7) == "number" then
            v3 = v7
            if type == "Currency" then
                v4 = value[1]
                v5 = u31[v4] or v4
                v6 = {}
                v8 = u25[v4]
                v6.icon = if typeof(v8) ~= "number" then v8 or "" else ("rbxassetid://%*"):format(v8)
                if not v3 then
                    v7 = v5
                elseif type ~= "Currency" then
                    v7 = if not (v3 > 1) then v5 else ("%*x %*"):format(v3, v5)
                else
                    if v3 ~= 1 then
                        v2 = u32[v5]
                        v1 = if not v2 then if v5:sub(-1) ~= "s" then ("%*s"):format(v5) else v5 else v2
                    else
                        v1 = v5
                    end
                    v7 = ("%* %*"):format(v3, v1)
                end
                v6.name = v7
                return v6
            end
            if type == "Consumable" then
                v4 = Asset("Consumables", value[1])
                DisplayName = v4.DisplayName or v4.Name or value[1]
                v6 = {}
                Icon = v4.Icon
                v6.icon = if typeof(Icon) ~= "number" then Icon or "" else ("rbxassetid://%*"):format(Icon)
                if not v3 then
                    v7 = DisplayName
                elseif type ~= "Currency" then
                    v7 = if not (v3 > 1) then DisplayName else ("%*x %*"):format(v3, DisplayName)
                else
                    if v3 ~= 1 then
                        v2 = u32[DisplayName]
                        v1 = if not v2 then if DisplayName:sub(-1) ~= "s" then ("%*s"):format(DisplayName) else DisplayName else v2
                    else
                        v1 = DisplayName
                    end
                    v7 = ("%* %*"):format(v3, v1)
                end
                v6.name = v7
                return v6
            end
            if type ~= "Crate" then
                if type == "Skin" then
                    v4 = Asset("Troops", value[1])
                    SkinData = v4.Properties.SkinData and v4.Properties.SkinData[value[2]]
                    Icon_3 = SkinData and SkinData.Icon or v4.Properties.Preview.Icon
                    Name = if not SkinData then value[2] else if not SkinData.Name then value[2] else SkinData.Name
                    return {
                        icon = if typeof(Icon_3) ~= "number" then Icon_3 or "" else ("rbxassetid://%*"):format(Icon_3),
                        name = Name,
                    }
                end
                if type == "Tower" then
                    v4 = Asset("Troops", value[1])
                    v5 = {}
                    Icon_4 = v4.Properties.Preview.Icon
                    v5.icon = if typeof(Icon_4) ~= "number" then Icon_4 or "" else ("rbxassetid://%*"):format(Icon_4)
                    DisplayName_3 = v4.Properties.DisplayName or value[1]
                    v5.name = DisplayName_3
                    return v5
                end
                return {icon = "", name = tostring(value[1] or type)}
            end
            v4 = Asset("NewCrates", value[1])
            DisplayName_2 = if not v4.DisplayName then value[1] else if v4.DisplayName == "" then value[1] else v4.DisplayName
            v6 = {}
            Icon_2 = v4.Icon
            v6.icon = if typeof(Icon_2) ~= "number" then Icon_2 or "" else ("rbxassetid://%*"):format(Icon_2)
            if not v3 then
                v7 = DisplayName_2
            elseif type ~= "Currency" then
                v7 = if not (v3 > 1) then DisplayName_2 else ("%*x %*"):format(v3, DisplayName_2)
            else
                if v3 ~= 1 then
                    v2 = u32[DisplayName_2]
                    v1 = if not v2 then if DisplayName_2:sub(-1) ~= "s" then ("%*s"):format(DisplayName_2) else DisplayName_2 else v2
                else
                    v1 = DisplayName_2
                end
                v7 = ("%* %*"):format(v3, v1)
            end
            v6.name = v7
            return v6
        end
    end
    v3 = nil
    if type == "Currency" then
        v4 = value[1]
        v5 = u31[v4] or v4
        v6 = {}
        v8 = u25[v4]
        v6.icon = if typeof(v8) ~= "number" then v8 or "" else ("rbxassetid://%*"):format(v8)
        if not v3 then
            v7 = v5
        elseif type ~= "Currency" then
            v7 = if not (v3 > 1) then v5 else ("%*x %*"):format(v3, v5)
        else
            if v3 ~= 1 then
                v2 = u32[v5]
                v1 = if not v2 then if v5:sub(-1) ~= "s" then ("%*s"):format(v5) else v5 else v2
            else
                v1 = v5
            end
            v7 = ("%* %*"):format(v3, v1)
        end
        v6.name = v7
        return v6
    end
    if type == "Consumable" then
        v4 = Asset("Consumables", value[1])
        DisplayName = v4.DisplayName or v4.Name or value[1]
        v6 = {}
        Icon = v4.Icon
        v6.icon = if typeof(Icon) ~= "number" then Icon or "" else ("rbxassetid://%*"):format(Icon)
        if not v3 then
            v7 = DisplayName
        elseif type ~= "Currency" then
            v7 = if not (v3 > 1) then DisplayName else ("%*x %*"):format(v3, DisplayName)
        else
            if v3 ~= 1 then
                v2 = u32[DisplayName]
                v1 = if not v2 then if DisplayName:sub(-1) ~= "s" then ("%*s"):format(DisplayName) else DisplayName else v2
            else
                v1 = DisplayName
            end
            v7 = ("%* %*"):format(v3, v1)
        end
        v6.name = v7
        return v6
    end
    if type ~= "Crate" then
        if type == "Skin" then
            v4 = Asset("Troops", value[1])
            SkinData = v4.Properties.SkinData and v4.Properties.SkinData[value[2]]
            Icon_3 = SkinData and SkinData.Icon or v4.Properties.Preview.Icon
            Name = if not SkinData then value[2] else if not SkinData.Name then value[2] else SkinData.Name
            return {
                icon = if typeof(Icon_3) ~= "number" then Icon_3 or "" else ("rbxassetid://%*"):format(Icon_3),
                name = Name,
            }
        end
        if type == "Tower" then
            v4 = Asset("Troops", value[1])
            v5 = {}
            Icon_4 = v4.Properties.Preview.Icon
            v5.icon = if typeof(Icon_4) ~= "number" then Icon_4 or "" else ("rbxassetid://%*"):format(Icon_4)
            DisplayName_3 = v4.Properties.DisplayName or value[1]
            v5.name = DisplayName_3
            return v5
        end
        return {icon = "", name = tostring(value[1] or type)}
    end
    v4 = Asset("NewCrates", value[1])
    DisplayName_2 = if not v4.DisplayName then value[1] else if v4.DisplayName == "" then value[1] else v4.DisplayName
    v6 = {}
    Icon_2 = v4.Icon
    v6.icon = if typeof(Icon_2) ~= "number" then Icon_2 or "" else ("rbxassetid://%*"):format(Icon_2)
    if not v3 then
        v7 = DisplayName_2
    elseif type ~= "Currency" then
        v7 = if not (v3 > 1) then DisplayName_2 else ("%*x %*"):format(v3, DisplayName_2)
    else
        if v3 ~= 1 then
            v2 = u32[DisplayName_2]
            v1 = if not v2 then if DisplayName_2:sub(-1) ~= "s" then ("%*s"):format(DisplayName_2) else DisplayName_2 else v2
        else
            v1 = DisplayName_2
        end
        v7 = ("%* %*"):format(v3, v1)
    end
    v6.name = v7
    return v6
end

return {
    Entries = (function() -- Line: 149
        -- upvalues: SharedDailyRewards (val), getRewardPresentation (val), getRewardKey (val), Enum (val)
        local v1, v2, v3, v4, v5, v6, v7
        local v8 = {}
        local v9 = {}
        local v10 = 0
        for i, j in SharedDailyRewards.SpinRewardSegments do
            v6 = SharedDailyRewards.SpinRewardPool[j]
            v7 = SharedDailyRewards.SpinRewardWeights[j] or 0
            if v6 and #v6 > 0 and v7 > 0 then
                v8[j] = (v8[j] or 0) + 1
                v10 = v10 + v7
            end
        end
        if v10 <= 0 then
            return {}
        end
        local v11 = {}
        local v12 = 1
        local v13 = nil
        local v14 = nil
        for k, n in SharedDailyRewards.SpinRewardSegments, v13, v14 do
            if not v9[n] then
                v9[n] = true
                v1 = SharedDailyRewards.SpinRewardPool[n]
                v2 = SharedDailyRewards.SpinRewardWeights[n] or 0
                v3 = v8[n] or 0
                if v1 and not (#v1 <= 0) and not (v3 <= 0) and not (v2 <= 0) then
                    v4 = v3 * v2 / v10 * 10000
                    for m, i5 in v1 do
                        v5 = getRewardPresentation(i5)
                        table.insert(v11, {
                            exactBasisPoints = v4,
                            icon = v5.icon,
                            layoutOrder = v12,
                            name = v5.name,
                            rarityBasisPoints = v4,
                            rewardKey = getRewardKey(i5),
                            rarity = n,
                            rarityName = Enum.CrateItemRarity.ToString(n),
                        })
                        v12 = v12 + 1
                    end
                end
            end
        end
        table.sort(v11, function(a1, a2) -- Line: 205
            if a1.exactBasisPoints == a2.exactBasisPoints then
                return a1.layoutOrder < a2.layoutOrder
            end
            return a2.exactBasisPoints < a1.exactBasisPoints
        end)
        return v11
    end)(),
    FormatChance = function(a1) -- Line: 216 -- types: a1: number
        return string.format("%.2f%%", a1 / 100)
    end,
    GetRewardKey = getRewardKey,
}
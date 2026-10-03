-- Script path: ReplicatedStorage.Client.Modules.MapRewardPreview
-- Decompile time: 6.79 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Comma = require(ReplicatedStorage.Client.Modules.Comma)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local FFlagController = require(ReplicatedStorage.Client.Controllers.Shared.FFlagController)
local GameModeData = require(ReplicatedStorage.Shared.Data.GameModeData)
local v1 = {}
local u30 = FFlagController.get("rewards.new_gamemode_rewards", {})
local u31 = {Normal = "Medium", Medium = "Normal"}
local u32 = {Easy = "Hardcore", Hardcore = "Hardcore", Hard = "Voidcore", Voidcore = "Voidcore"}
local u33 = {CurrencyLabel = "Coins", Currency = {Min = 100, Max = 100}, Experience = {Min = 50, Max = 50}}

local function getRewardRange(a1) -- Line: 35 -- types: a1: number?
    if a1 and not (a1 <= 0) then
        local v1 = math.round(a1)
        return {Min = v1, Max = v1}
    end
    return nil
end

local function getMapMultiplier(a1, a2) -- Line: 48 -- upvalues: Enum (val), u31 (val)
    if not a1 then
        return 1
    end
    local v1 = a1[a2]
    if v1 ~= nil then
        return v1
    end
    local v2 = Enum.Difficulty.ToString(a2) or tostring(a2)
    local v3 = a1[v2]
    if v3 ~= nil then
        return v3
    end
    local v4 = u31[v2]
    if v4 then
        local v5 = a1[v4]
        if v5 ~= nil then
            return v5
        end
    end
    return 1
end

local function getReplicatedDifficulty() -- Line: 75 -- upvalues: ReplicatedStorage (val)
    local State = ReplicatedStorage:FindFirstChild("State")
    local Difficulty = State and State:FindFirstChild("Difficulty")
    if Difficulty and Difficulty:IsA("StringValue") and Difficulty.Value ~= "" then
        return Difficulty.Value
    end
    local StateReplicators = ReplicatedStorage:FindFirstChild("StateReplicators")
    local GameStateReplicator = StateReplicators and StateReplicators:FindFirstChild("GameStateReplicator")
    local Attribute = GameStateReplicator and GameStateReplicator:GetAttribute("Difficulty")
    if typeof(Attribute) == "string" and Attribute ~= "" then
        return Attribute
    end
    return nil
end

local function getTriumphRewardTotal(a1, a2) -- Line: 93 -- types: a2: string?
    if not a1 then
        return 0
    end
    return (a1.Base and a1.Base[a2] or 0) + (a1.Win and a1.Win[a2] or 0)
end

local function getConfigRewardPreview(a1, a2, a3) -- Line: 103 -- types: a2: string?, a3: number
    local v1
    if (if a1 then (a1.Base and a1.Base[a2] or 0) + (a1.Win and a1.Win[a2] or 0) else 0) <= 0 then
        return nil
    end
    local v2 = v1 * a3
    if v2 and not (v2 <= 0) then
        v2 = math.round(v2)
        return {Min = v2, Max = v2}
    end
    return nil
end

local function getNumberRangePreview(a1) -- Line: 113 -- types: a1: userdata?
    if not a1 then
        return nil
    end
    local Max = a1.Max
    if Max and not (Max <= 0) then
        local v1 = math.round(Max)
        return {Min = v1, Max = v1}
    end
    return nil
end

local function getGameModeDataRewards(a1) -- Line: 121 -- upvalues: GameModeData (val) -- types: a1: string?
    local v1, v2
    local v3 = a1 and GameModeData[a1]
    local Rewards = v3 and v3.Rewards
    if not Rewards then
        return nil
    end
    local v4 = if not Rewards.Gems then "Coins" else "Gems"
    local v5 = {}
    local v6 = Rewards[v4]
    if v6 then
        local Max = v6.Max
        if not Max then
            v1 = nil
        elseif not (Max <= 0) then
            v2 = math.round(Max)
            v1 = {Min = v2, Max = v2}
        else
            v1 = nil
        end
    else
        v1 = nil
    end
    v5.Currency = v1
    v5.CurrencyLabel = v4
    local Experience = Rewards.Experience
    if Experience then
        local Max_2 = Experience.Max
        if not Max_2 then
            v1 = nil
        elseif not (Max_2 <= 0) then
            v2 = math.round(Max_2)
            v1 = {Min = v2, Max = v2}
        else
            v1 = nil
        end
    else
        v1 = nil
    end
    v5.Experience = v1
    return v5
end

local function getSurvivalRewards(a1, a2) -- Line: 137
    -- upvalues: u30 (val), Enum (val), u31 (val), getGameModeDataRewards (val)
    local v1, v2, v3, v4, v5, v6, v7
    local v8 = a2 or "Fallen"
    local v9 = u30()
    local v10 = v9 and next(v9) ~= nil
    if not v10 then
        v2 = 1
    else
        local RewardMultiplier = v9.RewardMultiplier
        if RewardMultiplier then
            v4 = RewardMultiplier[a1]
            if v4 == nil then
                v5 = Enum.Difficulty.ToString(a1) or tostring(a1)
                v6 = RewardMultiplier[v5]
                if v6 == nil then
                    v7 = u31[v5]
                    if not v7 then
                        v2 = 1
                    else
                        v1 = RewardMultiplier[v7]
                        v2 = if v1 == nil then 1 else v1
                    end
                else
                    v2 = v6
                end
            else
                v2 = v4
            end
        else
            v2 = 1
        end
    end
    if not v10 then
        v3 = nil
    else
        local Currency = v9.Currency
        v6 = if Currency then (Currency.Base and Currency.Base[v8] or 0) + (Currency.Win and Currency.Win[v8] or 0) else 0
        if not (v6 <= 0) then
            v7 = v6 * v2
            if not v7 then
                v3 = nil
            elseif not (v7 <= 0) then
                v7 = math.round(v7)
                v3 = {Min = v7, Max = v7}
            else
                v3 = nil
            end
        else
            v3 = nil
        end
    end
    if not v10 then
        v4 = nil
    else
        local Exp = v9.Exp
        v7 = if Exp then (Exp.Base and Exp.Base[v8] or 0) + (Exp.Win and Exp.Win[v8] or 0) else 0
        if not (v7 <= 0) then
            v1 = v7 * v2
            if not v1 then
                v4 = nil
            elseif not (v1 <= 0) then
                v1 = math.round(v1)
                v4 = {Min = v1, Max = v1}
            else
                v4 = nil
            end
        else
            v4 = nil
        end
    end
    if not v3 or not v4 then
        v5 = getGameModeDataRewards(v8)
        v3 = v3 or v5 and v5.Currency
        v4 = v4 or v5 and v5.Experience
    end
    return {CurrencyLabel = "Coins", Currency = v3, Experience = v4}
end

local function getRewardDataKey(a1, a2) -- Line: 166
    -- upvalues: u32 (val), GameModeData (val)
    if a1 == "Hardcore" then
        return u32[a2 or ""] or "Hardcore"
    end
    if a2 and GameModeData[a2] then
        return a2
    end
    if a1 and GameModeData[a1] then
        return a1
    end
    return nil
end

function v1.GetModeRewards(a1, a2, a3) -- Line: 182
    -- upvalues: getReplicatedDifficulty (val), u33 (val), getSurvivalRewards (val), getGameModeDataRewards (val)
    -- upvalues: u32 (val), GameModeData (val)
    if typeof(a2) ~= "string" then
        a2 = workspace:GetAttribute("GameMode")
    end
    if typeof(a2) ~= "string" then
        a2 = nil
    end
    local v1 = if typeof(a3) ~= "string" then getReplicatedDifficulty() else a3
    if a2 == "PVP" then
        return u33
    end
    if a2 == "Survival" then
        return (getSurvivalRewards(a1, v1))
    end
    local v2 = getGameModeDataRewards(if a2 ~= "Hardcore" then if not v1 then if not a2 then nil else if not GameModeData[a2] then nil else a2 else if not GameModeData[v1] then if not a2 then nil else if not GameModeData[a2] then nil else a2 else v1 else u32[v1 or ""] or "Hardcore")
    if v2 then
        return v2
    end
    return (getSurvivalRewards(a1, v1))
end

function v1.FormatRange(a1) -- Line: 212 -- upvalues: Comma (val)
    if a1.Min == a1.Max then
        return Comma(a1.Min)
    end
    return (Comma(a1.Min)) .. "-" .. Comma(a1.Max)
end

local function formatCompactNumber(a1) -- Line: 220 -- types: a1: number
    if not (a1 >= 1000) then
        return (tostring(a1))
    end
    local v1 = math.floor(a1 / 100 + 0.5) / 10
    if v1 % 1 == 0 then
        return (tostring(v1)) .. "K"
    end
    return string.format("%.1fK", v1)
end

function v1.FormatCompactRange(a1) -- Line: 233 -- upvalues: formatCompactNumber (val)
    local v1, v2
    if a1.Min == a1.Max then
        return formatCompactNumber(a1.Min)
    end
    local Min = a1.Min
    if not (Min >= 1000) then
        v1 = tostring(Min)
    else
        v2 = math.floor(Min / 100 + 0.5) / 10
        v1 = if v2 % 1 ~= 0 then string.format("%.1fK", v2) else (tostring(v2)) .. "K"
    end
    local Max = a1.Max
    if not (Max >= 1000) then
        v2 = tostring(Max)
    else
        local v3 = math.floor(Max / 100 + 0.5) / 10
        v2 = if v3 % 1 ~= 0 then string.format("%.1fK", v3) else (tostring(v3)) .. "K"
    end
    return v1 .. "-" .. v2
end

return v1
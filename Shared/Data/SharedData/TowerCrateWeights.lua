-- Script path: ReplicatedStorage.Shared.Data.SharedData.TowerCrateWeights
-- Decompile time: 2.34 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Asset = require(ReplicatedStorage.Shared.Modules.Asset)
local CrateData = require(ReplicatedStorage.Shared.Modules.CrateData)
local RarityWeights = require(ReplicatedStorage.Shared.Data.SharedData.RarityWeights)

local function hasTower(a1, a2) -- Line: 46 -- types: a2: string
    return a1[a2] ~= nil
end

local function hasSkin(a1, a2, a3) -- Line: 50 -- types: a2: string, a3: string
    local v1 = a1[a2]
    if not v1 then
        return false
    end
    for k, v in pairs(v1) do
        if v.Name == a3 then
            return true
        end
    end
    return false
end

local function assertEq(a1, a2) -- Line: 65 -- types: a2: string?
    if not a1 then
        return error(a2 or "Assertion failed", (1 / 0))
    end
    return a1
end

local function getWeightedEntries(a1, a2, a3, a4, a5) -- Line: 73
    -- upvalues: Asset (val), RarityWeights (val)
    local Rarity, Weights, v1, v2
    local v3 = {}
    local v4, v5, v6 = a1, a3, a4
    for k, v in pairs(a1.Contents) do
        for k2, i in pairs(v) do
            v2 = v5[i]
            if v2 then
                for k3, j in pairs(v2) do
                    if j.Name == k then
                        v1 = true
                        if not v1 then
                            v1 = Asset("Troops", i)
                            if v1 then
                                v2 = v1.Properties.SkinData[k]
                                if v2 then
                                    Rarity = v2.Rarity
                                    if Rarity then
                                        Weights = v4.Weights and v4.Weights[Rarity] or RarityWeights(Rarity, v6)
                                        if Weights then
                                            table.insert(v3, {
                                                weight = Weights,
                                                value = {rarity = Rarity, tower = i, skin = k},
                                            })
                                        end
                                    end
                                end
                            end
                        end
                        break
                    end
                end
            end
            v1 = false
            if not v1 then
                v1 = Asset("Troops", i)
                if v1 then
                    v2 = v1.Properties.SkinData[k]
                    if v2 then
                        Rarity = v2.Rarity
                        if Rarity then
                            Weights = v4.Weights and v4.Weights[Rarity] or RarityWeights(Rarity, v6)
                            if Weights then
                                table.insert(v3, {
                                    weight = Weights,
                                    value = {rarity = Rarity, tower = i, skin = k},
                                })
                            end
                        end
                    end
                end
            end
        end
    end
    return v3
end

return function(a1, a2, a3, a4, a5) -- Line: 131
    -- upvalues: CrateData (val), getWeightedEntries (val)
    local v1 = CrateData[a1]
    local v2 = "Invalid crate: " .. a1
    if not v1 then
        error(v2 or "Assertion failed", (1 / 0))
    end
    if not v1.Contents then
        error("Crate has no contents", (1 / 0))
    end
    v2 = getWeightedEntries(v1, a2, a3, a4, a5)
    if not (#v2 > 0) then
        error("You have no tower skins that can be unlocked from this crate.", (1 / 0))
    end
    local v3 = 0
    for k, v in pairs(v2) do
        v3 = v3 + v.weight
    end
    return {entries = v2, maxWeight = v3}
end
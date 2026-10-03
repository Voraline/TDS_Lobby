-- Script path: ReplicatedStorage.Shared.Data.SharedData.ConsumableCrateWeights
-- Decompile time: 2.37 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Asset = require(ReplicatedStorage.Shared.Modules.Asset)
local Content = require(ReplicatedStorage.Shared.Modules.Content)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local Consumables = Content("Consumables")
local u23 = {
    Enum.ConsumableRarity.Rare,
    Enum.ConsumableRarity.Epic,
    Enum.ConsumableRarity.Legendary,
}

local function assertEq(a1, a2) -- Line: 39 -- types: a2: string?
    if not a1 then
        return error(a2 or "Assertion failed", (1 / 0))
    end
    return a1
end

local function getWeightedEntries(a1) -- Line: 47 -- upvalues: Asset (val), Consumables (val) -- types: a1: table
    local v1
    local v2 = {}
    if a1.Consumables.Items then
        local Rarity, v3, v4
        for m, i5 in a1.Consumables.Items do
            v3 = Asset("Consumables", i5)
            if v3 then
                Rarity = v3.Rarity
                v4 = a1.Consumables.Rarities[Rarity]
                if v4 and v4 > 0 then
                    table.insert(v2, {weight = v4, value = {name = i5, rarity = Rarity}})
                end
            end
        end
        return v2
    end
    local v5 = nil
    local v6 = nil
    for i, j in a1.Consumables.Rarities, v5, v6 do
        for k, n in Consumables:GetChildren() do
            v1 = Asset("Consumables", n.Name)
            if v1 and v1.Rarity == i and j > 0 then
                table.insert(v2, {weight = j, value = {name = n.name, rarity = i}})
            end
        end
    end
    return v2
end

return function(a1, a2) -- Line: 102
    -- upvalues: Asset (val), getWeightedEntries (val), u23 (val), Enum (val)
    local weight
    local v1 = Asset("NewCrates", a1)
    local v2 = "Invalid crate: " .. a1
    if not v1 then
        error(v2 or "Assertion failed", (1 / 0))
    end
    if not v1.Consumables then
        error("Crate has no contents", (1 / 0))
    end
    v2 = getWeightedEntries(v1)
    if not (#v2 > 0) then
        error("You have no consumables that can be unlocked from this crate.", (1 / 0))
    end
    local v3 = 0
    local v4 = {}
    for i, j in v2 do
        if not table.find(v4, j.value.rarity) then
            table.insert(v4, j.value.rarity)
        end
    end
    local v5 = false
    for k, n in v4 do
        if not table.find(u23, n) then
            v5 = true
            break
        end
    end
    local v6 = a2
    for k2, v in pairs(v2) do
        weight = v.weight
        if v6 > 0 and table.find(u23, v.value.rarity) then
            if v5 or v.value.rarity == tostring(Enum.ConsumableRarity.Legendary) then
                weight = weight * (v6 + 1)
            end
        end
        v.weight = weight
        v3 = v3 + weight
    end
    return {entries = v2, maxWeight = v3}
end
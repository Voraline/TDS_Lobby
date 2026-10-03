-- Script path: ReplicatedStorage.Shared.Modules.SharedDailyRewards
-- Decompile time: 4.65 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local u10 = {}
local v1 = {}
v1[Enum.CrateItemRarity.Common] = (Color3.fromRGB(255, 255, 255))
v1[Enum.CrateItemRarity.Uncommon] = (Color3.fromRGB(85, 255, 127))
v1[Enum.CrateItemRarity.Rare] = (Color3.fromRGB(0, 170, 255))
v1[Enum.CrateItemRarity.Epic] = (Color3.fromRGB(170, 85, 255))
v1[Enum.CrateItemRarity.Legendary] = (Color3.fromRGB(255, 223, 0))
v1[Enum.CrateItemRarity.Mythic] = (Color3.fromRGB(255, 0, 255))
v1[Enum.CrateItemRarity.Exclusive] = (Color3.fromRGB(255, 0, 0))
u10.CrateItemRarityColors = v1
u10.SpinRewardSegments = {
    Enum.CrateItemRarity.Common,
    Enum.CrateItemRarity.Common,
    Enum.CrateItemRarity.Uncommon,
    Enum.CrateItemRarity.Uncommon,
    Enum.CrateItemRarity.Rare,
    Enum.CrateItemRarity.Epic,
    Enum.CrateItemRarity.Legendary,
    Enum.CrateItemRarity.Mythic,
}
u10.SpinRewardWeights = {
    [Enum.CrateItemRarity.Common] = 50,
    [Enum.CrateItemRarity.Uncommon] = 25,
    [Enum.CrateItemRarity.Rare] = 15,
    [Enum.CrateItemRarity.Epic] = 7.5,
    [Enum.CrateItemRarity.Legendary] = 2,
    [Enum.CrateItemRarity.Mythic] = 0.5,
    [Enum.CrateItemRarity.Exclusive] = 0,
}
u10.SpinRewardPool = {
    [Enum.CrateItemRarity.Common] = {
        {type = "Currency", value = {"Coins", 50}},
        {type = "Consumable", value = {"Grenade", 2}},
        {type = "Consumable", value = {"Flash Bang", 2}},
        {type = "Consumable", value = {"Barricade", 2}},
        {type = "Currency", value = {"Revive", 1}},
        {type = "Currency", value = {"Timescale", 1}},
    },
    [Enum.CrateItemRarity.Uncommon] = {
        {type = "Currency", value = {"Coins", 250}},
        {type = "Crate", value = {"Low Grade"}},
        {type = "Crate", value = {"Basic"}},
    },
    [Enum.CrateItemRarity.Rare] = {{type = "Crate", value = {"Mid Grade"}}, {type = "Consumable", value = {"Blizzard Bomb", 1}}},
    [Enum.CrateItemRarity.Epic] = {
        {type = "Crate", value = {"Premium"}},
        {type = "Currency", value = {"Timescale", 3}},
        {type = "Currency", value = {"Revive", 3}},
        {type = "Crate", value = {"High Grade"}},
    },
    [Enum.CrateItemRarity.Legendary] = {{type = "Consumable", value = {"Nuke", 1}}, {type = "Currency", value = {"Coins", 2500}}},
    [Enum.CrateItemRarity.Mythic] = {{type = "Crate", value = {"Deluxe"}}, {type = "Crate", value = {"High Grade", 4}}},
    [Enum.CrateItemRarity.Exclusive] = {},
}
u10.DAILY_REWARDS_AB = {
    SPIN = {
        {type = "Currency", value = {"Coins", 50}},
        {type = "Currency", value = {"Coins", 75}},
        {type = "Currency", value = {"Spin", 1}},
        {type = "Currency", value = {"Coins", 100}},
        {type = "Currency", value = {"Spin", 1}},
        {type = "Crate", value = {"Low Grade"}},
        {type = "Currency", value = {"Spin", 3}},
        {type = "Currency", value = {"Coins", 125}},
        {type = "Currency", value = {"Spin", 1}},
        {type = "Currency", value = {"Coins", 175}},
        {type = "Currency", value = {"Spin", 1}},
        {type = "Currency", value = {"Timescale", 1}},
        {type = "Crate", value = {"Mid Grade"}},
        {type = "Currency", value = {"Spin", 3}},
        {type = "Currency", value = {"Coins", 200}},
        {type = "Currency", value = {"Spin", 1}},
        {type = "Currency", value = {"Coins", 300}},
        {type = "Currency", value = {"Spin", 2}},
        {type = "Currency", value = {"Timescale", 2}},
        {type = "Crate", value = {"Mid Grade"}},
        {type = "Currency", value = {"Spin", 4}},
        {type = "Currency", value = {"Coins", 400}},
        {type = "Currency", value = {"Spin", 1}},
        {type = "Currency", value = {"Coins", 500}},
        {type = "Currency", value = {"Spin", 3}},
        {type = "Currency", value = {"Timescale", 3}},
        {type = "Crate", value = {"High Grade", 2}},
        {type = "Consumable", value = {"Nuke", 1}},
        {type = "Currency", value = {"Coins", 1000}},
        {type = "Currency", value = {"Spin", 10}},
    },
    BALANCED = {
        {type = "Currency", value = {"Coins", 50}},
        {type = "Currency", value = {"Coins", 75}},
        {type = "Currency", value = {"Coins", 100}},
        {type = "Currency", value = {"Coins", 125}},
        {type = "Currency", value = {"Spin", 1}},
        {type = "Crate", value = {"Low Grade"}},
        {type = "Currency", value = {"Spin", 3}},
        {type = "Currency", value = {"Coins", 125}},
        {type = "Currency", value = {"Coins", 150}},
        {type = "Currency", value = {"Coins", 175}},
        {type = "Currency", value = {"Spin", 1}},
        {type = "Currency", value = {"Timescale", 1}},
        {type = "Crate", value = {"Mid Grade"}},
        {type = "Crate", value = {"Premium"}},
        {type = "Currency", value = {"Coins", 200}},
        {type = "Currency", value = {"Coins", 250}},
        {type = "Currency", value = {"Coins", 300}},
        {type = "Currency", value = {"Spin", 2}},
        {type = "Currency", value = {"Timescale", 2}},
        {type = "Crate", value = {"Mid Grade"}},
        {type = "Crate", value = {"Premium"}},
        {type = "Currency", value = {"Coins", 400}},
        {type = "Currency", value = {"Coins", 450}},
        {type = "Currency", value = {"Coins", 500}},
        {type = "Currency", value = {"Spin", 3}},
        {type = "Currency", value = {"Timescale", 3}},
        {type = "Crate", value = {"High Grade", 2}},
        {type = "Consumable", value = {"Nuke", 1}},
        {type = "Currency", value = {"Coins", 1000}},
        {type = "Crate", value = {"Deluxe"}},
    },
    CONSUMABLES = {
        {type = "Currency", value = {"Coins", 50}},
        {type = "Currency", value = {"Coins", 75}},
        {type = "Consumable", value = {"AirStrike", 3}},
        {type = "Currency", value = {"Coins", 100}},
        {type = "Currency", value = {"Spin", 1}},
        {type = "Crate", value = {"Low Grade"}},
        {type = "Crate", value = {"Premium"}},
        {type = "Currency", value = {"Coins", 125}},
        {type = "Crate", value = {"Low Grade", 2}},
        {type = "Currency", value = {"Coins", 175}},
        {type = "Currency", value = {"Spin", 1}},
        {type = "Currency", value = {"Timescale", 1}},
        {type = "Crate", value = {"Mid Grade"}},
        {type = "Consumable", value = {"Blizzard Bomb", 1}},
        {type = "Currency", value = {"Coins", 200}},
        {type = "Currency", value = {"Spin", 1}},
        {type = "Currency", value = {"Coins", 300}},
        {type = "Currency", value = {"Spin", 2}},
        {type = "Currency", value = {"Timescale", 2}},
        {type = "Consumable", value = {"Blizzard Bomb", 2}},
        {type = "Crate", value = {"Premium"}},
        {type = "Currency", value = {"Coins", 400}},
        {type = "Currency", value = {"Spin", 1}},
        {type = "Currency", value = {"Coins", 500}},
        {type = "Currency", value = {"Spin", 3}},
        {type = "Currency", value = {"Timescale", 3}},
        {type = "Crate", value = {"High Grade", 2}},
        {type = "Consumable", value = {"Nuke", 1}},
        {type = "Currency", value = {"Coins", 1000}},
        {type = "Crate", value = {"High Grade", 5}},
    },
}
u10.DailyRewards = u10.DAILY_REWARDS_AB.BALANCED

function u10.GetDailyRewards(a1) -- Line: 527 -- upvalues: u10 (val) -- types: a1: table?
    if typeof(a1) == "table" and #a1 > 0 then
        return a1
    end
    return u10.DailyRewards
end

return u10
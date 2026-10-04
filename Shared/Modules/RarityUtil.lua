-- Script path: ReplicatedStorage.Shared.Modules.RarityUtil
-- Decompile time: 0.89 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local u10 = {}
u10[Enum.Rarity.Common] = (Color3.fromRGB(162, 162, 162))
u10[Enum.Rarity.Uncommon] = (Color3.fromRGB(85, 255, 127))
u10[Enum.Rarity.Rare] = (Color3.fromRGB(0, 170, 255))
u10[Enum.Rarity.Legendary] = (Color3.fromRGB(170, 85, 255))
u10[Enum.Rarity.Golden] = (Color3.fromRGB(255, 223, 0))
u10[Enum.Rarity.Mythic] = (Color3.fromRGB(255, 52, 255))
u10[Enum.Rarity.Ultimate] = (Color3.fromRGB(255, 67, 174))
u10[Enum.Rarity.Exclusive] = (Color3.fromRGB(255, 0, 0))
u10[Enum.Rarity.Event] = (Color3.fromRGB(255, 0, 0))
u10[Enum.Rarity.Developer] = (Color3.fromRGB(0, 255, 255))
return {
    getUniversalRarity = function(a1, a2) -- Line: 24 -- upvalues: Enum (val) -- types: a1: string, a2: string
        local v1 = nil
        local v2 = {
            skin = "SkinRarity",
            flair = "FlairRarity",
            sticker = "StickerRarity",
            crate = "CrateItemRarity",
            consumable = "ConsumableRarity",
        }
        if a1 ~= "tower" then
            if v2[a1] then
                v1 = Enum[v2[a1]].ToString(a2)
            end
            if not v1 then
                error((("Invalid rarity provided for type: %*"):format(a1)))
            end
            return Enum.Rarity[v1]
        end
        local v3 = {}
        v3[Enum.TowerCategory.Starter] = Enum.Rarity.Uncommon
        v3[Enum.TowerCategory.Intermediate] = Enum.Rarity.Common
        v3[Enum.TowerCategory.Advanced] = Enum.Rarity.Rare
        v3[Enum.TowerCategory.Hardcore] = Enum.Rarity.Legendary
        v3[Enum.TowerCategory.Exclusive] = Enum.Rarity.Exclusive
        v3[Enum.TowerCategory.Event] = Enum.Rarity.Golden
        return v3[a2]
    end,
    getRarityColor = function(a1) -- Line: 56 -- upvalues: u10 (val), Enum (val) -- types: a1: string
        return u10[a1] or u10[Enum.Rarity.Common]
    end,
}
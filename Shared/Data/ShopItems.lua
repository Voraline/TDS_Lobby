-- Script path: ReplicatedStorage.Shared.Data.ShopItems
-- Decompile time: 6.09 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Handlers = ReplicatedStorage.Shared.Modules.Asset.Handlers
local Content = require(ReplicatedStorage.Shared.Modules.Content)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local DailyPrice = require(ReplicatedStorage.Shared.Data.SharedData.DailyPrice)
local RarityUtil = require(ReplicatedStorage.Shared.Modules.RarityUtil)
local ShopCostUtils = require(ReplicatedStorage.Shared.Modules.ShopCostUtils)
require(ReplicatedStorage.Shared.Types.ShopTypes)
local NewCrates = require(Handlers.NewCrates)
local NewEmotes = require(Handlers.NewEmotes)
local Stickers = require(Handlers.Stickers)
local NewTags = require(Handlers.NewTags)
local Troops = require(Handlers.Troops)
local u55 = {}
local v1 = {}
v1[Enum.StickerRarity.Common] = {value = 200, currency = Enum.CurrencyType.Coins}
v1[Enum.StickerRarity.Uncommon] = {value = 400, currency = Enum.CurrencyType.Coins}
v1[Enum.StickerRarity.Rare] = {value = 800, currency = Enum.CurrencyType.Coins}
v1[Enum.StickerRarity.Legendary] = {value = 1500, currency = Enum.CurrencyType.Coins}
u55.sticker = v1
local u77 = {}

local function getSkinCost(a1, a2, a3) -- Line: 57
    -- upvalues: DailyPrice (val)
    local v1
    local v2 = {}
    for i, j in a3 do
        if j.Daily and j.Contents and j.Contents[a2] and table.find(j.Contents[a2], a1) then
            v1 = DailyPrice(a1, a2, i)
            if v1 then
                table.insert(v2, v1)
            end
        end
    end
    table.sort(v2, function(a1, a2) -- Line: 75
        if a1.Type ~= a2.Type then
            return (tonumber(a1.Type)) < tonumber(a2.Type)
        end
        return a1.Value < a2.Value
    end)
    return v2[1]
end

local function canPurchase(a1) -- Line: 86 -- upvalues: ShopCostUtils (val)
    local v1 = false
    if a1 ~= nil then
        v1 = not ShopCostUtils.isFreeCost(a1)
    end
    return v1
end

local function getPrimaryCost(a1) -- Line: 90 -- upvalues: ShopCostUtils (val)
    return ShopCostUtils.normalizeCosts(a1)[1]
end

;(function() -- Line: 95
    -- upvalues: u77 (ref), Content (val), Stickers (val), ShopCostUtils (val), u55 (val), RarityUtil (val)
    -- upvalues: NewTags (val), NewEmotes (val), NewCrates (val), Troops (val), getSkinCost (val)
    local Eligible_2, Eligible_3, Eligible_4, Eligible_5, Gamepass, Name, Name_2, Price, Price_4, Rarity, Rarity_2, v1, v2, v3, v4, v5, v6, v7, v8, v9
    u77 = {}
    local v10 = {}
    for i, j in Content("Sticker"):GetChildren() do
        if j:IsA("ModuleScript") then
            Name_2 = j.Name
            v7 = Stickers(Name_2)
            Eligible_5 = nil
            v9 = nil
            if v7.Price then
                Eligible_5 = v7.Price.Eligible
                v9 = ShopCostUtils.normalizeCost(v7.Price)
            elseif u55.sticker[v7.Rarity] then
                v9 = u55.sticker[v7.Rarity]
            end
            v1 = false
            if v9 ~= nil then
                v1 = not ShopCostUtils.isFreeCost(v9)
            end
            if v1 then
                table.insert(u77, {
                    type = "sticker",
                    name = Name_2,
                    rarity = RarityUtil.getUniversalRarity("sticker", v7.Rarity),
                    eligible = Eligible_5,
                    cost = v9,
                })
            end
        end
    end
    for k, n in Content("Nametag"):GetDescendants() do
        if n:IsA("ModuleScript") then
            v6 = NewTags(n.Name)
            if v6.Price then
                Eligible_4 = v6.Price.Eligible
                v8 = ShopCostUtils.normalizeCost(v6.Price)
                v9 = false
                if v8 ~= nil then
                    v9 = not ShopCostUtils.isFreeCost(v8)
                end
                if v9 then
                    table.insert(u77, {
                        type = "nametag",
                        name = n.Name,
                        rarity = RarityUtil.getUniversalRarity("skin", v6.Rarity),
                        eligible = Eligible_4,
                        cost = v8,
                    })
                end
            end
        end
    end
    for m, i5 in Content("Emote"):GetChildren() do
        v6 = NewEmotes(i5.Name)
        if v6 and v6.Price then
            Eligible_3 = v6.Price.Eligible
            v8 = ShopCostUtils.normalizeCost(v6.Price)
            v9 = false
            if v8 ~= nil then
                v9 = not ShopCostUtils.isFreeCost(v8)
            end
            if v9 then
                table.insert(u77, {
                    type = "emote",
                    name = i5.Name,
                    rarity = RarityUtil.getUniversalRarity("skin", v6.Rarity),
                    eligible = Eligible_3,
                    cost = v8,
                })
            end
        end
    end
    for i6, i7 in Content("Crate"):GetChildren() do
        Name = i7.Name
        v7 = NewCrates(Name)
        if v7.Daily then
            v10[Name] = v7
        end
        if v7.Price and not v7.DailyOnly then
            v8 = ShopCostUtils.normalizeCosts(v7.Price)[1]
            v9 = false
            if v8 ~= nil then
                v9 = not ShopCostUtils.isFreeCost(v8)
            end
            if v9 then
                v2 = {type = "crate", name = Name, category = v7.Category}
                Rarity_2 = v7.Rarity and RarityUtil.getUniversalRarity("skin", v7.Rarity)
                v2.rarity = Rarity_2
                v2.displayName = if not v7.DisplayName then nil else if v7.DisplayName == "" then nil else v7.DisplayName
                v2.description = v7.Description
                v2.icon = v7.Icon
                Price_4 = if type(v7.Price[1]) ~= "table" then v7.Price else v7.Price[1]
                v2.eligible = Price_4.Eligible
                v2.cost = v8
                table.insert(u77, v2)
            end
        end
    end
    for i8, i9 in Content("Tower"):GetChildren() do
        v6 = Troops(i9.Name)
        v7 = nil
        Price = v6.Properties.Price
        Gamepass = v6.Properties.Gamepass
        if Price then
            v7 = ShopCostUtils.normalizeCost(Price)
        end
        v1 = false
        if v7 ~= nil then
            v1 = not ShopCostUtils.isFreeCost(v7)
        end
        if v1 then
            v3 = {
                type = "tower",
                tower = i9.Name,
                rarity = RarityUtil.getUniversalRarity("tower", v6.Properties.Category),
            }
            v3.gamepassId = Gamepass and Gamepass.Id or nil
            v3.eligible = Price and Price.Eligible
            v3.cost = v7
            table.insert(u77, v3)
        end
        v2 = nil
        v3 = nil
        for i10, i11 in v6.Properties.SkinData, v2, v3 do
            Rarity = i11.Rarity
            Eligible_2 = nil
            v4 = nil
            if not i11.Price then
                v5 = getSkinCost(i9.Name, i10, v10)
                if v5 then
                    v4 = ShopCostUtils.normalizeCost(v5)
                end
            else
                Eligible_2 = i11.Price.Eligible
                v4 = ShopCostUtils.normalizeCost(i11.Price)
            end
            v5 = false
            if v4 ~= nil then
                v5 = not ShopCostUtils.isFreeCost(v4)
            end
            if v5 then
                table.insert(u77, {
                    type = "skin",
                    tower = i9.Name,
                    skin = i10,
                    rarity = RarityUtil.getUniversalRarity("skin", Rarity),
                    eligible = Eligible_2,
                    cost = v4,
                })
            end
        end
    end
end)()
return u77
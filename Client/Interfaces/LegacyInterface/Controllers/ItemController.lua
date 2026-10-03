-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.ItemController
-- Decompile time: 26.88 ms

local MarketplaceService = game:GetService("MarketplaceService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Asset = require(ReplicatedStorage.Shared.Modules.Asset)
local Content = require(ReplicatedStorage.Shared.Modules.Content)
local CrateData = require(ReplicatedStorage.Shared.Modules.CrateData)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local Icons = require(ReplicatedStorage.Shared.Data.Icons)
local LazyLoader = require(ReplicatedStorage.Shared.UI.LazyLoader)
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local Towers = Icons.Towers
local Nametag = Content("Nametag")
local Flair = Content("Flair")
local Assets = ReplicatedStorage:WaitForChild("Assets")
local Consumables = Content("Consumables")
local Sticker = Content("Sticker")
local Emotes = Assets:WaitForChild("Emotes")
local Totems = Assets:WaitForChild("Totems")
local Value = workspace:WaitForChild("Type").Value
local u82 = {}
u82[Enum.SkinRarity.Common] = (Color3.fromRGB(255, 255, 255))
u82[Enum.SkinRarity.Uncommon] = (Color3.fromRGB(85, 255, 127))
u82[Enum.SkinRarity.Rare] = (Color3.fromRGB(0, 170, 255))
u82[Enum.SkinRarity.Legendary] = (Color3.fromRGB(170, 85, 255))
u82[Enum.SkinRarity.Golden] = (Color3.fromRGB(255, 223, 0))
u82[Enum.SkinRarity.Ultimate] = (Color3.fromRGB(255, 67, 174))
u82[Enum.SkinRarity.Exclusive] = (Color3.fromRGB(255, 0, 0))
u82[Enum.SkinRarity.Event] = (Color3.fromRGB(255, 0, 0))
local u139 = {}
u139[Enum.ConsumableRarity.Common] = (Color3.fromRGB(255, 255, 255))
u139[Enum.ConsumableRarity.Uncommon] = (Color3.fromRGB(85, 255, 127))
u139[Enum.ConsumableRarity.Rare] = (Color3.fromRGB(0, 170, 255))
u139[Enum.ConsumableRarity.Epic] = (Color3.fromRGB(170, 85, 255))
u139[Enum.ConsumableRarity.Legendary] = (Color3.fromRGB(255, 223, 0))
u139[Enum.ConsumableRarity.Exclusive] = (Color3.fromRGB(255, 0, 0))
local u182 = {}
u182.Uncategorized = {Sort = 0, Color = Color3.fromRGB(255, 255, 255)}
u182.Starter = {Sort = 1, Color = Color3.fromRGB(255, 255, 255)}
u182.Intermediate = {Sort = 2, Color = Color3.fromRGB(255, 255, 255)}
u182.Advanced = {Sort = 3, Color = Color3.fromRGB(255, 255, 255)}
u182.Hardcore = {Sort = 4, Color = Color3.fromRGB(153, 77, 228)}
u182.Evolved = {Sort = 5, Color = Color3.fromRGB(0, 208, 212)}
u182.Exclusive = {Sort = 6, Color = Color3.fromRGB(225, 20, 20)}
u182.Consumables = {Sort = 1, Color = Color3.fromRGB(0, 170, 255)}
u182.Robux = {Sort = 2, Color = Color3.fromRGB(85, 255, 127)}
u182.Uncommon = {Sort = 1, Color = u139[Enum.ConsumableRarity.Uncommon]}
u182.Rare = {Sort = 2, Color = u139[Enum.ConsumableRarity.Rare]}
u182.Epic = {Sort = 3, Color = u139[Enum.ConsumableRarity.Epic]}
u182.Legendary = {Sort = 4, Color = u139[Enum.ConsumableRarity.Legendary]}
local u253 = {categories = {}, remoteCrates = {}}
u253.changed = Signal.new()
u253.__index = u253

function u253.init(a1, a2) -- Line: 128
    a1:_getInfo()
    a2()
end

function u253:_getInfo() -- Line: 135
    -- upvalues: Content (val), Asset (val), Towers (val), u82 (val), Enum (val), table (val), Emotes (val)
    -- upvalues: Sticker (val), Nametag (val), Flair (val), Totems (val), Consumables (val), u139 (val), Value (val)
    -- upvalues: u253 (val), CrateData (val)
    local Backup, Category, Contents, Contents_2, Daily, DailyOnly, Default, Icon, Name, Name_2, Price, Price_2, SkinData, Type, insert, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18
    local towers = self.categories.towers or {}
    self.categories.towers = towers
    local v19 = self
    for k, v in pairs(Content("Tower"):GetChildren()) do
        Name_2 = v.Name
        v17 = Asset("Troops", Name_2)
        v18 = Asset("Troops", Name_2, nil, "PVP")
        if v18 == v17 then
            v18 = nil
        end
        if v17 then
            v1 = Towers[Name_2] or {}
            v3 = {}
            v4 = {Skin = "Default", Rarity = "Common"}
            Default = v1.Default or v17.Properties.Preview.Icon
            v4.Icon = Default
            v4.RarityColor = u82[Enum.SkinRarity.Common]
            v3[1] = v4
            SkinData = v17.Properties.SkinData or {}
            for k2 in pairs(v17.Skins) do
                v9 = SkinData[k2] or {}
                if k2 ~= "Default" then
                    v10 = v9.Rarity or 0
                    v11 = Enum.SkinRarity.ToString(v10) or "Common"
                    insert = table.insert
                    v13 = {Skin = k2, DisplayName = v9.DisplayName}
                    Icon = v1[k2] or v9.Icon or v3[1].Icon
                    v13.Icon = Icon
                    v14 = u82[v10] or u82[Enum.SkinRarity.Common]
                    v13.RarityColor = v14
                    v13.Rarity = v11
                    v13.Creators = v9.Creators
                    v13.Price = v9.Price
                    insert(v3, v13)
                end
            end
            v2 = Enum.TowerCategory.ToString(v17.Properties.Category) or "Uncategorized"
            v5 = Name_2:lower()
            towers[v5] = {
                type = "tower",
                name = Name_2,
                category = v2,
                stats = v17.Stats,
                pvpStats = v18 and v18.Stats,
                skins = v3,
                info = v17.Properties,
            }
        end
    end
    local v20 = {}
    v19.categories.emotes = v20
    for k3, i in pairs(Emotes:GetChildren()) do
        v17 = Asset("NewEmotes", i.Name)
        if v17 then
            v18 = i.Name:lower()
            v20[v18] = {type = "emote", category = "Uncategorized", name = i.Name, info = v17}
        end
    end
    local v21 = {}
    v19.categories.stickers = v21
    for k4, j in pairs(Sticker:GetChildren()) do
        v18 = j.Name:lower()
        v21[v18] = {
            type = "sticker",
            category = "Uncategorized",
            name = j.Name,
            info = Asset("Stickers", j.Name),
        }
    end
    local v22 = {}
    v19.categories.tags = v22
    for k5, k6 in pairs(Nametag:GetDescendants()) do
        if k6:IsA("ModuleScript") then
            v1 = Asset("NewTags", k6.Name)
            if v1 then
                v2 = k6.Name:lower()
                v3 = {
                    type = "tag",
                    category = "Uncategorized",
                    name = k6.Name,
                    rarity = v1.Rarity,
                }
                v4 = u82[v1.Rarity] or u82[Enum.SkinRarity.Common]
                v3.rarityColor = v4
                v3.info = v1
                v22[v2] = v3
            end
        end
    end
    local v23 = {}
    v19.categories.flairs = v23
    for k7, n in pairs(Flair:GetDescendants()) do
        if n:IsA("ModuleScript") then
            v2 = Asset("Flairs", n.Name)
            if v2 then
                v3 = n.Name:lower()
                v4 = {
                    type = "flair",
                    category = "Uncategorized",
                    name = n.Name,
                    rarity = v2.Rarity,
                }
                v5 = u82[v2.Rarity] or u82[Enum.SkinRarity.Common]
                v4.rarityColor = v5
                v4.info = v2
                v23[v3] = v4
            end
        end
    end
    local v24 = {}
    v19.categories.charms = v24
    for k8, m in pairs(Totems:GetChildren()) do
        v3 = Asset("NewTotems", m.Name)
        if v3 then
            v4 = m.Name:lower()
            v24[v4] = {type = "charm", category = "Uncategorized", name = m.Name, info = v3}
        end
    end
    local v25 = {}
    v19.categories.consumables = v25
    for k9, i5 in pairs(Consumables:GetChildren()) do
        v4 = Asset("Consumables", i5.Name)
        if v4 then
            v5 = Enum.ConsumableRarity.ToString(v4.Rarity) or "Uncategorized"
            if v5 == "Common" then
                v5 = "Uncategorized"
            end
            v6 = i5.Name:lower()
            v7 = {type = "consumable", name = i5.Name, category = v5, rarity = v4.Rarity}
            v8 = u139[v4.Rarity] or u82[Enum.SkinRarity.Common]
            v7.rarityColor = v8
            v7.info = v4
            v25[v6] = v7
        end
    end
    if Value ~= "Lobby" then
        return
    end
    local remoteCrates = u253.remoteCrates
    v18 = {}
    v19.categories.crates = v18
    for k10, i6 in pairs((table.deepClone(CrateData))) do
        Name = i6.Name
        v8 = remoteCrates[Name]
        if not i6.Remote then
            Backup = i6.Backup
            i6.Daily = Backup.Daily
            i6.DailyOnly = Backup.DailyOnly
            i6.Price = Backup.Price
            i6.Weights = Backup.Weights
            for i7, i8 in Backup do
                i6[i7] = i8
            end
            if v8 then
                Contents = v8.Contents or i6.Contents
                i6.Contents = Contents
                Daily = v8.Daily or i6.Daily
                i6.Daily = Daily
                DailyOnly = if v8.DailyOnly == nil then i6.DailyOnly else v8.DailyOnly
                i6.DailyOnly = DailyOnly
                Price = if v8.Price ~= false then v8.Price or i6.Price else nil
                i6.Price = Price
            end
            Price_2 = i6.Price
            if Price_2 then
                Type = Enum.CurrencyType.ToString(Price_2.Type) or Price_2.Type
                Price_2.Type = Type
            end
            Category = i6.Category
            v11 = "Uncategorized"
            v12 = "skins"
            Contents_2 = i6.Contents or {}
            if Category ~= Enum.CrateCategory.Default then
                v11 = Enum.CrateCategory.ToString(Category)
            end
            if i6.Consumables then
                v12 = "consumables"
            end
            if v12 == "consumables" then
                Contents_2 = {
                    amount = i6.Consumables.Amount,
                    rarities = i6.Consumables.Rarities,
                    items = {},
                }
                if not i6.Consumables.Items then
                    v14 = nil
                    v15 = nil
                    for i9 in i6.Consumables.Rarities, v14, v15 do
                        for i10, i11 in v19.categories.consumables do
                            if i11.rarity == i9 then
                                table.insert(Contents_2.items, i11)
                            end
                        end
                    end
                else
                    for i12, i13 in i6.Consumables.Items do
                        v16 = v25[i13:lower()]
                        if v16 then
                            table.insert(Contents_2.items, v16)
                        end
                    end
                end
            end
            v18[(Name:lower())] = {
                type = "crate",
                name = Name,
                category = v11,
                contentType = v12,
                content = Contents_2,
                info = i6,
            }
        elseif v8 then
            Backup = i6.Backup
            i6.Daily = Backup.Daily
            i6.DailyOnly = Backup.DailyOnly
            i6.Price = Backup.Price
            i6.Weights = Backup.Weights
            for i14, i15 in Backup do
                i6[i14] = i15
            end
            if v8 then
                Contents = v8.Contents or i6.Contents
                i6.Contents = Contents
                Daily = v8.Daily or i6.Daily
                i6.Daily = Daily
                DailyOnly = if v8.DailyOnly == nil then i6.DailyOnly else v8.DailyOnly
                i6.DailyOnly = DailyOnly
                Price = if v8.Price ~= false then v8.Price or i6.Price else nil
                i6.Price = Price
            end
            Price_2 = i6.Price
            if Price_2 then
                Type = Enum.CurrencyType.ToString(Price_2.Type) or Price_2.Type
                Price_2.Type = Type
            end
            Category = i6.Category
            v11 = "Uncategorized"
            v12 = "skins"
            Contents_2 = i6.Contents or {}
            if Category ~= Enum.CrateCategory.Default then
                v11 = Enum.CrateCategory.ToString(Category)
            end
            if i6.Consumables then
                v12 = "consumables"
            end
            if v12 == "consumables" then
                Contents_2 = {
                    amount = i6.Consumables.Amount,
                    rarities = i6.Consumables.Rarities,
                    items = {},
                }
                if not i6.Consumables.Items then
                    v14 = nil
                    v15 = nil
                    for i16 in i6.Consumables.Rarities, v14, v15 do
                        for i17, i18 in v19.categories.consumables do
                            if i18.rarity == i16 then
                                table.insert(Contents_2.items, i18)
                            end
                        end
                    end
                else
                    for i19, i20 in i6.Consumables.Items do
                        v16 = v25[i20:lower()]
                        if v16 then
                            table.insert(Contents_2.items, v16)
                        end
                    end
                end
            end
            v18[(Name:lower())] = {
                type = "crate",
                name = Name,
                category = v11,
                contentType = v12,
                content = Contents_2,
                info = i6,
            }
        end
    end
    u253.changed:Fire()
end

function u253:category(a2) -- Line: 417
    return assert(self.categories[a2:lower()], "Category not found: " .. (a2:lower()))
end

function u253.listCategories(a1) -- Line: 422 -- upvalues: table (val)
    local v1 = {}
    for k in pairs(a1.categories) do
        table.insert(v1, k)
    end
    return v1
end

function u253.subcategorize(a1, a2) -- Line: 432 -- upvalues: table (val), u182 (val)
    local v1, v2
    local v3 = {}
    local v4 = {}
    for k, v in pairs((a1:category(a2))) do
        v1 = v3[v.category]
        if not v1 then
            v2 = u182[v.category] or {Sort = 999, Color = Color3.new(1, 1, 1)}
            v1 = {items = {v}, name = v.category, color = v2.Color, sort = v2.Sort}
            v3[v.category] = v1
            table.insert(v4, v1)
        else
            table.insert(v1.items, v)
        end
    end
    table.sort(v4, function(a1, a2) -- Line: 460
        return a1.sort < a2.sort
    end)
    return v4
end

function u253.getSkinChance(a1, a2, a3) -- Line: 468
    assert(a2.type == "skin", "Skin expected")
    assert(a3.type == "crate", "Crate expected")
    return 0
end

function u253:tower(a2) -- Line: 476
    local v1 = a2:lower()
    return assert(self:category("towers")[v1], "tower not found: " .. v1)
end

function u253.emote(a1, a2) -- Line: 485
    local v1 = a2:lower()
    return assert(a1:category("emotes")[v1], "emote not found: " .. v1)
end

function u253.sticker(a1, a2) -- Line: 491
    local v1 = a2:lower()
    return assert(a1:category("stickers")[v1], "sticker not found: " .. v1)
end

function u253.crate(a1, a2) -- Line: 497
    local v1 = a2:lower()
    return assert(a1:category("crates")[v1], "crate not found: " .. v1)
end

function u253.tag(a1, a2) -- Line: 503
    local v1 = a2:lower()
    return assert(a1:category("tags")[v1], "tag not found: " .. v1)
end

function u253.flair(a1, a2) -- Line: 509
    local v1 = a2:lower()
    return assert(a1:category("fairs")[v1], "flair not found: " .. v1)
end

function u253.totem(a1, a2) -- Line: 515
    local v1 = a2:lower()
    return assert(a1:category("totems")[v1], "totem not found: " .. v1)
end

function u253.consumable(a1, a2) -- Line: 521
    local v1 = a2:lower()
    return assert(a1:category("consumables")[v1], "consumable not found: " .. v1)
end

function u253.skin(a1, a2, a3) -- Line: 527
    local v1 = a1:tower((a2:lower()))
    assert(v1, "tower not found: " .. a2)
    local v2 = nil
    for k, v in pairs(v1.skins) do
        if (v.Skin:lower()) == a3:lower() then
            v2 = v
            break
        end
    end
    if not v2 then
        error("skin not found: " .. a3 .. " for tower: " .. a2)
    end
    return {
        type = "skin",
        category = "Uncategorized",
        name = a3,
        displayName = v2.DisplayName,
        tower = v1,
        info = v2,
    }
end

function u253.skins(a1, a2) -- Line: 554 -- upvalues: table (val)
    local v1 = a2:lower()
    local v2 = {}
    for k, v in pairs(a1:category("towers")) do
        for k2, i in pairs(v.skins) do
            if i.Skin:lower() == v1 then
                table.insert(v2, {
                    type = "skin",
                    category = "Uncategorized",
                    name = v1,
                    tower = v,
                    info = i,
                })
            end
        end
    end
    return v2
end

function u253.crates(a1) -- Line: 575
    return a1:category("crates")
end

function u253.setRemoteCrates(a1, a2) -- Line: 579 -- upvalues: table (val), u253 (val)
    if table.deepCompare(a1.remoteCrates, a2) then
        return
    end
    u253.remoteCrates = a2
    a1:_getInfo()
end

function u253.getCratesFromTower(a1, a2) -- Line: 589 -- upvalues: table (val)
    assert(a2.type == "tower", "item is not a tower")
    local v1 = {}
    for k, v in pairs(a1:category("crates")) do
        for k2, i in pairs(v.info.Contents) do
            if table.find(i, v2.name) then
                table.insert(v1, v)
                break
            end
        end
    end
    return v1
end

function u253.getCrateFromSkin(a1, a2) -- Line: 607 -- upvalues: table (val)
    local v1
    assert(a2.type == "skin", "item is not a skin")
    for k, v in pairs(a1:category("crates")) do
        if v.contentType == "skins" then
            v1 = v.info.Contents[a2.name]
            if v1 and table.find(v1, a2.tower.name) then
                return v
            end
        end
    end
end

local u278 = {}

function u253.getPurchaseType(a1, a2) -- Line: 629 -- upvalues: Enum (val), u278 (val), MarketplaceService (val)
    local info = a2.info
    if info and info.Price then
        local Type = info.Price.Type
        local v1 = Enum.CurrencyType.ToString(Type)
        if v1 then
            Type = v1
        end
        local Value = info.Price.Value
        if Type == "Robux" and info.Price.Id then
            local ProductInfo = u278[a2] or MarketplaceService:GetProductInfo(info.Price.Id, Enum.InfoType.Product)
            u278[a2] = ProductInfo
            Value = ProductInfo.PriceInRobux
        end
        return Type, Value, info.Price.Id
    end
end

function u253.isRobuxPurchase(a1, a2) -- Line: 652
    local v1, v2, v3 = a1:getPurchaseType(a2)
    return v1 == "Robux", v2, v3
end

function u253.getPrice(a1, a2) -- Line: 658
    local info = a2.info
    if info and info.Price then
        return info.Price.Value
    end
end

function u253.getPurchaseData(a1, a2) -- Line: 666
    local info = a2.info
    if not info then
        return
    end
    local Price = info.Price and info.Gamepass
    return info.Price, Price
end

function u253.getGamepassData(a1, a2) -- Line: 675
    local info = a2.info
    if info then
        return info.Gamepass
    end
end

function u253.getRank(a1, a2) -- Line: 683
    local info = a2.info
    if info and info.Rank then
        return info.Rank
    end
    return 0
end

function u253.getDescription(a1, a2) -- Line: 692
    local info = a2.info
    if not info then
        return
    end
    return info.Description or ""
end

function u253.getStats(a1, a2) -- Line: 701
    return assert(a2.stats, "getStats: passed item has no stats")
end

function u253.getSkins(a1, a2) -- Line: 706
    return assert(a2.skins, "getSkins: passed item has no skins")
end

return LazyLoader(u253)
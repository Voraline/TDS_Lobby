-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.ShopRevamp.Catalog.Items
-- Decompile time: 14.07 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local ShopMarketplace = require(ReplicatedStorage.Client.Interfaces.Lobby.Utility.ShopMarketplace)
local ShopSortUtils = require(ReplicatedStorage.Shared.Modules.ShopSortUtils)
local TowerDisplayName = require(ReplicatedStorage.Shared.Modules.TowerDisplayName)
local Constants = require(script.Parent.Constants)
local LayoutUtils = require(script.Parent.LayoutUtils)
require(script.Parent.Types)

local function getSkinTowerDisplayName(a1, a2) -- Line: 14 -- types: a2: function
    if a1 and a1.type == "skin" and type(a1.tower) == "string" then
        return a2(a1.tower, nil)
    end
    return nil
end

local u43 = {}

function u43.itemOwned(a1, a2) -- Line: 27
    if a1 and a2 then
        if a2.type == "tower" then
            local tower = a2.tower or a2.name
            local v1 = false
            if tower ~= nil then
                local towers = a1.towers or {}
                v1 = towers[tower] ~= nil
            end
            return v1
        end
        if a2.type == "skin" then
            local find = table.find
            local skins = a1.skins or {}
            local v2 = skins[a2.tower] or {}
            return find(v2, a2.skin) ~= nil
        end
        if a2.type == "modifier" then
            local find_2 = table.find
            local modifiers = a1.modifiers or {}
            return find_2(modifiers, a2.name) ~= nil
        end
        if a2.type == "consumable" then
            local consumables = a1.consumables or {}
            return 0 < (consumables[a2.name] or 0)
        end
        if a2.type == "crate" then
            return false
        end
        if a2.type == "sticker" then
            local find_3 = table.find
            local stickers = a1.stickers or {}
            return find_3(stickers, a2.name) ~= nil
        end
        if a2.type == "emote" then
            local find_4 = table.find
            local emotes = a1.emotes or {}
            return find_4(emotes, a2.name) ~= nil
        end
        if a2.type == "flair" then
            local find_5 = table.find
            local flairs = a1.flairs or {}
            return find_5(flairs, a2.name) ~= nil
        end
        if a2.type ~= "nametag" then
            return false
        end
        local find_6 = table.find
        local nametags = a1.nametags or {}
        return find_6(nametags, a2.name) ~= nil
    end
    return false
end

function u43.entryOwned(a1, a2, a3, a4) -- Line: 57 -- upvalues: u43 (val)
    local props = a3.component.props or {}
    local ownershipAttribute = props.ownershipAttribute
    local v1 = u43.itemOwned(a1, a2)
    if not v1 then
        v1 = u43.itemOwned(a1, props.ownershipItem)
        if not v1 then
            v1 = false
            if type(ownershipAttribute) == "string" then
                v1 = a4 and a4[ownershipAttribute] == true
            end
        end
    end
    return v1
end

local function isPlaceholderItem(a1) -- Line: 70
    if type(a1) == "table" and a1.type ~= nil then
        local v1 = false
        if a1.cost == nil then
            v1 = false
            if a1.costs == nil then
                v1 = false
                if a1.gamepassId == nil then
                    v1 = false
                    if a1.rarity == nil then
                        v1 = false
                        if a1.amount == nil then
                            v1 = a1.skin == nil
                        end
                    end
                end
            end
        end
        return v1
    end
    return false
end

local function hasPlaceholderIdentity(a1) -- Line: 83
    local v1
    if type(a1) ~= "table" then
        return false
    end
    if a1.type == "tower" then
        v1 = true
        if a1.tower == nil then
            v1 = a1.name ~= nil
        end
        return v1
    end
    if a1.type == "skin" then
        v1 = false
        if a1.tower ~= nil then
            v1 = a1.skin ~= nil
        end
        return v1
    end
    v1 = true
    if a1.name == nil then
        v1 = a1.stat ~= nil
    end
    return v1
end

local function matchesPlaceholderItem(a1, a2) -- Line: 97
    if type(a1) == "table" and type(a2) == "table" and a1.type == a2.type then
        local v1
        if a2.type == "tower" then
            local tower = a2.tower or a2.name
            v1 = false
            if tower ~= nil then
                v1 = a1.tower == tower
            end
            return v1
        end
        if a2.type ~= "skin" then
            local name = a2.name or a2.stat
            v1 = false
            if name ~= nil then
                v1 = true
                if a1.name ~= name then
                    v1 = a1.stat == name
                end
            end
            return v1
        end
        local v2 = false
        if a2.tower ~= nil then
            v2 = false
            if a2.skin ~= nil then
                v2 = false
                if a1.tower == a2.tower then
                    v2 = a1.skin == a2.skin
                end
            end
        end
        return v2
    end
    return false
end

local function findPlaceholderItem(a1, a2) -- Line: 116 -- upvalues: matchesPlaceholderItem (val)
    if type(a1) ~= "table" then
        return nil
    end
    for i, j in a1 do
        if matchesPlaceholderItem(j, a2) then
            return j, i
        end
    end
    return nil
end

local function createPlaceholderFallbackItem(a1, a2, a3) -- Line: 130 -- types: a3: string?
    if type(a1) == "table" and type(a2) == "table" then
        local v1
        if type(a1) ~= "table" then
            v1 = false
        elseif a1.type == "tower" then
            v1 = true
            if a1.tower == nil then
                v1 = a1.name ~= nil
            end
        elseif a1.type ~= "skin" then
            v1 = true
            if a1.name == nil then
                v1 = a1.stat ~= nil
            end
        else
            v1 = false
            if a1.tower ~= nil then
                v1 = a1.skin ~= nil
            end
        end
        if v1 then
            v1 = false
            if a1.type == "tower" then
                v1 = type(a2.gamepassId) == "number"
            end
            if a3 ~= "FeaturedHero" and not v1 then
                return nil
            end
            local v2 = table.clone(a1)
            if a1.type == "tower" then
                local tower = a1.tower or a1.name
                if type(tower) ~= "string" then
                    return nil
                end
                v2.tower = tower
            end
            if type(a2.gamepassId) == "number" then
                v2.gamepassId = a2.gamepassId
            end
            v2.giftId = a2.giftId
            v2.__shopTemplateFallback = true
            return v2
        end
    end
    return nil
end

function u43.resolve(a1, a2) -- Line: 159 -- upvalues: matchesPlaceholderItem (val), createPlaceholderFallbackItem (val)
    local v1, v2
    local props = a2.component.props or {}
    local item = props.item
    if not a1 then
        return item
    end
    if type(item) ~= "table" then
        v1 = false
    elseif item.type ~= nil then
        v1 = false
        if item.cost == nil then
            v1 = false
            if item.costs == nil then
                v1 = false
                if item.gamepassId == nil then
                    v1 = false
                    if item.rarity == nil then
                        v1 = false
                        if item.amount == nil then
                            v1 = item.skin == nil
                        end
                    end
                end
            end
        end
    else
        v1 = false
    end
    if v1 then
        local v3
        if type(a1) == "table" then
            v3 = a1
            v2 = nil
            for i, j in v3, v2 do
                if matchesPlaceholderItem(j, item) then
                    v1 = j
                    if v1 then
                        return v1
                    end
                    if type(item) ~= "table" then
                        v3 = false
                    elseif item.type == "tower" then
                        v3 = true
                        if item.tower == nil then
                            v3 = item.name ~= nil
                        end
                    elseif item.type ~= "skin" then
                        v3 = true
                        if item.name == nil then
                            v3 = item.stat ~= nil
                        end
                    else
                        v3 = false
                        if item.tower ~= nil then
                            v3 = item.skin ~= nil
                        end
                    end
                    if v3 then
                        return (createPlaceholderFallbackItem(item, props, a2.component.type))
                    end
                    v1 = a1[a2.dataKey] or a1[a2.id] or a1[a2.id:lower()]
                    if v1 then
                        return v1
                    end
                    if type(item) ~= "table" then
                        v2 = false
                    elseif item.type ~= nil then
                        v2 = false
                        if item.cost == nil then
                            v2 = false
                            if item.costs == nil then
                                v2 = false
                                if item.gamepassId == nil then
                                    v2 = false
                                    if item.rarity == nil then
                                        v2 = false
                                        if item.amount == nil then
                                            v2 = item.skin == nil
                                        end
                                    end
                                end
                            end
                        end
                    else
                        v2 = false
                    end
                    if v2 then
                        return (createPlaceholderFallbackItem(item, props, a2.component.type))
                    end
                    return item
                end
            end
        end
        v1 = nil
        if v1 then
            return v1
        end
        if type(item) ~= "table" then
            v3 = false
        elseif item.type == "tower" then
            v3 = true
            if item.tower == nil then
                v3 = item.name ~= nil
            end
        elseif item.type ~= "skin" then
            v3 = true
            if item.name == nil then
                v3 = item.stat ~= nil
            end
        else
            v3 = false
            if item.tower ~= nil then
                v3 = item.skin ~= nil
            end
        end
        if v3 then
            return (createPlaceholderFallbackItem(item, props, a2.component.type))
        end
    end
    v1 = a1[a2.dataKey] or a1[a2.id] or a1[a2.id:lower()]
    if v1 then
        return v1
    end
    if type(item) ~= "table" then
        v2 = false
    elseif item.type ~= nil then
        v2 = false
        if item.cost == nil then
            v2 = false
            if item.costs == nil then
                v2 = false
                if item.gamepassId == nil then
                    v2 = false
                    if item.rarity == nil then
                        v2 = false
                        if item.amount == nil then
                            v2 = item.skin == nil
                        end
                    end
                end
            end
        end
    else
        v2 = false
    end
    if v2 then
        return (createPlaceholderFallbackItem(item, props, a2.component.type))
    end
    return item
end

function u43.resolveKey(a1, a2) -- Line: 188 -- upvalues: matchesPlaceholderItem (val)
    local v1
    local props = a2.component.props or {}
    local item = props.item
    if type(item) ~= "table" then
        v1 = false
    elseif item.type ~= nil then
        v1 = false
        if item.cost == nil then
            v1 = false
            if item.costs == nil then
                v1 = false
                if item.gamepassId == nil then
                    v1 = false
                    if item.rarity == nil then
                        v1 = false
                        if item.amount == nil then
                            v1 = item.skin == nil
                        end
                    end
                end
            end
        end
    else
        v1 = false
    end
    if v1 then
        local v2
        if type(a1) == "table" then
            for i, j in a1 do
                if matchesPlaceholderItem(j, item) then
                    v2 = i
                    if j and type(v2) == "string" then
                        return v2
                    end
                    return a2.dataKey
                end
            end
        end
        v2 = nil
        if nil then
            return v2
        end
    end
    return a2.dataKey
end

local function shouldRenderEntry(a1, a2, a3) -- Line: 202 -- upvalues: u43 (val)
    if a2.component.type ~= "FeaturedHero" and a2.component.type ~= "FeaturedSquare" then
        local v1
        if a1 and a1.type == "tower" and u43.itemOwned(a3, a1) then
            return false
        end
        if a1 then
            return true
        end
        local props = a2.component.props or {}
        local item = props.item
        if type(item) ~= "table" then
            v1 = false
        elseif item.type ~= nil then
            v1 = false
            if item.cost == nil then
                v1 = false
                if item.costs == nil then
                    v1 = false
                    if item.gamepassId == nil then
                        v1 = false
                        if item.rarity == nil then
                            v1 = false
                            if item.amount == nil then
                                v1 = item.skin == nil
                            end
                        end
                    end
                end
            end
        else
            v1 = false
        end
        return not v1
    end
    return a1 ~= nil
end

local function isEntryForSale(a1, a2, a3) -- Line: 219 -- upvalues: ShopMarketplace (val)
    if a2.component.type == "FeaturedHero" then
        return true
    end
    return ShopMarketplace.isGamepassForSale(a2.component.props or {}, a1, a3)
end

function u43.filterRenderable(a1, a2) -- Line: 228
    -- upvalues: u43 (val), shouldRenderEntry (val), ShopMarketplace (val)
    local marketplaceData, v1
    local v2 = {}
    local v3 = nil
    local v4 = nil
    local v5 = a2
    for i, j in a1, v3, v4 do
        v1 = u43.resolve(v5.items, j)
        if shouldRenderEntry(v1, j, v5.inventory) then
            marketplaceData = v5.marketplaceData
            if if j.component.type ~= "FeaturedHero" then ShopMarketplace.isGamepassForSale(j.component.props or {}, v1, marketplaceData) else true then
                table.insert(v2, j)
            end
        end
    end
    return v2
end

function u43.getName(a1, a2) -- Line: 247 -- upvalues: TowerDisplayName (val)
    local props = a2.props or {}
    if a1 then
        if a1.type == "skin" and a1.skin then
            return a1.skin
        end
        if a1.type == "tower" and a1.tower then
            return TowerDisplayName.fromAsset(a1.tower, nil)
        end
        if a1.type == "crate" and a1.displayName and a1.displayName ~= "" then
            return a1.displayName
        end
        if a1.name then
            return a1.name
        end
    end
    if props.name then
        return props.name
    end
    if a1 and a1.stat then
        return a1.stat
    end
    return props.title or "Product"
end

function u43.getSubText(a1) -- Line: 269 -- upvalues: TowerDisplayName (val), LayoutUtils (val), Constants (val)
    if not a1 then
        return ""
    end
    if a1.type == "skin" and a1.tower then
        local fromAsset = TowerDisplayName.fromAsset
        return (if not a1 or a1.type ~= "skin" then nil else if type(a1.tower) == "string" then fromAsset(a1.tower, nil) else nil) or a1.tower
    end
    if a1.type == "tower" then
        local v1 = LayoutUtils.getTowerCategory(a1)
        return v1 and LayoutUtils.getTowerCategoryName(v1) or ""
    end
    local rarity = a1.rarity
    if rarity == nil then
        return ""
    end
    return Constants.RARITY_NAMES[tostring(rarity)] or tostring(rarity)
end

function u43.getTowerEntriesByCategory(a1, a2) -- Line: 287
    -- upvalues: u43 (val), shouldRenderEntry (val), ShopMarketplace (val), LayoutUtils (val), ShopSortUtils (val)
    local marketplaceData, v1, v2, v3
    local v4 = {}
    local v5 = nil
    local v6 = nil
    for i, j in a1, v5, v6 do
        v2 = u43.resolve(a2.items, j)
        if shouldRenderEntry(v2, j, a2.inventory) then
            marketplaceData = a2.marketplaceData
            v3 = if j.component.type ~= "FeaturedHero" then ShopMarketplace.isGamepassForSale(j.component.props or {}, v2, marketplaceData) else true
            if v3 then
                v3 = LayoutUtils.getTowerCategory(v2)
                if v3 then
                    v1 = v4[v3] or {}
                    v4[v3] = v1
                    table.insert(v4[v3], j)
                end
            end
        end
    end
    for k, n in v4 do
        table.sort(n, function(a1, a2_2) -- Line: 310 -- upvalues: ShopSortUtils (upval), u43 (upval), a2 (val)
            return ShopSortUtils.compareItems(u43.resolve(a2.items, a1), u43.resolve(a2.items, a2_2))
        end)
    end
    return v4
end

function u43.getCrateCategory(a1) -- Line: 321 -- upvalues: Enum (val)
    if a1 and a1.type == "crate" then
        local category = a1.category
        if category == Enum.CrateCategory.Event then
            return Enum.CrateCategory.Event
        end
        if type(category) ~= "string" then
            if category == Enum.CrateCategory.Robux then
                return Enum.CrateCategory.Robux
            end
            if category == Enum.CrateCategory.Consumables then
                return Enum.CrateCategory.Consumables
            end
            return Enum.CrateCategory.Default
        end
        local v1 = category:lower()
        if v1 ~= "event" and v1 ~= "holiday" and v1 ~= "seasonal" then
            if category == Enum.CrateCategory.Robux then
                return Enum.CrateCategory.Robux
            end
            if category == Enum.CrateCategory.Consumables then
                return Enum.CrateCategory.Consumables
            end
            return Enum.CrateCategory.Default
        end
        return Enum.CrateCategory.Event
    end
    return nil
end

function u43.getCrateCategoryName(a1) -- Line: 353 -- upvalues: Enum (val) -- types: a1: number
    return Enum.CrateCategory.ToString(a1) or tostring(a1)
end

function u43.getCrateCategoryOrder(a1, a2) -- Line: 357
    -- upvalues: u43 (val), Constants (val), ShopSortUtils (val)
    local v1
    local u2 = nil
    for i, j in a1 do
        v1 = u43.resolve(a2.items, j)
        if v1 and v1.type == "crate" then
            u2 = tonumber(v1.personalizationPlayerPosition)
            if u2 ~= nil then
                break
            end
        end
    end
    local v2 = table.clone(Constants.CRATE_CATEGORY_ORDER)
    table.sort(v2, function(a1, a2) -- Line: 373 -- upvalues: ShopSortUtils (upval), u2 (ref)
        local v1 = ShopSortUtils.getCrateCategoryPriority(a1, u2)
        local v2 = ShopSortUtils.getCrateCategoryPriority(a2, u2)
        if v1 ~= v2 then
            return v1 < v2
        end
        return a1 < a2
    end)
    return v2
end

function u43.getCrateEntriesByCategory(a1, a2) -- Line: 385
    -- upvalues: u43 (val), shouldRenderEntry (val), ShopMarketplace (val), ShopSortUtils (val)
    local marketplaceData, v1, v2, v3
    local v4 = {}
    local v5 = nil
    local v6 = nil
    for i, j in a1, v5, v6 do
        v2 = u43.resolve(a2.items, j)
        if shouldRenderEntry(v2, j, a2.inventory) then
            marketplaceData = a2.marketplaceData
            v3 = if j.component.type ~= "FeaturedHero" then ShopMarketplace.isGamepassForSale(j.component.props or {}, v2, marketplaceData) else true
            if v3 then
                v3 = u43.getCrateCategory(v2)
                if v3 then
                    v1 = v4[v3] or {}
                    v4[v3] = v1
                    table.insert(v4[v3], j)
                end
            end
        end
    end
    for k, n in v4 do
        table.sort(n, function(a1, a2_2) -- Line: 408 -- upvalues: ShopSortUtils (upval), u43 (upval), a2 (val)
            return ShopSortUtils.compareItems(u43.resolve(a2.items, a1), u43.resolve(a2.items, a2_2))
        end)
    end
    return v4
end

function u43.hasAvailableTowerProducts(a1, a2, a3) -- Line: 419
    -- upvalues: LayoutUtils (val), u43 (val), shouldRenderEntry (val)
    local v1
    for i, j in (LayoutUtils.collectEntries(a1.components, a1.key, LayoutUtils.formatSectionId(a1.key), {})) do
        v1 = u43.resolve(a2, j)
        if v1 and v1.type == "tower" and shouldRenderEntry(v1, j, a3) then
            return true
        end
    end
    return false
end

return u43
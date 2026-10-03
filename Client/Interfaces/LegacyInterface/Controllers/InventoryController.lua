-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.InventoryController
-- Decompile time: 9.86 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Cache = require(ReplicatedStorage.Shared.UI.Cache)
local Charm = require(ReplicatedStorage.Packages.Charm)
local InventoryStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.InventoryStore)
local ItemController = require(script.Parent.ItemController)
local LazyLoader = require(ReplicatedStorage.Shared.UI.LazyLoader)
local Network = require(ReplicatedStorage.Shared.UI.Network)
local PlayerStatsStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.PlayerStatsStore)
local Sound = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Sound)
local StickerController = require(ReplicatedStorage.Client.Controllers.Shared.StickerController)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
local u68 = RunService:IsRunning()
local u69 = nil
local u70 = nil
local v1 = {}
v1.__index = v1
local Inventory = Network.Channel("Inventory")

local function includes(a1, a2) -- Line: 26
    for k, v in pairs(a1) do
        if v == a2 then
            return true
        end
    end
    return false
end

local function subscribeToCache(a1, a2) -- Line: 35 -- upvalues: Cache (val) -- types: a1: string, a2: function
    local v1 = Cache(a1)
    v1.Updated:Connect(a2)
    return v1:Get():andThen(a2)
end

local function getFusion() -- Line: 41 -- upvalues: ReplicatedStorage (val)
    return require(ReplicatedStorage.Shared.UI.Fusion)
end

local function getLegacyInventoryVersion() -- Line: 45
    -- upvalues: u69 (ref), ReplicatedStorage (val), Charm (val), InventoryStore (val)
    if not u69 then
        u69 = require(ReplicatedStorage.Shared.UI.Fusion).Value(0)
        Charm.listen(InventoryStore.getState, function() -- Line: 50 -- upvalues: u69 (upval)
            u69:set((u69:get(false)) + 1)
        end)
    end
    return u69
end

function v1:init(a2) -- Line: 58
    self:_getInfo(a2)
end

function v1._getInfo(a1, a2) -- Line: 63
    -- upvalues: ItemController (val), u68 (val), InventoryStore (val), Cache (val), TypedPromise (val)
    local v1, v2
    ItemController:init()
    if not u68 then
        a2()
        return
    end
    local v3 = {
        ["Equipped.Totem"] = function(a1) -- Line: 72 -- upvalues: InventoryStore (upval)
            InventoryStore.setEquippedTotem(a1)
        end,
        ["Equipped.Troops"] = function(a1) -- Line: 75 -- upvalues: InventoryStore (upval)
            InventoryStore.setHotbar(a1)
        end,
        ["Equipped.PVPTroops"] = function(a1) -- Line: 78 -- upvalues: InventoryStore (upval)
            InventoryStore.setPvPHotbar(a1)
        end,
        ["Equipped.PVPConsumables"] = function(a1) -- Line: 81 -- upvalues: InventoryStore (upval)
            InventoryStore.setEquippedPVPConsumables(a1)
        end,
        ["Equipped.Emotes"] = function(a1) -- Line: 84 -- upvalues: InventoryStore (upval)
            InventoryStore.setEquippedEmotes(a1)
        end,
        ["Equipped.Stickers"] = function(a1) -- Line: 87 -- upvalues: InventoryStore (upval)
            InventoryStore.setEquippedStickers(a1)
        end,
        ["Equipped.Nametag"] = function(a1) -- Line: 90 -- upvalues: InventoryStore (upval)
            InventoryStore.setEquippedTag(a1)
        end,
        ["Equipped.Flair"] = function(a1) -- Line: 93 -- upvalues: InventoryStore (upval)
            InventoryStore.setEquippedFlair(a1)
        end,
        ["Equipped.Consumables"] = function(a1) -- Line: 96 -- upvalues: InventoryStore (upval)
            InventoryStore.setEquippedConsumables(a1)
        end,
        ["Inventory.Skins"] = function(a1) -- Line: 99 -- upvalues: InventoryStore (upval)
            InventoryStore.setSkins(a1)
        end,
        ["Inventory.Totems"] = function(a1) -- Line: 102 -- upvalues: InventoryStore (upval)
            InventoryStore.setTotems(a1)
        end,
        ["Inventory.Crates"] = function(a1) -- Line: 105 -- upvalues: InventoryStore (upval)
            InventoryStore.setCrates(a1)
        end,
        ["Inventory.Troops"] = function(a1) -- Line: 108 -- upvalues: InventoryStore (upval)
            local v1 = {}
            for k, v in pairs(a1) do
                table.insert(v1, {type = "tower", name = k, skin = v.Skin, golden = v.GoldenPerks})
            end
            InventoryStore.setItems(v1)
        end,
        ["Inventory.Emotes"] = function(a1) -- Line: 123 -- upvalues: InventoryStore (upval)
            InventoryStore.setEmotes(a1)
        end,
        ["Inventory.Stickers"] = function(a1) -- Line: 126 -- upvalues: InventoryStore (upval)
            InventoryStore.setStickers(a1)
        end,
        ["Inventory.Nametags"] = function(a1) -- Line: 129 -- upvalues: InventoryStore (upval)
            InventoryStore.setTags(a1)
        end,
        ["Inventory.Flairs"] = function(a1) -- Line: 132 -- upvalues: InventoryStore (upval)
            InventoryStore.setFlairs(a1)
        end,
        ["Inventory.Consumables"] = function(a1) -- Line: 135 -- upvalues: InventoryStore (upval)
            InventoryStore.setConsumableCounts(a1)
        end,
    }
    local v4 = {"Inventory", "Equipped"}
    local v5 = nil
    local v6 = nil
    for i, j in v4, v5, v6 do
        v2 = {}
        for k, n in v3 do
            if string.match(k, (("^%*"):format(k))) then
                v1 = Cache(k)
                v1.Updated:Connect(n)
                table.insert(v2, (((v1:Get():andThen(n)):timeout(60)):catch(function(a1) -- Line: 148 -- upvalues: k (val)
                    warn(("Failed to load %* data:"):format(k), a1)
                end)))
            end
        end
        TypedPromise.all(v2):await()
    end
    a2()
end

function v1.getItems(a1) -- Line: 163 -- upvalues: InventoryStore (val)
    return InventoryStore.getItems()
end

function v1.getPVPMode(a1) -- Line: 168 -- upvalues: InventoryStore (val)
    return InventoryStore.getPVPMode()
end

function v1.getSkins(a1) -- Line: 173 -- upvalues: InventoryStore (val)
    return InventoryStore.getSkins()
end

function v1.getEmotes(a1) -- Line: 178 -- upvalues: InventoryStore (val)
    return InventoryStore.getEmotes()
end

function v1.getStickers(a1) -- Line: 183 -- upvalues: InventoryStore (val)
    return InventoryStore.getStickers()
end

function v1.getCrates(a1) -- Line: 188 -- upvalues: InventoryStore (val)
    return InventoryStore.getCrates()
end

function v1.getHotbar(a1) -- Line: 193 -- upvalues: InventoryStore (val)
    return InventoryStore.getHotbar()
end

function v1.getPvPHotbar(a1) -- Line: 198 -- upvalues: InventoryStore (val)
    return InventoryStore.getPvPHotbar()
end

function v1.getTotems(a1) -- Line: 203 -- upvalues: InventoryStore (val)
    return InventoryStore.getTotems()
end

function v1.getTags(a1) -- Line: 208 -- upvalues: InventoryStore (val)
    return InventoryStore.getTags()
end

function v1.getFlairs(a1) -- Line: 213 -- upvalues: InventoryStore (val)
    return InventoryStore.getFlairs()
end

function v1.getEquippedFlair(a1) -- Line: 217 -- upvalues: InventoryStore (val)
    return InventoryStore.getEquippedFlair()
end

function v1.getConsumables(a1) -- Line: 222 -- upvalues: InventoryStore (val)
    return InventoryStore.getConsumables()
end

function v1.getConsumablesHotbar(a1) -- Line: 227 -- upvalues: InventoryStore (val)
    return InventoryStore.getConsumablesHotbar()
end

function v1.getPvPConsumablesHotbar(a1) -- Line: 232 -- upvalues: InventoryStore (val)
    return InventoryStore.getPvPConsumablesHotbar()
end

function v1.updatePVPMode(a1, a2) -- Line: 237 -- upvalues: InventoryStore (val)
    InventoryStore.setPVPMode(a2)
end

function v1.showGems(a1) -- Line: 242
    -- upvalues: u70 (ref), ReplicatedStorage (val), PlayerStatsStore (val), Charm (val)
    if not u70 then
        u70 = require(ReplicatedStorage.Shared.UI.Fusion).Value(PlayerStatsStore.getShowGems())
        Charm.listen(PlayerStatsStore.getShowGems, function(a1) -- Line: 245 -- upvalues: u70 (upval)
            u70:set(a1)
        end)
    end
    return u70
end

function v1.isSkinEquipped(a1, a2) -- Line: 254
    local name = a2.tower.name
    for k, v in pairs(a1:getItems()) do
        if v.name == name and v.type == "tower" then
            return v.skin == a2.name
        end
    end
    return false
end

function v1.isEquippable(a1, a2) -- Line: 267
    return table.find({"tower", "skin", "charm", "tag", "consumable", "sticker", "flair"}, a2.type) ~= nil
end

function v1.equip(a1, a2, a3) -- Line: 275
    -- upvalues: u68 (val), StickerController (val), Inventory (val), Sound (val)
    local v1 = true
    if a2.type ~= "consumable" then
        v1 = a1:owns(a2)
    end
    if not v1 then
        return false, "You don't own this item!"
    end
    if not a1:isEquippable(a2) then
        return false, "This item is not equippable!"
    end
    if not u68 then
        if a2.type == "tower" then
            a1:_addToHotbar(a2, a3)
        end
        return true
    end
    local type = if a2.type ~= "charm" then a2.type else "totem"
    if type == "tower" then
        type = if not a3 then "tower" else "pvptower"
    elseif type == "consumable" then
        type = if not a3 then "consumable" else "pvpconsumable"
    end
    if type == "sticker" then
        return StickerController.equipSticker(a2)
    end
    local v2, v3 = Inventory:InvokeServer("Equip", type, a2.name)
    if v2 and a2.type == "tower" then
        Sound("Equip"):Play()
    end
    return v2, v3
end

function v1:_addToHotbar(a2, a3) -- Line: 317
    -- upvalues: PlayerStatsStore (val), InventoryStore (val)
    local v1
    local v2 = a3 and self:getPvPHotbar() or self:getHotbar()
    local name = a2.name
    for k, v in pairs(v2) do
        if v == name then
            if true then
                return
            end
            v1 = if not (10 <= PlayerStatsStore.getLevel()) then 4 else 5
            if a3 then
                InventoryStore.addPvPHotbar(a2.name, v1)
                return
            end
            InventoryStore.addHotbar(a2.name, v1)
            return
        end
    end
    if false then
        return
    end
    v1 = if not (10 <= PlayerStatsStore.getLevel()) then 4 else 5
    if a3 then
        InventoryStore.addPvPHotbar(a2.name, v1)
        return
    end
    InventoryStore.addHotbar(a2.name, v1)
end

function v1.unequip(a1, a2, a3) -- Line: 333
    -- upvalues: u68 (val), Inventory (val), Sound (val)
    if not u68 then
        if a2.type == "tower" then
            a1:_removeFromHotbar(a2, a3)
        end
        return true
    end
    local v1 = (a2.type:sub(1, 1):upper()) .. a2.type:sub(2)
    if v1:lower() == "tower" then
        v1 = if not a3 then "tower" else "pvptower"
    elseif v1:lower() == "consumable" then
        v1 = if not a3 then "consumable" else "pvpconsumable"
    end
    local v2, v3 = Inventory:InvokeServer("Unequip", v1, a2.name)
    if v2 and a2.type == "tower" then
        Sound("Unequip"):Play()
    end
    return v2, v3
end

function v1:_removeFromHotbar(a2, a3) -- Line: 360 -- upvalues: InventoryStore (val) -- types: self: table, a3: boolean?
    local v1 = a3 and self:getPvPHotbar() or self:getHotbar()
    local name = a2.name
    for k, v in pairs(v1) do
        if v == name then
            if false then
                return
            end
            if a3 then
                InventoryStore.removeFromPvPHotbar(a2.name)
                return
            end
            InventoryStore.removeFromHotbar(a2.name)
            return
        end
    end
    if true then
        return
    end
    if a3 then
        InventoryStore.removeFromPvPHotbar(a2.name)
        return
    end
    InventoryStore.removeFromHotbar(a2.name)
end

function v1:ownsGolden(a2) -- Line: 375
    if a2.type ~= "tower" then
        return false
    end
    return self:owns({type = "skin", name = "Golden", tower = a2})
end

function v1.getSkin(a1, a2) -- Line: 388 -- upvalues: ItemController (val)
    local skin
    for i, v in ipairs(a1:getItems()) do
        if v.type == "tower" and v.name == a2 then
            skin = v.skin
            if skin then
                return ItemController:skin(v.name, skin)
            end
        end
    end
    return nil
end

function v1.isGoldenEquipped(a1, a2) -- Line: 406
    if not a1:ownsGolden(a2) then
        return false
    end
    for i, v in ipairs((a1:getItems())) do
        if v.type == "tower" and v.name == a2.name then
            return v.golden == true
        end
    end
    return false
end

function v1:owns(a2) -- Line: 424
    local v1
    if a2.type == "emote" then
        return (self:getEmotes())[a2.name] ~= nil
    end
    if a2.type == "sticker" then
        return (self:getStickers())[a2.name] ~= nil
    end
    if a2.type == "tag" then
        return (self:getTags())[a2.name] ~= nil
    end
    if a2.type == "flair" then
        return table.find(self:getFlairs(), a2.name) ~= nil
    end
    if a2.type == "charm" then
        return (self:getTotems())[a2.name] ~= nil
    end
    if a2.type == "crate" then
        v1 = (self:getCrates())[a2.name]
        local v2 = false
        if v1 ~= nil then
            v2 = v1 > 0
        end
        return v2
    end
    if a2.type == "consumable" then
        v1 = (self:getConsumables())[a2.name]
        if a2.info.PVP then
            return true
        end
        return 0 < (v1 or 0)
    end
    if a2.type ~= "skin" then
        for k, v in pairs(self:getItems()) do
            if v.name == a2.name and v.type == a2.type then
                return true
            end
        end
        return false
    end
    v1 = (self:getSkins())[a2.tower.name]
    if not v1 then
        return false
    end
    for k2, i in pairs(v1) do
        if i == a2.name then
            return true
        end
    end
    return false
end

function v1.ownsComputed(a1, a2) -- Line: 470
    -- upvalues: ReplicatedStorage (val), u69 (ref), Charm (val), InventoryStore (val)
    local Fusion = require(ReplicatedStorage.Shared.UI.Fusion)
    if not u69 then
        u69 = require(ReplicatedStorage.Shared.UI.Fusion).Value(0)
        Charm.listen(InventoryStore.getState, function() -- Line: 50 -- upvalues: u69 (upval)
            u69:set((u69:get(false)) + 1)
        end)
    end
    local u24 = u69
    return Fusion.Computed(function() -- Line: 474 -- upvalues: u24 (val), a1 (val), a2 (val)
        u24:get()
        return a1:owns(a2)
    end)
end

function v1.addItem(a1, a2) -- Line: 481 -- upvalues: InventoryStore (val)
    if a1:owns(a2) then
        return
    end
    InventoryStore.addItem(a2)
end

function v1.isEquipped(a1, a2) -- Line: 489
    local v1
    local v2 = true
    if a2.type ~= "consumable" then
        v2 = a1:owns(a2)
    end
    if not v2 then
        return false
    end
    if a2.type == "tower" then
        for k, v in pairs(a1:getHotbar()) do
            if v == a2.name then
                return true
            end
        end
        return false
    end
    if a2.type == "emote" then
        v1 = (a1:getEmotes())[a2.name]
        return v1 and v1.Equipped
    end
    if a2.type == "sticker" then
        v1 = (a1:getStickers())[a2.name]
        return v1 and v1.Equipped
    end
    if a2.type == "tag" then
        v1 = a1:getTags()
        return v1[a2.name] and v1[a2.name].Equipped
    end
    if a2.type == "flair" then
        return a1:getEquippedFlair() == a2.name
    end
    if a2.type == "charm" then
        v1 = a1:getTotems()
        return v1[a2.name] and v1[a2.name].Equipped
    end
    if a2.type ~= "consumable" then
        return false
    end
    local v3 = a1:getPVPMode() and a1:getPvPConsumablesHotbar() or a1:getConsumablesHotbar()
    return table.find(v3, a2.name) ~= nil
end

function v1.applyGoldenPerks(a1, a2, a3) -- Line: 526 -- upvalues: Inventory (val) -- types: a1: table, a3: boolean
    if a2.type ~= "tower" then
        return false, "This item is not a tower!"
    end
    local v1, v2 = Inventory:InvokeServer(if not a3 then "Unequip" else "Equip", "Golden", a2.name)
    return v1, v2
end

function v1.applySkin(a1, a2) -- Line: 536 -- upvalues: u68 (val), InventoryStore (val), Inventory (val), Sound (val)
    if a2.type ~= "skin" then
        return false, "This item is not a skin!"
    end
    local name = a2.tower.name
    local name_2 = a2.name
    if not u68 then
        InventoryStore.setSkin(name, name_2)
        return true
    end
    local v1, v2 = Inventory:InvokeServer("Equip", "Skin", name, name_2)
    if v1 then
        InventoryStore.setSkin(name, name_2)
        Sound("Skin"):Play()
    end
    return v1, v2
end

function v1.openCrate(a1, a2) -- Line: 559 -- upvalues: Inventory (val)
    local v1, v2 = Inventory:InvokeServer("Open", "Crate", a2.Name)
    if v1 then
        return true, v1
    end
    return false, v2 or "You are unable to open this crate!"
end

return (LazyLoader(v1))
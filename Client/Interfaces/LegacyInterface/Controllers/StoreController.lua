-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.StoreController
-- Decompile time: 11.55 ms

local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Charm = require(ReplicatedStorage.Packages.Charm)
local Shared = ReplicatedStorage.Shared
local UI = Shared.UI
local UserPolicies = require(Shared.Modules.UserPolicies)
local Stores = script.Parent.Parent.Stores
local StarterPackStore = require(ReplicatedStorage.Client.Interfaces.Stores.Lobby.StarterPackStore)
local u42 = nil
local u43 = nil

local function getShopStore() -- Line: 20 -- upvalues: u42 (ref), Stores (val)
    if not u42 then
        u42 = require(Stores.Shop)
    end
    return u42
end

local function getFusion() -- Line: 28 -- upvalues: UI (val)
    return require(UI.Fusion)
end

local function getLegacyShopState() -- Line: 32 -- upvalues: u43 (ref), UI (val), u42 (ref), Stores (val), Charm (val)
    if not u43 then
        local Value = require(UI.Fusion).Value
        if not u42 then
            u42 = require(Stores.Shop)
        end
        u43 = Value(u42.getState())
        local listen = Charm.listen
        if not u42 then
            u42 = require(Stores.Shop)
        end
        listen(u42.getState, function(a1) -- Line: 36 -- upvalues: u43 (upval)
            u43:set(a1)
        end)
    end
    return u43
end

local u47 = nil

local function getInventory() -- Line: 45 -- upvalues: u47 (ref)
    if not u47 then
        u47 = require(script.Parent.InventoryController)
    end
    return u47
end

Player = require(script.Parent.PlayerController)
Items = require(script.Parent.ItemController)
LazyLoader = require(UI.LazyLoader)
Network = require(UI.Network)
Cache = require(UI.Cache)
FFlagControllers = require(ReplicatedStorage.Client.Controllers.Shared.FFlagController)
Sound = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Sound)
Enums = require(ReplicatedStorage.Shared.Modules.Enum)
local Shop = Network.Channel("Shop")
local Rotation = Network.Channel("Rotation")
local Streaming = Network.Channel("Streaming")
local Value = workspace:WaitForChild("Type").Value
local u106, u107 = Charm.signal(false)
local u108 = nil

local function getCanPurchaseRandomItemsState() -- Line: 72 -- upvalues: u108 (ref), UI (val), u106 (val)
    if not u108 then
        u108 = require(UI.Fusion).Value(u106())
    end
    return u108
end

local function setCanPurchaseRandomItemsState(a1) -- Line: 80 -- upvalues: u107 (val), u108 (ref)
    u107(a1)
    if u108 then
        u108:set(a1)
    end
end

local function shallowCopy(a1) -- Line: 88
    local v1 = {}
    for k, v in pairs(a1) do
        v1[k] = v
    end
    return v1
end

local u112 = {}
u112.__index = u112

function u112.canPurchaseRandomItems(a1) -- Line: 100 -- upvalues: u106 (val)
    return u106()
end

function u112.getCanPurchaseRandomItemsState(a1) -- Line: 104 -- upvalues: u108 (ref), UI (val), u106 (val)
    if not u108 then
        u108 = require(UI.Fusion).Value(u106())
    end
    return u108
end

function u112:init(a2) -- Line: 109
    -- upvalues: Value (val), u42 (ref), Stores (val), StarterPackStore (val), UserPolicies (val), LocalPlayer (val)
    -- upvalues: u107 (val), u108 (ref)
    Player:init()
    Items:init()
    if Value == "Lobby" then
        if not u42 then
            u42 = require(Stores.Shop)
        end
        local u16 = u42
        local Bundles = Cache("Bundles")
        Bundles.Updated:Connect(function(a1) -- Line: 118 -- upvalues: u16 (val), StarterPackStore (upval)
            u16.setBundles(a1)
            StarterPackStore.setBundles(a1)
        end)
        ;(Bundles:Get()):andThen(function(a1) -- Line: 123 -- upvalues: u16 (val), StarterPackStore (upval)
            u16.setBundles(a1)
            StarterPackStore.setBundles(a1)
        end)
        self:_fetchRotations()
    end
    ;((UserPolicies(LocalPlayer)):andThen(function(a1) -- Line: 131 -- upvalues: u107 (upval), u108 (upval)
        local v1 = a1.ArePaidRandomItemsRestricted == false
        u107(v1)
        if u108 then
            u108:set(v1)
        end
    end)):finally(function() -- Line: 133 -- upvalues: a2 (val)
        a2()
    end)
end

function u112.purchaseItem(a1, a2) -- Line: 139
    local v1, v2 = a1:canPurchase(a2)
    if not v1 then
        return false, v2
    end
end

function u112:canPurchase(a2) -- Line: 150 -- upvalues: u47 (ref)
    if not self:canAfford(a2) then
        return false, "You can't afford this!"
    end
    if not u47 then
        u47 = require(script.Parent.InventoryController)
    end
    if u47:owns(a2) then
        return false, "You already own this!"
    end
    local v1, v2 = self:isUnlocked(a2)
    if not v1 then
        return false, v2
    end
    return true
end

function u112:canAfford(a2) -- Line: 175
    local v1
    _, v1 = self:isOnSale(a2)
    if Items:getGamepassData(a2) and not v1 then
        return true
    end
    if Items:isRobuxPurchase(a2) and not v1 then
        return true
    end
    local v2 = Items:getPrice(a2)
    local v3 = Items:getPurchaseType(a2)
    if v3 ~= "Free" and v3 ~= "Robux" then
        return v2 and Player:canAfford(v2, v3)
    end
    return true
end

local u123 = FFlagControllers.get("shop.real-prices", false)
local u124 = nil
local u125 = nil

local function getProductInfo(a1, a2) -- Line: 199
    -- upvalues: u125 (ref), UI (val), u124 (ref)
    if not u125 then
        u125 = require(UI.Fusion).Value({id = 0})
    end
    local v1 = u125:get()
    if v1.id == a1 then
        if not v1.info then
            return 0
        end
        if not v1.info.IsForSale then
            return -1
        end
        return v1.info.PriceInRobux or 0
    end
    local u32 = require(UI.ProductInfo)(a1, a2)
    local v2 = u32:get(false)
    if v2 then
        u125:set({id = a1, info = v2})
        return v2.PriceInRobux or 0
    end
    if u124 then
        u124()
        u124 = nil
    end
    local Fusion = require(UI.Fusion)
    local u52 = nil
    u52 = (Fusion.Observer(u32)):onChange(function() -- Line: 239 -- upvalues: u52 (ref), u124 (upval), u125 (upval), a1 (val), u32 (val)
        u52()
        if u124 == u52 then
            u124 = nil
        end
        local v1 = u125:get(false)
        if v1 and v1.id == a1 then
            u125:set({id = a1, info = u32:get(false)})
        end
    end)
    u124 = u52
    u125:set({id = a1})
    return 0
end

function u112:isOnSale(a2) -- Line: 266 -- upvalues: Value (val), u123 (val), getProductInfo (val)
    local v1
    local v2, v3 = Items:getPurchaseData(a2)
    local v4 = v2 ~= nil
    local Value_2 = 0
    local v5 = ""
    local v6 = true
    local MapLocked = nil
    local Id = nil
    local GamePass = not (a2.type ~= "tower") and Enum.InfoType.GamePass or Enum.InfoType.Product
    if Value ~= "Lobby" then
        v4 = false
    end
    if a2.type == "crate" and not self:canPurchaseRandomItems() then
        v4 = false
    end
    if v4 then
        Value_2 = v2.Value
        v5 = Items:getPurchaseType(a2)
        Id = v2.Id
        if v2.IsEligible then
            v6 = v2.IsEligible:get() ~= false
        elseif v2.MapLocked then
            v6 = false
        end
        MapLocked = if not v4 then nil else if v6 then nil else v2.MapLocked
    end
    if not v6 then
        v4 = false
    end
    if not MapLocked then
        v1 = Items:getGamepassData(a2)
        if v6 or not v1 then
            if v6 and v1 and v1.Id then
                Id = v1.Id
            end
        elseif v1.Id then
            v4 = true
            v5 = "Robux"
            Value_2 = v1.Price or v1.Value or Value_2
            Id = v1.Id
        elseif v6 and v1 and v1.Id then
            Id = v1.Id
        end
    end
    if v3 and not v6 then
        if not v5 or v5 == "" then
            v5 = "Coins"
        end
        v4 = v6
        Value_2 = v2.Value
    end
    if u123() and Id then
        v1 = Value_2
        Value_2 = getProductInfo(Id, GamePass)
        if Value_2 == -1 then
            v3 = nil
            Value_2 = v1
        end
        if v3 then
            v3.Value = Value_2
        end
    end
    if not v3 then
        if Value ~= "Lobby" then
            v3 = false
            v4 = false
        end
    elseif Value == "Lobby" then
        if not v5 or v5 == "" then
            v5 = "Coins"
        end
        v4 = v6
        Value_2 = v2.Value
    elseif Value ~= "Lobby" then
        v3 = false
        v4 = false
    end
    return v4, {showBoth = v3, mapLocked = MapLocked, price = Value_2, currency = v5}
end

function u112.isUnlocked(a1, a2) -- Line: 354
    local v1 = Items:getRank(a2)
    if not Player:isLevel(v1) then
        return false, "You need to be level " .. v1 .. " to purchase this!"
    end
    return true
end

function u112.isSkinLocked(a1, a2) -- Line: 365 -- upvalues: u47 (ref)
    if not a1:isUnlocked(a2.tower) then
        return true
    end
    if not u47 then
        u47 = require(script.Parent.InventoryController)
    end
    if u47:owns(a2) then
        return false
    end
    return true
end

function u112.isSkinPurchaseable(a1, a2) -- Line: 377 -- upvalues: u47 (ref)
    if not u47 then
        u47 = require(script.Parent.InventoryController)
    end
    if not u47:owns(a2) then
        if not u47 then
            u47 = require(script.Parent.InventoryController)
        end
        if u47:owns(a2.tower) then
            return Items:isRobuxPurchase(a2)
        end
    end
    return false
end

function u112:_fetchRotations() -- Line: 386
    -- upvalues: RunService (val), Rotation (val), Streaming (val), u42 (ref), Stores (val)
    if not RunService:IsRunning() then
        return
    end
    local u125 = tick()
    self._nonce = u125

    local function scheduleUpdate(a1) -- Line: 395 -- upvalues: self (val), u125 (val)
        task.delay(a1, function() -- Line: 396 -- upvalues: self (upval), u125 (upval)
            if self._nonce == u125 then
                self:_fetchRotations()
            end
        end)
    end

    local v1, v2 = Rotation:InvokeServer("Request")
    if not v1 then
        task.delay(2, function() -- Line: 396 -- upvalues: self (val), u125 (val)
            if self._nonce == u125 then
                self:_fetchRotations()
            end
        end)
        warn("Error getting rotation:", v2)
        return
    end
    local v3 = {}
    local v4 = nil
    local v5 = nil
    for i, j in v1.Data.Skins, v4, v5 do
        if not v3[j.Troop] then
            v3[j.Troop] = {}
        end
        table.insert(v3[j.Troop], j.Skin)
    end
    if next(v3) then
        Streaming:FireServer("SelectMultipleTowers", v3, true)
    end
    for k, v in pairs(v1.Data) do
        if not u42 then
            u42 = require(Stores.Shop)
        end
        u42.setRotation(k, v)
    end
    local v6 = v1.Expires.UnixTimestamp - v1.Now.UnixTimestamp
    v4 = DateTime.fromUnixTimestamp(workspace:GetServerTimeNow() + v6)
    if not u42 then
        u42 = require(Stores.Shop)
    end
    u42.setExpires(v4)
    task.delay(v6, function() -- Line: 396 -- upvalues: self (val), u125 (val)
        if self._nonce == u125 then
            self:_fetchRotations()
        end
    end)
end

local u132 = nil

function u112.getFeaturedItems(a1) -- Line: 439 -- upvalues: u132 (ref), UI (val)
    if not u132 then
        u132 = require(UI.Rotation)("Featured")
    end
    return u132
end

function u112.getExpires(a1) -- Line: 449 -- upvalues: UI (val), getLegacyShopState (val)
    local Fusion = require(UI.Fusion)
    local u6 = getLegacyShopState()
    return Fusion.Computed(function() -- Line: 453 -- upvalues: u6 (val)
        return u6:get(false).Expires or DateTime.fromUnixTimestamp(workspace:GetServerTimeNow())
    end)
end

function u112.getRotation(a1, a2) -- Line: 460 -- upvalues: UI (val), getLegacyShopState (val)
    local Fusion = require(UI.Fusion)
    local u7 = getLegacyShopState()
    return Fusion.Computed(function() -- Line: 464 -- upvalues: u7 (val), a2 (val)
        local Rotations = u7:get(false).Rotations or {}
        return Rotations[a2] or {}
    end)
end

function u112.getNextRotation(a1, a2) -- Line: 472 -- upvalues: UI (val) -- types: a1: table, a2: boolean?
    local v1 = a1:getExpires()
    local u12 = require(UI.Components.Timer)(v1)
    return (require(UI.Fusion)).Computed(function() -- Line: 477 -- upvalues: u12 (val), a2 (val)
        local v1 = u12:get()
        if a2 == false then
            return v1
        end
        return string.format("%.2d:%.2d:%.2d", math.floor(v1 % 86400 / 3600), math.floor(v1 % 3600 / 60), (math.floor(v1 % 60)))
    end)
end

function u112:itemInfo(a2) -- Line: 492 -- upvalues: u47 (ref)
    if not u47 then
        u47 = require(script.Parent.InventoryController)
    end
    local v1 = u47:owns(a2)
    if not u47 then
        u47 = require(script.Parent.InventoryController)
    end
    local v2 = u47:isEquipped(a2)
    local v3 = not self:isUnlocked(a2)
    local v4 = {}
    for k, v in pairs(a2) do
        v4[k] = v
    end
    if v3 then
        v4.Locked = true
        return v4
    end
    v4.Owned = v1
    v4.Equipped = v2
    return v4
end

function u112:category(a2) -- Line: 508
    local v1 = {}
    for k, v in pairs((Items:category(a2))) do
        table.insert(v1, (self:itemInfo(v)))
    end
    return v1
end

function u112.purchaseGamepass(a1, a2) -- Line: 518 -- upvalues: MarketplaceService (val), LocalPlayer (val)
    MarketplaceService:PromptGamePassPurchase(LocalPlayer, a2)
end

function u112.purchaseSubscription(a1, a2) -- Line: 522 -- upvalues: Shop (val)
    return Shop:InvokeServer("SubscriptionPurchase", a2)
end

local function withSound(a1, ...) -- Line: 526
    if ... then
        Sound("Purchase"):Play()
    end
    return ...
end

function u112.purchase(a1, a2) -- Line: 536 -- upvalues: withSound (val), Shop (val)
    if a2.type == "crate" and not a1:canPurchaseRandomItems() then
        return false, "Paid random items are restricted!"
    end
    return withSound(a2, Shop:InvokeServer("Purchase", a2.type, a2.name, a2.skin))
end

function u112.purchaseDaily(a1, a2, a3, a4) -- Line: 547
    -- upvalues: Shop (val), withSound (val)
    local v1 = {Shop:InvokeServer("DailyPurchase", a2, a3)}
    if a4 then
        return unpack(v1)
    end
    return withSound(a3, unpack(v1))
end

function u112.promptCratePurchase(a1, a2) -- Line: 564 -- upvalues: Shop (val) -- types: a1: table, a2: string
    return Shop:InvokeServer("PromptCratePurchase", a2)
end

function u112.purchaseCurrency(a1, a2, a3) -- Line: 568 -- upvalues: Shop (val)
    return Shop:InvokeServer("CurrencyPurchase", a2, a3)
end

Shop:On("Update", function(a1) -- Line: 572 -- upvalues: u112 (val)
    Items:setRemoteCrates(a1)
    u112:_fetchRotations()
end)
task.spawn(function() -- Line: 577 -- upvalues: Shop (val)
    local v1 = Shop:InvokeServer("GetCrates")
    Items:setRemoteCrates(v1)
end)
return (LazyLoader(u112))
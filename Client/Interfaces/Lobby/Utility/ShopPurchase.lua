-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Utility.ShopPurchase
-- Decompile time: 11.48 ms

local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Network = require(ReplicatedStorage.Shared.Modules.Network)
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local ShopPurchaseRoute = require(script.Parent.ShopPurchaseRoute)
local ViewController = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.ViewController)
local arePaidRandomItemsRestricted = require(ReplicatedStorage.Client.Interfaces.Lobby.Utility.arePaidRandomItemsRestricted)
local LocalPlayer = Players.LocalPlayer
local Shop = Network.Channel("Shop")
local NewShop = NewNetwork.Channel("NewShop")
local u51 = {resolveRoute = ShopPurchaseRoute.resolve}

local function getItemReference(a1) -- Line: 25
    return {
        type = a1.type,
        name = a1.name,
        tower = a1.tower,
        skin = a1.skin,
        stat = a1.stat,
    }
end

function u51.execute(a1) -- Line: 35
    -- upvalues: NewShop (val), arePaidRandomItemsRestricted (val), ViewController (val), Shop (val)
    -- upvalues: MarketplaceService (val), LocalPlayer (val)
    local v1, v2
    if not a1 then
        return
    end
    if a1.kind ~= "shopItem" then
        if a1.kind == "subscription" then
            v1, v2 = Shop:InvokeServer("SubscriptionPurchase", a1.id)
            if not v1 then
                warn("[SHOP_REVAMP]: Failed to purchase subscription: ", v2)
            end
            return
        end
        if a1.kind == "gamepass" then
            MarketplaceService:PromptGamePassPurchase(LocalPlayer, a1.id)
            return
        end
        MarketplaceService:PromptProductPurchase(LocalPlayer, a1.id)
        return
    end
    v1 = NewShop
    local itemKey = a1.itemKey
    local item = a1.item
    v1, v2 = v1:invokeServer("purchaseItem", itemKey, {
        type = item.type,
        name = item.name,
        tower = item.tower,
        skin = item.skin,
        stat = item.stat,
    })
    if not v1 then
        warn("[SHOP_REVAMP]: Failed to purchase item: ", v2)
        return
    end
    if a1.item.type == "crate" and not a1.robuxProductId and arePaidRandomItemsRestricted() then
        (ViewController:getEmitter("Inventory")):Emit("OpenRestrictedCrate", a1.item.name)
    end
end

function u51.createHandler(a1, a2, a3, a4, a5, a6) -- Line: 74
    -- upvalues: ShopPurchaseRoute (val), u51 (val)
    local u14 = ShopPurchaseRoute.resolve(a1, a2, a3, a4, a5, a6)
    return function() -- Line: 85 -- upvalues: u51 (upval), u14 (val)
        u51.execute(u14)
    end
end

return u51
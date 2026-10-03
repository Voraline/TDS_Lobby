-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.ShopRevamp.Catalog.Elements.Product
-- Decompile time: 5.69 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Comma = require(ReplicatedStorage.Client.Modules.Comma)
local React = require(ReplicatedStorage.Shared.UI.React)
local ShopCostUtils = require(ReplicatedStorage.Shared.Modules.ShopCostUtils)
local ShopMarketplace = require(ReplicatedStorage.Client.Interfaces.Lobby.Utility.ShopMarketplace)
local ShopProduct = require(script.Parent.Parent.Parent.Components.ShopProduct)
local Constants = require(script.Parent.Parent.Constants)
local EvolutionLock = require(script.Parent.Parent.Parent.EvolutionLock)
local Items = require(script.Parent.Parent.Items)
local LayoutUtils = require(script.Parent.Parent.LayoutUtils)
require(script.Parent.Parent.Types)
local createElement = React.createElement

local function formatNumber(a1) -- Line: 19 -- upvalues: Comma (val)
    if type(a1) ~= "string" and type(a1) ~= "number" then
        warn("[SHOP_REVAMP]: formatNumber received invalid type: ", (type(a1)))
        return ""
    end
    return Comma(a1)
end

local function formatPrice(a1) -- Line: 28 -- upvalues: formatNumber (val), ShopCostUtils (val), Comma (val)
    if not a1 then
        return ""
    end
    if type(a1) == "number" then
        return formatNumber(a1)
    end
    local v1 = ShopCostUtils.getCostValue(a1)
    if type(v1) ~= "number" then
        return ""
    end
    if type(v1) ~= "string" and type(v1) ~= "number" then
        warn("[SHOP_REVAMP]: formatNumber received invalid type: ", (type(v1)))
        return ""
    end
    return (Comma(v1))
end

return function(a1, a2, a3, a4, a5, a6, a7, a8) -- Line: 41
    -- upvalues: Items (val), LayoutUtils (val), ShopMarketplace (val), EvolutionLock (val), Comma (val)
    -- upvalues: ShopCostUtils (val), createElement (val), ShopProduct (val), Constants (val)
    local v1, v2
    local props = a1.component.props or {}
    local v3 = a2
    local v4 = Items.resolveKey(a6.items, a1)
    local v5 = LayoutUtils.getTowerCategory(a2)
    local v6 = Items.getCrateCategory(a2)
    if v5 and a2 and a2.category ~= v5 then
        v3 = table.clone(a2)
        v3.category = v5
    end
    local cost = v3 and v3.cost or props.cost
    local v7 = ShopMarketplace.resolveSubscriptionId(props)
    local v8 = ShopMarketplace.resolveProductGamepassId(props, v3)
    local v9 = ShopMarketplace.getProductKey(props, v3, cost)
    local v10 = v9 and a6.marketplaceData[v9] or nil
    local v11 = v8 and a6.marketplaceData[("gamepass:%*"):format(v8)] or nil
    local price = v10 and v10.price
    local v12 = true
    if props.owned ~= true then
        v12 = Items.entryOwned(a6.inventory, v3, a1, a6.entitlements) or v10 and v10.owned == true
    end
    local v13 = v3
    if v13 then
        v13 = false
        if v3.locked == true then
            v13 = EvolutionLock.isLocked(v3, a6.inventory, a6.towerExp) and not v12
        end
    end
    local v14 = if not v13 then nil else EvolutionLock.getLockedMessage(v3, Items.getName(v3, a1.component))
    local unlockRequirement = if not v13 then nil else if type(v3.unlockRequirement) ~= "string" then nil else v3.unlockRequirement
    local v15 = if not unlockRequirement then nil else if not a6.onUnlockRequirementClick then nil else function() -- Line: 90 -- upvalues: a6 (val), unlockRequirement (val)
        a6.onUnlockRequirementClick(unlockRequirement)
    end
    if type(props.rewardStat) ~= "string" then
        v1 = Items.getName(v3, a1.component)
    elseif type(props.rewardAmount) ~= "number" then
        v1 = "N/A"
    else
        local rewardAmount_2 = props.rewardAmount
        if type(rewardAmount_2) == "string" or type(rewardAmount_2) == "number" then
            v1 = Comma(rewardAmount_2)
        else
            warn("[SHOP_REVAMP]: formatNumber received invalid type: ", (type(rewardAmount_2)))
            v1 = ""
        end
    end
    if type(price) ~= "number" then
        if type(price) == "string" then
            v2 = price
        elseif v9 then
            v2 = "..."
        elseif not cost then
            v2 = ""
        elseif type(cost) ~= "number" then
            local v16 = ShopCostUtils.getCostValue(cost)
            if type(v16) ~= "number" then
                v2 = ""
            elseif type(v16) == "string" or type(v16) == "number" then
                v2 = Comma(v16)
            else
                warn("[SHOP_REVAMP]: formatNumber received invalid type: ", (type(v16)))
                v2 = ""
            end
        elseif type(cost) == "string" or type(cost) == "number" then
            v2 = Comma(cost)
        else
            warn("[SHOP_REVAMP]: formatNumber received invalid type: ", (type(cost)))
            v2 = ""
        end
    elseif type(price) == "string" or type(price) == "number" then
        v2 = Comma(price)
    else
        warn("[SHOP_REVAMP]: formatNumber received invalid type: ", (type(price)))
        v2 = ""
    end
    local v17 = {Name = a1.id}
    v17.Size = a7 or UDim2.fromScale(1 / a4, 1)
    v17.Position = a8
    v17.LayoutOrder = a3
    v17.ItemType = v3 and v3.type
    v17.Rarity = if not v3 then if not v3 then nil else v3.rarity else if v3.type ~= "tower" then if not v3 then nil else v3.rarity else v5
    v17.categoryColor = v6 and Constants.CRATE_CATEGORY_COLORS[v6] or nil
    local icon = props.icon or v3 and v3.icon
    v17.icon = icon
    v17.currencyIcon = props.currencyIcon
    v17.iconSize = props.iconSize
    v17.iconPosition = props.iconPosition
    v17.iconAnchorPoint = props.iconAnchorPoint
    v17.aspectRatio = props.aspectRatio
    v17.background = props.background
    v17.backgroundColor = props.backgroundColor
    v17.glowColor = props.glowColor
    v17.new = props.new
    local giftId = props.giftId or v3 and v3.giftId
    v17.giftId = giftId
    v17.item = v3
    v17.cost = cost
    v17.costs = v3 and v3.costs
    v17.locked = v13
    v17.lockedMessage = v14
    v17.unlockRequirement = unlockRequirement
    v17.onUnlockRequirementClick = v15
    v17.owned = v12
    v17.price = v2
    v17.gamepassPrice = v11 and v11.price
    v17.productId = props.productId
    v17.gamepassId = v8
    v17.subscriptionId = v7
    v17.purchase = a6.createPurchaseHandler(v3, v4, cost, props.productId, v8, v7)
    v17.productName = v1
    local description = v10 and v10.description or props.description or v3 and v3.description
    v17.description = description
    v17.shopProductSize = a5
    local subText = if not v3 then props.subText else Items.getSubText(v3)
    v17.subText = subText
    v17.productFlairText = props.productFlairText
    v17.productFlairSize = props.productFlairSize
    v17.productFlairPosition = props.productFlairPosition
    v17.componentType = a1.component.type
    v17.purchasePrompt = a6.purchasePrompt
    local showSpinTicketPreview = a6.showSpinTicketPreview and v1 == "Spin Tickets"
    v17.showSpinTicketPreview = showSpinTicketPreview
    v17.onSpinTicketPreview = a6.onSpinTicketPreview
    v17.scrollingFrameRef = a6.scrollingFrameRef
    return createElement(ShopProduct, v17)
end
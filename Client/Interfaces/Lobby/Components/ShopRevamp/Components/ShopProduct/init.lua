-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.ShopRevamp.Components.ShopProduct
-- Decompile time: 26.06 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage.Packages
local Shared = ReplicatedStorage.Shared
local Client = ReplicatedStorage.Client
local Modules = Shared.Modules
local Interfaces = Client.Interfaces
local Hooks = Interfaces.Hooks
local Enum = require(Modules.Enum)
local React = require(Shared.UI.React)
local ReactFlow = require(Packages.ReactFlow)
local ShopCostUtils = require(Shared.Modules.ShopCostUtils)
local Sift = require(Packages.Sift)
local Comma = require(Client.Modules.Comma)
local EvolutionLock = require(script.Parent.Parent.EvolutionLock)
local Icons = require(Interfaces.LegacyInterface.Icons)
local RarityColors = require(ReplicatedStorage.Shared.Modules.RarityColors)
local ShopFocusStore = require(Interfaces.Stores.Lobby.ShopFocusStore)
local ViewController = require(Interfaces.LegacyInterface.Controllers.ViewController)
local arePaidRandomItemsRestricted = require(Interfaces.Lobby.Utility.arePaidRandomItemsRestricted)
local useSound = require(Hooks.useSound)
require(Hooks.useViewEnabled)
local useGroupAnimation = ReactFlow.useGroupAnimation
local createElement = React.createElement
local useAnimation = ReactFlow.useAnimation
local useBindings = ReactFlow.useBindings
local useBinding = React.useBinding
local useEffect = React.useEffect
local useRef = React.useRef
local Spring = ReactFlow.Spring
local memo = React.memo
local ProductVisuals = script.ProductVisuals
local ShopProduct_Card = require(ProductVisuals.ShopProduct_Card)
local ShopProduct_Currency = require(ProductVisuals.ShopProduct_Currency)
local ShopProduct_FeaturedHero = require(ProductVisuals.ShopProduct_FeaturedHero)
local ShopProduct_FeaturedSquare = require(ProductVisuals.ShopProduct_FeaturedSquare)
local ShopProduct_Gamepass = require(ProductVisuals.ShopProduct_Gamepass)
local ShopProduct_Square = require(ProductVisuals.ShopProduct_Square)
local ShopProduct_Ticket = require(ProductVisuals.ShopProduct_Ticket)
local u100 = {}
u100[Enum.TowerCategory.Starter] = (Color3.fromRGB(255, 255, 255))
u100[Enum.TowerCategory.Intermediate] = RarityColors[Enum.SkinRarity.Uncommon]
u100[Enum.TowerCategory.Advanced] = RarityColors[Enum.SkinRarity.Rare]
u100[Enum.TowerCategory.Hardcore] = RarityColors[Enum.SkinRarity.Legendary]
u100[Enum.TowerCategory.Evolved] = (Color3.fromRGB(0, 208, 212))
u100[Enum.TowerCategory.Exclusive] = RarityColors[Enum.SkinRarity.Event]
u100[Enum.TowerCategory.Event] = RarityColors[Enum.SkinRarity.Event]
local u140 = {
    crate = ShopProduct_Square,
    emote = ShopProduct_Card,
    nametag = ShopProduct_Square,
    skin = ShopProduct_Card,
    sticker = ShopProduct_Square,
    tower = ShopProduct_Card,
}
local u141 = {FeaturedHero = ShopProduct_FeaturedHero, FeaturedSquare = ShopProduct_FeaturedSquare}
local u142 = {
    crate = true,
    emote = true,
    nametag = true,
    skin = true,
    sticker = true,
    tower = true,
}
local u143 = {Gems = 1, Coins = 2}

local function getCostIcon(a1, a2, a3) -- Line: 134
    -- upvalues: Icons (val), ShopCostUtils (val)
    if a2 then
        return Icons.Robux
    end
    if a3 and not a1 then
        return Icons.Robux
    end
    if type(a1) == "table" then
        local v1 = ShopCostUtils.getCurrencyName(a1.currency)
        if v1 then
            return Icons[v1] or Icons.Coins
        end
    end
    return Icons.Coins
end

local function isRobuxCost(a1, a2, a3) -- Line: 149 -- upvalues: ShopCostUtils (val) -- types: a2: number?, a3: number?
    if type(a2) == "number" then
        return true
    end
    if type(a3) == "number" and not a1 then
        return true
    end
    return ShopCostUtils.isRobuxCost(a1)
end

local function getFocusItemName(a1) -- Line: 157
    if not a1 then
        return nil
    end
    return a1.tower or a1.name or a1.stat
end

local function canFocusItem(a1) -- Line: 165
    if not a1 then
        return false
    end
    local type = a1.type
    local v1 = true
    if type ~= "tower" then
        v1 = true
        if type ~= "skin" then
            v1 = true
            if type ~= "emote" then
                v1 = true
                if type ~= "nametag" then
                    v1 = type == "crate"
                end
            end
        end
    end
    return v1
end

local function isTicketProduct(a1) -- Line: 178 -- types: a1: table
    local v1 = not a1.item
    if v1 then
        v1 = false
        if a1.subText ~= nil then
            v1 = a1.subText:lower():find("ticket") ~= nil
        end
    end
    return v1
end

local function usesMainButtonInteraction(a1) -- Line: 182 -- upvalues: u142 (val) -- types: a1: table
    local v1
    local item = a1.item
    local type_2 = item and item.type
    if type(type_2) == "string" and u142[type_2:lower()] then
        return true
    end
    if item then
        if a1.subscriptionId then
            return true
        end
        v1 = not a1.item
        if v1 then
            v1 = false
            if a1.subText ~= nil then
                v1 = a1.subText:lower():find("ticket") ~= nil
            end
        end
        return v1
    end
    if not a1.productId and not a1.gamepassId then
        if a1.subscriptionId then
            return true
        end
        v1 = not a1.item
        if v1 then
            v1 = false
            if a1.subText ~= nil then
                v1 = a1.subText:lower():find("ticket") ~= nil
            end
        end
        return v1
    end
    return true
end

local function usesDirectRobuxPrompt(a1) -- Line: 201 -- types: a1: table
    local v1 = not a1.item
    if v1 then
        v1 = true
        if a1.gamepassId == nil then
            v1 = true
            if a1.productId == nil then
                v1 = a1.subscriptionId ~= nil
            end
        end
    end
    return v1
end

local function getFocusRarity(a1) -- Line: 206
    if a1 and a1.type == "tower" and a1.category then
        return a1.category
    end
    return a1 and a1.rarity or nil
end

local function getRarityColor(a1, a2) -- Line: 214 -- upvalues: u100 (val), RarityColors (val) -- types: a1: string?
    if a1 == "tower" and a2 ~= nil then
        return u100[a2]
    end
    if a2 ~= nil then
        return RarityColors[a2]
    end
    return nil
end

local function getCostPriceRow(a1) -- Line: 222 -- upvalues: ShopCostUtils (val), Icons (val), Comma (val)
    local Coins
    if type(a1) ~= "table" then
        return nil
    end
    local value = a1.value or a1.cost
    if type(value) ~= "number" then
        return nil
    end
    local v1 = {isRobux = false, currency = ShopCostUtils.getCurrencyName(a1.currency)}
    if type(a1) ~= "table" then
        Coins = Icons.Coins
    else
        local v2 = ShopCostUtils.getCurrencyName(a1.currency)
        Coins = v2 and Icons[v2] or Icons.Coins
    end
    v1.icon = Coins
    v1.text = Comma(value)
    return v1
end

local function getFocusCost(a1) -- Line: 240
    if type(a1) ~= "table" then
        return nil
    end
    return {currency = a1.currency, value = a1.value, id = a1.id}
end

local function getPurchasePromptType(a1) -- Line: 252 -- types: a1: table
    local item = a1.item
    local type = item and item.type
    if type == "skin" then
        return "Tower Skin"
    end
    if type == "tower" then
        return "Tower"
    end
    if type == "emote" then
        return "Emote"
    end
    if type == "nametag" then
        return "Tag"
    end
    if type == "sticker" then
        return "Sticker"
    end
    if type == "crate" then
        return "Crate"
    end
    return a1.subText or "Product"
end

local function parseDisplayPrice(a1) -- Line: 273
    if type(a1) == "number" then
        return a1
    end
    if type(a1) == "string" then
        return (tonumber((a1:gsub(",", ""))))
    end
    return nil
end

local function getPurchasePromptPriceData(a1) -- Line: 285
    -- upvalues: ShopCostUtils (val), Enum (val)
    local getRobuxProductId, price_2, productId_2, v1, v2, v3, v4, value
    local v5 = {}
    local normalizeCosts = ShopCostUtils.normalizeCosts
    local v6 = {cost = a1.cost, costs = a1.costs}
    local v7 = a1
    for i, j in normalizeCosts(v6) do
        v2 = ShopCostUtils.isRobuxCost(j)
        getRobuxProductId = ShopCostUtils.getRobuxProductId
        productId_2 = if not v2 then nil else v7.productId
        v3, v4 = getRobuxProductId(j, productId_2)
        value = j.value
        if v3 then
            price_2 = v7.price
            value = if type(price_2) == "number" then price_2 else if type(price_2) ~= "string" then nil else tonumber((price_2:gsub(",", "")))
            if value == nil and not v4 then
                value = j.value
            end
        end
        table.insert(v5, {Type = j.currency, Value = value, Id = v3 or j.id})
    end
    if #v5 == 0 and type(v7.productId) == "number" then
        v1 = {Type = Enum.CurrencyType.Robux}
        local price = v7.price
        v1.Value = if type(price) == "number" then price else if type(price) ~= "string" then nil else tonumber((price:gsub(",", "")))
        v1.Id = v7.productId
        table.insert(v5, v1)
    end
    if type(v7.gamepassId) == "number" then
        v1 = {Type = Enum.CurrencyType.Robux}
        local gamepassPrice = v7.gamepassPrice
        v1.Value = if type(gamepassPrice) == "number" then gamepassPrice else if type(gamepassPrice) ~= "string" then nil else tonumber((gamepassPrice:gsub(",", "")))
        v1.Id = v7.gamepassId
        table.insert(v5, v1)
    end
    if #v5 > 0 then
        return v5
    end
    return nil
end

local function hasAlternativePaymentOptions(a1) -- Line: 339 -- upvalues: ShopCostUtils (val) -- types: a1: table
    if type(a1.gamepassId) ~= "number" then
        return false
    end
    local v1 = ShopCostUtils.normalizeCosts({cost = a1.cost, costs = a1.costs})
    local v2 = false
    if #v1 == 1 then
        v2 = not ShopCostUtils.isRobuxCost(v1[1])
    end
    return v2
end

local function getProductVisualComponent(a1) -- Line: 352
    -- upvalues: u141 (val), ShopProduct_Gamepass (val), ShopProduct_Ticket (val), ShopProduct_Currency (val)
    -- upvalues: u140 (val)
    local v1
    local item = a1.item
    local ItemType = if not item or not item.type then a1.ItemType else tostring(item.type)
    local v2 = ItemType and ItemType:lower()
    local v3 = u141[a1.componentType]
    if v3 then
        return v3
    end
    if not a1.gamepassId and not a1.subscriptionId then
        if not item and a1.productId then
            v1 = not a1.item
            if v1 then
                v1 = false
                if a1.subText ~= nil then
                    v1 = a1.subText:lower():find("ticket") ~= nil
                end
            end
            if v1 then
                return ShopProduct_Ticket
            end
            return ShopProduct_Currency
        end
        return v2 and u140[v2] or ShopProduct_Gamepass
    end
    if not a1.item then
        return ShopProduct_Gamepass
    end
    if not item and a1.productId then
        v1 = not a1.item
        if v1 then
            v1 = false
            if a1.subText ~= nil then
                v1 = a1.subText:lower():find("ticket") ~= nil
            end
        end
        if v1 then
            return ShopProduct_Ticket
        end
        return ShopProduct_Currency
    end
    return v2 and u140[v2] or ShopProduct_Gamepass
end

return memo(function(a1) -- Line: 377
    -- upvalues: useBinding (val), useRef (val), useSound (val), EvolutionLock (val), u100 (val), RarityColors (val)
    -- upvalues: Enum (val), Icons (val), ShopCostUtils (val), hasAlternativePaymentOptions (val), useEffect (val)
    -- upvalues: getCostPriceRow (val), u143 (val), Comma (val), useGroupAnimation (val), useAnimation (val)
    -- upvalues: Spring (val), useBindings (val), u142 (val), Sift (val), React (val), getProductVisualComponent (val)
    -- upvalues: arePaidRandomItemsRestricted (val), ShopFocusStore (val), ViewController (val)
    -- upvalues: getPurchasePromptPriceData (val), createElement (val), ShopProduct_Gamepass (val)
    -- upvalues: ShopProduct_Currency (val)
    local Coins, v1, v2
    local v3, u4 = useBinding(false)
    local v4, u8 = useBinding(false)
    local v5, u12 = useBinding(false)
    local u15 = useRef(nil)
    local Click = useSound("Click")
    local u21 = a1.owned == true
    local u26 = false
    if a1.locked == true then
        u26 = not u21
    end
    local u34 = u26
    if u34 then
        u34 = EvolutionLock.canPurchaseWithGamepass(a1.item, a1.gamepassId)
    end
    local type_2 = a1.item and a1.item.type or a1.ItemType
    local v6 = true
    if type_2 ~= "skin" then
        v6 = true
        if type_2 ~= "emote" then
            v6 = true
            if type_2 ~= "sticker" then
                v6 = true
                if type_2 ~= "nametag" then
                    v6 = true
                    if a1.componentType ~= "FeaturedHero" then
                        v6 = a1.componentType == "FeaturedSquare"
                    end
                end
            end
        end
    end
    local Rarity = a1.Rarity
    local categoryColor = (if type_2 ~= "tower" then if Rarity == nil then nil else RarityColors[Rarity] else if Rarity == nil then if Rarity == nil then nil else RarityColors[Rarity] else u100[Rarity]) or a1.categoryColor or RarityColors[Enum.Rarity.Common]
    local v7 = a1.price or ""
    local v8 = a1.description or ""
    local cost = a1.cost
    local productId = a1.productId
    local gamepassId = a1.gamepassId
    if productId then
        Coins = Icons.Robux
    else
        local v9
        if not gamepassId then
            if type(cost) ~= "table" then
                Coins = Icons.Coins
            else
                v9 = ShopCostUtils.getCurrencyName(cost.currency)
                Coins = v9 and Icons[v9] or Icons.Coins
            end
        elseif not cost then
            Coins = Icons.Robux
        elseif type(cost) ~= "table" then
            Coins = Icons.Coins
        else
            v9 = ShopCostUtils.getCurrencyName(cost.currency)
            Coins = v9 and Icons[v9] or Icons.Coins
        end
    end
    local cost_2 = a1.cost
    local productId_2 = a1.productId
    local gamepassId_2 = a1.gamepassId
    local v10 = if type(productId_2) == "number" then true else if type(gamepassId_2) ~= "number" then ShopCostUtils.isRobuxCost(cost_2) else if cost_2 then ShopCostUtils.isRobuxCost(cost_2) else true
    local v11 = {}
    local item = not u26
    if item then
        item = a1.item
        if item then
            item = false
            if a1.item.type == "tower" then
                item = false
                if a1.item.evolutionLevel == nil then
                    item = hasAlternativePaymentOptions(a1)
                end
            end
        end
    end
    useEffect(function() -- Line: 410 -- upvalues: u15 (val), a1 (val), u12 (val)
        local current_2
        local current = u15.current
        if not current then
            return
        end
        if not a1.scrollingFrameRef then
            current_2 = current:FindFirstAncestorWhichIsA("ScrollingFrame")
        else
            current_2 = a1.scrollingFrameRef.current
            if not current_2 then
                current_2 = current:FindFirstAncestorWhichIsA("ScrollingFrame")
            end
        end
        if not current_2 then
            u12(true)
            return
        end

        local function isHierarchyVisible() -- Line: 423 -- upvalues: current (val), current_2 (val)
            local Parent = current.Parent
            while Parent do
                if Parent == current_2 then
                    break
                end
                if Parent:IsA("GuiObject") and not Parent.Visible then
                    return false
                end
                Parent = Parent.Parent
            end
            return current_2.Visible
        end

        local function updateVisibility() -- Line: 435
            -- upvalues: isHierarchyVisible (val), u12 (upval), current (val), current_2 (val)
            if not isHierarchyVisible() then
                u12(false)
                return
            end
            local Y = current.AbsolutePosition.Y
            local v1 = Y + current.AbsoluteSize.Y
            local Y_2 = current_2.AbsolutePosition.Y
            local v2 = Y_2 + current_2.AbsoluteWindowSize.Y
            local CurrentCamera = workspace.CurrentCamera
            local Y_3 = if not CurrentCamera then (1 / 0) else CurrentCamera.ViewportSize.Y
            local v3 = math.max(Y_2, 0)
            local v4 = math.min(v2, Y_3)
            local v5 = u12
            local v6 = false
            if v3 < v1 then
                v6 = Y < v4
            end
            v5(v6)
        end

        local u84 = {}
        local v1 = (current_2:GetPropertyChangedSignal("CanvasPosition")):Connect(updateVisibility)
        local v2 = (current_2:GetPropertyChangedSignal("AbsolutePosition")):Connect(updateVisibility)
        local v3 = (current_2:GetPropertyChangedSignal("AbsoluteWindowSize")):Connect(updateVisibility)
        local v4 = (current:GetPropertyChangedSignal("AbsolutePosition")):Connect(updateVisibility)
        local PropertyChangedSignal_5 = current:GetPropertyChangedSignal("AbsoluteSize")
        u84[1] = v1
        u84[2] = v2
        u84[3] = v3
        u84[4] = v4
        u84[5] = PropertyChangedSignal_5:Connect(updateVisibility)
        local Parent = current.Parent
        while Parent do
            if Parent == current_2 then
                break
            end
            if Parent:IsA("GuiObject") then
                table.insert(u84, ((Parent:GetPropertyChangedSignal("Visible")):Connect(updateVisibility)))
            end
            Parent = Parent.Parent
        end
        table.insert(u84, ((current_2:GetPropertyChangedSignal("Visible")):Connect(updateVisibility)))
        task.defer(updateVisibility)
        return function() -- Line: 477 -- upvalues: u84 (val)
            for i, j in u84 do
                j:Disconnect()
            end
        end
    end, {})
    if a1.subscriptionId then
        Coins = Icons.Robux
        v10 = true
    end
    local item_2 = a1.item
    if item_2 then
        item_2 = false
        if a1.item.type == "tower" then
            item_2 = type(a1.gamepassId) == "number"
        end
    end
    if u26 then
        table.insert(v11, {isRobux = false, text = "LOCKED", icon = Icons.Locked})
    else
        local v12
        if not a1.item then
            if item_2 then
                for i, j in a1.costs or {} do
                    v12 = getCostPriceRow(j)
                    if v12 then
                        table.insert(v11, v12)
                    end
                end
                table.insert(v11, {
                    isRobux = true,
                    text = if type(a1.gamepassPrice) ~= "number" then tostring(a1.gamepassPrice or "...") else Comma(a1.gamepassPrice),
                })
            end
        elseif a1.item.type ~= "tower" then
            if item_2 then
                for k, n in a1.costs or {} do
                    v12 = getCostPriceRow(n)
                    if v12 then
                        table.insert(v11, v12)
                    end
                end
                table.insert(v11, {
                    isRobux = true,
                    text = if type(a1.gamepassPrice) ~= "number" then tostring(a1.gamepassPrice or "...") else Comma(a1.gamepassPrice),
                })
            end
        elseif a1.item.evolutionLevel ~= nil then
            for i6, i7 in a1.costs or {} do
                v2 = getCostPriceRow(i7)
                if v2 then
                    table.insert(v11, v2)
                end
            end
            table.sort(v11, function(a1, a2) -- Line: 506 -- upvalues: u143 (upval)
                local v1 = u143[a1.currency] or (1 / 0)
                local v2 = u143[a2.currency] or (1 / 0)
                if v1 ~= v2 then
                    return v1 < v2
                end
                return (tostring(a1.currency)) < tostring(a2.currency)
            end)
        elseif item_2 then
            for m, i5 in a1.costs or {} do
                v12 = getCostPriceRow(i5)
                if v12 then
                    table.insert(v11, v12)
                end
            end
            table.insert(v11, {
                isRobux = true,
                text = if type(a1.gamepassPrice) ~= "number" then tostring(a1.gamepassPrice or "...") else Comma(a1.gamepassPrice),
            })
        end
    end
    if #v11 == 0 then
        table.insert(v11, {icon = Coins, isRobux = v10, text = v7})
    end
    local v13, u395 = useGroupAnimation({
        onSelected = useAnimation({
            outlineTransparency = Spring({target = 0, damper = 1, speed = 27.5}),
            borderTransparency = Spring({target = 0.75, damper = 1, speed = 27.5}),
            buttonScale = Spring({target = 0.95, damper = 1, speed = 40}),
            iconScale = Spring({target = 1, damper = 1, speed = 40}),
        }),
        onHovered = useAnimation({
            outlineTransparency = Spring({target = 0, damper = 1, speed = 27.5}),
            borderTransparency = Spring({target = 0.65, damper = 1, speed = 27.5}),
            buttonScale = Spring({target = 1.05, damper = 1, speed = 40}),
            iconScale = Spring({target = 1.05, damper = 1, speed = 25}),
        }),
        onDefault = useAnimation({
            outlineTransparency = Spring({target = 1, damper = 1, speed = 27.5}),
            borderTransparency = Spring({target = 0, damper = 1, speed = 27.5}),
            buttonScale = Spring({target = 1, damper = 1, speed = 40}),
            iconScale = Spring({target = 1, damper = 1, speed = 10}),
        }),
        onDisabled = useAnimation({
            outlineTransparency = Spring({target = 1, damper = 1, speed = 27.5}),
            borderTransparency = Spring({target = 0, damper = 1, speed = 27.5}),
            buttonScale = Spring({target = 0, damper = 1, speed = 40}),
            iconScale = Spring({target = 1, damper = 1, speed = 40}),
        }),
    }, {outlineTransparency = 1, borderTransparency = 0, buttonScale = 0, iconScale = 1})
    local v14 = {v3, v4, v5}
    useBindings(function(a1, a2, a3) -- Line: 588 -- upvalues: u395 (val), u4 (val), u8 (val)
        if not a3 then
            u395("onDisabled")
            u4(false)
            u8(false)
            return
        end
        if a2 then
            u395("onSelected")
            return
        end
        if a1 then
            u395("onHovered")
            return
        end
        u395("onDefault")
    end, v14, {})
    local item_3 = a1.item
    local type_3 = item_3 and item_3.type
    if type(type_3) ~= "string" then
        if item_3 then
            if not a1.subscriptionId then
                v1 = not a1.item
                if v1 then
                    v1 = false
                    if a1.subText ~= nil then
                        v1 = a1.subText:lower():find("ticket") ~= nil
                    end
                end
            else
                v1 = true
            end
        elseif a1.productId or a1.gamepassId then
            v1 = true
        elseif not a1.subscriptionId then
            v1 = not a1.item
            if v1 then
                v1 = false
                if a1.subText ~= nil then
                    v1 = a1.subText:lower():find("ticket") ~= nil
                end
            end
        else
            v1 = true
        end
    elseif u142[type_3:lower()] then
        v1 = true
    elseif item_3 then
        if not a1.subscriptionId then
            v1 = not a1.item
            if v1 then
                v1 = false
                if a1.subText ~= nil then
                    v1 = a1.subText:lower():find("ticket") ~= nil
                end
            end
        else
            v1 = true
        end
    elseif a1.productId or a1.gamepassId then
        v1 = true
    elseif not a1.subscriptionId then
        v1 = not a1.item
        if v1 then
            v1 = false
            if a1.subText ~= nil then
                v1 = a1.subText:lower():find("ticket") ~= nil
            end
        end
    else
        v1 = true
    end
    local join = Sift.Dictionary.join
    v14 = {
        Name = "ShopProduct",
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(0.3, 0.3),
        Position = UDim2.fromScale(0, 0),
        AnchorPoint = Vector2.new(0, 0),
    }
    local MouseButton1Down = React.Event.MouseButton1Down
    v14[MouseButton1Down] = if not v1 then nil else function() -- Line: 613 -- upvalues: u8 (val)
        u8(true)
    end
    local MouseButton1Up = React.Event.MouseButton1Up
    v14[MouseButton1Up] = if not v1 then nil else function() -- Line: 618 -- upvalues: u8 (val)
        u8(false)
    end
    local MouseEnter = React.Event.MouseEnter
    v14[MouseEnter] = if not v1 then nil else function() -- Line: 623 -- upvalues: u4 (val)
        u4(true)
    end
    local MouseLeave = React.Event.MouseLeave
    v14[MouseLeave] = if not v1 then nil else function() -- Line: 628 -- upvalues: u4 (val), u8 (val)
        u4(false)
        u8(false)
    end
    local v15 = join(v14, a1.native or {}, {
        Name = a1.Name,
        LayoutOrder = a1.LayoutOrder,
        Size = a1.Size,
        Position = a1.Position,
        AnchorPoint = a1.AnchorPoint,
        ref = u15,
    })
    v14 = getProductVisualComponent(a1)
    if not v1 then
        v2 = {Active = false, Selectable = false}
    else
        v2 = {Active = true, Selectable = true, AutoButtonColor = false}

        v2[React.Event.Activated] = function() -- Line: 652
            -- upvalues: Click (val), a1 (val), u21 (val), u26 (val), u34 (val), arePaidRandomItemsRestricted (upval)
            -- upvalues: ShopFocusStore (upval), ViewController (upval), getPurchasePromptPriceData (upval)
            -- upvalues: hasAlternativePaymentOptions (upval)
            local v1, v2
            Click()
            local item = a1.item
            if u21 then
                return
            end
            if u26 and not u34 then
                return
            end
            if item then
                local type_2 = item.type
                v1 = true
                if type_2 ~= "tower" then
                    v1 = true
                    if type_2 ~= "skin" then
                        v1 = true
                        if type_2 ~= "emote" then
                            v1 = true
                            if type_2 ~= "nametag" then
                                v1 = type_2 == "crate"
                            end
                        end
                    end
                end
            else
                v1 = false
            end
            if v1 then
                v2 = {type = item.type}
                v2.name = (if item then item.tower or item.name or item.stat else nil) or ""
                v2.displayName = a1.productName
                v2.description = a1.description
                v2.skin = item.skin
                v2.rarity = if not item then item and item.rarity or nil else if item.type ~= "tower" then item and item.rarity or nil else if not item.category then item and item.rarity or nil else item.category
                local cost = a1.cost
                v2.cost = if type(cost) == "table" then {currency = cost.currency, value = cost.value, id = cost.id} else nil
                v2.costs = a1.costs
                v2.gamepassId = a1.gamepassId
                v2.giftId = a1.giftId
                v2.purchase = a1.purchase
                v2.owned = u21
                v2.locked = u26
                v2.lockedMessage = a1.lockedMessage
                v2.evolvesFrom = item.evolvesFrom
                v2.evolutionLevel = item.evolutionLevel
                v2.unlockRequirement = item.unlockRequirement
                if item.type == "crate" and arePaidRandomItemsRestricted() then
                    ShopFocusStore.setShopFocusData(v2)
                    ViewController:setView("ShopFocus")
                    return
                end
            end
            if not a1.purchase then
                return
            end
            if a1.purchasePrompt then
                local v3 = a1
                v2 = not v3.item
                if v2 then
                    v2 = true
                    if v3.gamepassId == nil then
                        v2 = true
                        if v3.productId == nil then
                            v2 = v3.subscriptionId ~= nil
                        end
                    end
                end
                if not v2 then
                    local purchasePrompt = a1.purchasePrompt
                    v3 = {}
                    local productName = a1.productName or a1.Name or "Product"
                    v3.selectedItem = productName
                    v3.displayName = a1.productName
                    local v4 = a1
                    local item_2 = v4.item
                    local type_3 = item_2 and item_2.type
                    v3.type = if type_3 ~= "skin" then if type_3 ~= "tower" then if type_3 ~= "emote" then if type_3 ~= "nametag" then if type_3 ~= "sticker" then if type_3 ~= "crate" then v4.subText or "Product" else "Crate" else "Sticker" else "Tag" else "Emote" else "Tower" else "Tower Skin"
                    v3.priceData = getPurchasePromptPriceData(a1)
                    v3.priceDataMode = if not hasAlternativePaymentOptions(a1) then "Combined" else "Options"
                    v3.color = Color3.fromRGB(255, 255, 255)
                    v3.robuxPurchaseType = if a1.gamepassId then "GamePass" else if not a1.item then "Product" else if not a1.item.gamepassId then "Product" else "GamePass"
                    v3.canPreview = v1
                    v3.previewData = nil
                    v3.onPurchase = a1.purchase
                    purchasePrompt(v3)
                    return
                end
            end
            a1.purchase()
        end
    end
    local v16 = (Sift.Dictionary.join(v15, v2))
    local v17 = {
        Visual = createElement(v14, {
            product = Sift.Dictionary.join(a1, {owned = u21}),
            rarityColor = categoryColor,
            priceText = v7,
            priceIcon = Coins,
            priceRows = v11,
            priceRowsAreAlternatives = item,
            currencyIcon = a1.currencyIcon,
            isRobuxPrice = v10,
            descriptionText = v8,
            sequence = v13,
            subText = a1.subText,
            locked = u26,
            lockedMessage = a1.lockedMessage,
            onUnlockRequirementClick = a1.onUnlockRequirementClick,
            lockedRobuxPrice = if not u34 then nil else a1.gamepassPrice or "...",
        }),
    }
    local v18 = u21 and v14 ~= ShopProduct_Gamepass and v14 ~= ShopProduct_Currency and not v6 and createElement("TextLabel", {
        BackgroundTransparency = 1,
        Text = "OWNED",
        TextScaled = true,
        ZIndex = 100,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.85, 0.28),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        FontFace = Font.fromName("Montserrat", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
    }, {
        UIStroke = createElement("UIStroke", {
            Thickness = 0.1,
            Color = Color3.fromRGB(0, 0, 0),
            StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
        }),
    }) or nil
    v17.OwnedLabel = v18
    return createElement(if not v1 then "Frame" else "ImageButton", v16, v17)
end)
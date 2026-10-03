-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.PurchasePrompt
-- Decompile time: 8.67 ms

local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage.Packages
local Interfaces = ReplicatedStorage.Client.Interfaces
local React = require(Packages.React)
local Sift = require(Packages.Sift)
local Comma = require(ReplicatedStorage.Client.Modules.Comma)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local Icons = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Icons)
local Prompt = require(ReplicatedStorage.Client.Interfaces.Universal.Components.Prompt)
local ShopCostUtils = require(ReplicatedStorage.Shared.Modules.ShopCostUtils)
local ShopFocusStore = require(Interfaces.Stores.Lobby.ShopFocusStore)
local SpotlightStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.SpotlightStore)
local ViewController = require(Interfaces.LegacyInterface.Controllers.ViewController)
local createElement = React.createElement
local useCallback = React.useCallback
local useRef = React.useRef
local useState = React.useState
local LocalPlayer = Players.LocalPlayer
local u76 = utf8.char(57346)

local function getCurrencyType(a1) -- Line: 56
    if type(a1) == "string" then
        return tonumber(a1) or a1
    end
    return a1
end

local function normalizePriceData(a1) -- Line: 64
    if not a1 then
        return {}
    end
    local v1 = if a1[1] == nil or typeof(a1[1]) ~= "table" then {a1} else a1
    local v2 = {}
    local v3 = nil
    local v4 = nil
    for i, j in v1, v3, v4 do
        if type(j) == "table" and j.Type ~= nil then
            if type(j.Value) == "number" or type(j.Id) == "number" then
                table.insert(v2, j)
            end
        end
    end
    return v2
end

local function getPriceIcon(a1, a2) -- Line: 87 -- upvalues: Icons (val), Enum (val) -- types: a1: table
    if a2 then
        return a2
    end
    local ToString = Enum.CurrencyType.ToString
    local Type = a1.Type
    return Icons[ToString(not (type(Type) ~= "string") and tonumber(Type) or Type)]
end

local function isRobuxPrice(a1) -- Line: 98 -- upvalues: ShopCostUtils (val) -- types: a1: table
    return ShopCostUtils.isRobuxCost(a1)
end

local function promptRobuxPurchase(a1, a2) -- Line: 102
    -- upvalues: MarketplaceService (val), LocalPlayer (val)
    if not a2.Id then
        if a1.onPurchase then
            a1.onPurchase()
        end
        return
    end
    if a1.robuxPurchaseType ~= "Product" and a1.type ~= "Crate" and a1.type ~= "Tower Skin" then
        MarketplaceService:PromptGamePassPurchase(LocalPlayer, a2.Id)
        return
    end
    MarketplaceService:PromptProductPurchase(LocalPlayer, a2.Id)
end

return function(a1) -- Line: 119
    -- upvalues: useState (val), useRef (val), useCallback (val), normalizePriceData (val), Enum (val)
    -- upvalues: ShopCostUtils (val), Comma (val), Icons (val), u76 (val), SpotlightStore (val)
    -- upvalues: promptRobuxPurchase (val), Sift (val), ShopFocusStore (val), ViewController (val), createElement (val)
    -- upvalues: React (val), Prompt (val)
    local v1, u4 = useState(nil)
    local u7 = useRef(nil)
    local u8 = nil
    u8 = useCallback(function(a1) -- Line: 124
        -- upvalues: u7 (val), u4 (val), normalizePriceData (upval), Enum (upval), ShopCostUtils (upval), Comma (upval)
        -- upvalues: Icons (upval), u76 (upval), SpotlightStore (upval), u8 (ref), promptRobuxPurchase (upval)
        -- upvalues: Sift (upval), ShopFocusStore (upval), ViewController (upval)
        local v1, v2, v3, v4, v5, v6, v7
        if not a1 then
            local current = u7.current
            if current then
                current.visible = false
                u4(table.clone(current))
            end
            return
        end
        local displayName = a1.displayName or a1.selectedItem
        local v8 = ("Are you sure you want to purchase \"%*\"?"):format(displayName)
        local v9 = normalizePriceData(a1.priceData)
        local v10 = false
        if a1.priceDataMode == "Options" then
            v10 = #v9 == 2
        end
        if #v9 == 1 then
            local Type = v9[1].Type
            if (not (type(Type) ~= "string") and tonumber(Type) or Type) == Enum.CurrencyType.Free then
                v8 = ("Are you sure you want to purchase \"%*\" for free?"):format(displayName)
            end
        end
        local v11 = {}
        if not v10 then
            local ToString, Type_2, icon, v12, v13
            v5 = nil
            v6 = nil
            for i, j in v9, v5, v6 do
                v2 = ShopCostUtils.isRobuxCost(j)
                v12 = Comma(j.Value or 0)
                v3 = {}
                if not v2 then
                    icon = a1.icon
                    if not icon then
                        v13 = Icons
                        ToString = Enum.CurrencyType.ToString
                        Type_2 = j.Type
                        v4 = v13[ToString(not (type(Type_2) ~= "string") and tonumber(Type_2) or Type_2)]
                    else
                        v4 = icon
                    end
                else
                    v4 = nil
                end
                v3.icon = v4
                v3.value = if not v2 then v12 else ("%* %*"):format(u76, v12)
                table.insert(v11, v3)
            end
        end
        local v14 = {}
        v5 = ("cancelPrompt %* %*"):format(a1.selectedItem, a1.type)
        v14[v5] = {
            text = "Cancel",
            layoutOrder = 3,
            color = Color3.fromRGB(32, 32, 32),
            onClick = function() -- Line: 177 -- upvalues: SpotlightStore (upval), u8 (upval)
                SpotlightStore.fire("CancelPurchase")
                u8(nil)
            end,
        }
        if not v10 then
            v5 = ("%* %*"):format(a1.selectedItem, a1.type)
            v14[v5] = {
                text = "Purchase",
                layoutOrder = 1,
                color = Color3.fromRGB(85, 255, 93),
                onClick = function() -- Line: 190 -- upvalues: a1 (val), SpotlightStore (upval), u8 (upval)
                    if a1.onPurchase then
                        a1.onPurchase()
                    end
                    SpotlightStore.fire("PromptPurchase")
                    u8(nil)
                end,
            }
        end
        v5 = {}
        if v10 then
            local ToString_2, Type_3, icon_2, v15, v16, v17
            v7 = nil
            v1 = nil
            for k, n in v9, v7, v1 do
                local u189 = ShopCostUtils.isRobuxCost(n)
                v15 = if n.Value == nil then "..." else Comma(n.Value)
                v3 = ("PriceOption_%*"):format(k)
                v4 = {}
                if not u189 then
                    icon_2 = a1.icon
                    if not icon_2 then
                        v17 = Icons
                        ToString_2 = Enum.CurrencyType.ToString
                        Type_3 = n.Type
                        v16 = v17[ToString_2(not (type(Type_3) ~= "string") and tonumber(Type_3) or Type_3)]
                    else
                        v16 = icon_2
                    end
                else
                    v16 = nil
                end
                v4.icon = v16
                v4.iconSize = if not u189 then UDim2.fromScale(0.55, 0.55) else nil
                v4.color = Color3.fromRGB(85, 255, 93)
                v4.text = if not u189 then v15 else ("%* %*"):format(u76, v15)

                function v4.onClick() -- Line: 213
                    -- upvalues: u189 (val), n (val), a1 (val), promptRobuxPurchase (upval), SpotlightStore (upval)
                    -- upvalues: u8 (upval)
                    if not u189 then
                        if a1.onPurchase then
                            a1.onPurchase()
                        end
                        SpotlightStore.fire("PromptPurchase")
                        u8(nil)
                        return
                    end
                    if not n.Id then
                        warn("PurchasePrompt: Robux option is missing a purchase ID for item:", a1.selectedItem)
                        return
                    end
                    promptRobuxPurchase(a1, n)
                    SpotlightStore.fire("PromptPurchase")
                    u8(nil)
                end

                v4.layoutOrder = k
                v5[v3] = v4
            end
        end
        local join = Sift.Dictionary.join
        if not a1.canPreview then
            v1 = {}
        else
            v1 = {}
            v2 = ("preview %* %*"):format(a1.selectedItem, a1.type)
            v1[v2] = {
                text = "Preview",
                layoutOrder = 2,
                color = Color3.fromRGB(85, 178, 255),
                onClick = function() -- Line: 240 -- upvalues: a1 (val), ShopFocusStore (upval), ViewController (upval)
                    if not a1.previewData then
                        warn("PurchasePrompt: No preview data provided for item:", a1.selectedItem)
                        return
                    end
                    ShopFocusStore.setShopFocusData(a1.previewData)
                    ViewController:setView("ShopFocus")
                end,
            }
            if not v1 then
                v1 = {}
            end
        end
        v6 = join(v14, v1)
        v7 = {
            title = "Confirm Purchase?",
            icon = Icons.Shop,
            description = v8,
            items = v11,
            actions = v6,
            horizontalActions = v5,
        }
        u4(v7)
        u7.current = v7
    end, {})
    local Fragment = React.Fragment
    local v2 = {Content = a1.render(u8)}
    local v3 = v1
    if v3 then
        v3 = false
        if a1.enabled ~= false then
            v3 = createElement(Prompt, v1)
        end
    end
    v2.Prompt = v3
    return (createElement(Fragment, nil, v2))
end
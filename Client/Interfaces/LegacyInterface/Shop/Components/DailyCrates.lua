-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Shop.Components.DailyCrates
-- Decompile time: 5.68 ms

local MarketplaceService = game:GetService("MarketplaceService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Shared = ReplicatedStorage.Shared
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local Elements = require(script.Parent.Elements)
local Fusion = require(Shared.UI.Fusion)
local StoreController = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.StoreController)
local Hydrate = Fusion.Hydrate
local Value = Fusion.Value
local Children = Fusion.Children
local ForValues = Fusion.ForValues
local Computed = Fusion.Computed
local Sound = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Sound)
local Parent = script.Parent.Parent.Parent
SharedComponents = Parent.Components
ItemController = require(Parent.Controllers.ItemController)
Components = script.Parent
DailyItem = require(Components.DailyItem)
Comma = require(Shared.UI.Comma)

local function normalizePrices(a1) -- Line: 27
    if not a1 then
        return {}
    end
    if a1[1] ~= nil and typeof(a1[1]) == "table" then
        return a1
    end
    return {a1}
end

local function getCurrencyName(a1) -- Line: 39 -- upvalues: Enum (val)
    return Enum.CurrencyType.ToString(a1) or a1
end

local function getRobuxPrice(a1) -- Line: 43 -- upvalues: MarketplaceService (val)
    local success, result = pcall(function() -- Line: 44 -- upvalues: MarketplaceService (upval), a1 (val)
        return MarketplaceService:GetProductInfo(a1.Id, Enum.InfoType.Product)
    end)
    if success then
        return result.PriceInRobux
    end
    return a1.Value
end

return function(a1) -- Line: 51
    -- upvalues: Elements (val), Hydrate (val), Value (val), StoreController (val), Children (val), ForValues (val)
    -- upvalues: normalizePrices (val), Enum (val), Computed (val), MarketplaceService (val), Sound (val)
    local v1
    local u1 = {}
    u1.Basic = Color3.fromRGB(255, 255, 255)
    u1.Rare = Color3.fromRGB(0, 255, 0)
    u1.Legendary = Color3.fromRGB(255, 0, 0)
    local IsMobile = a1.IsMobile
    local v2 = (IsMobile and Elements.MobileDailyCrates or Elements.DailyCrates):Clone()
    local Content = v2
    local v3 = if not IsMobile then Hydrate(Content.Holder.UIGridLayout)({}) else Hydrate(v2.Content.Holder.UIListLayout)({})
    local Visible = a1.Visible
    if not Visible then
        Visible = Value(true)
    end
    local u55 = StoreController:getCanPurchaseRandomItemsState()
    local v4 = Hydrate(Content.Holder)
    local v5 = {}
    local v6 = {}
    local Crates = a1.Crates or {}
    v6[1] = v3
    v6[2] = ForValues(Crates, function(a1_2) -- Line: 76
        -- upvalues: normalizePrices (upval), Enum (upval), Computed (upval), u55 (val), MarketplaceService (upval)
        -- upvalues: Sound (upval), StoreController (upval), a1 (val), u1 (val)
        local PriceInRobux
        local u5 = ItemController:crate(a1_2)
        local info = u5.info or {}
        local u11 = normalizePrices(info.Price)
        local u13 = u11[1]
        if not u13 then
            u13 = {}
        end
        local v1 = info.Rarity or "Basic"
        local v2 = if not (#u11 > 1) then nil else {}

        local function createPriceButton(a1_3, a2) -- Line: 85
            -- upvalues: Enum (upval), Computed (upval), u55 (upval), MarketplaceService (upval), u11 (val), u5 (val)
            -- upvalues: Sound (upval), StoreController (upval), a1 (upval), a1_2 (val)
            local PriceInRobux
            local Type = a1_3.Type
            local u8 = Enum.CurrencyType.ToString(Type) or Type
            local u10 = u8 == "Robux"
            local u13 = Computed(function() -- Line: 88 -- upvalues: u55 (upval)
                return not u55:get()
            end)
            if not u10 then
                PriceInRobux = a1_3.Value
            else
                local success, result = pcall(function() -- Line: 44 -- upvalues: MarketplaceService (upval), a1_3 (val)
                    return MarketplaceService:GetProductInfo(a1_3.Id, Enum.InfoType.Product)
                end)
                PriceInRobux = if not success then a1_3.Value else result.PriceInRobux
            end
            return {
                Size = UDim2.fromScale(if not (#u11 > 1) then 0.8 else 0.48, 1),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Currency = Computed(function() -- Line: 99 -- upvalues: u13 (val), u8 (val)
                    if u13:get() then
                        return "Locked"
                    end
                    return u8
                end),
                Amount = Computed(function() -- Line: 102 -- upvalues: u13 (val), PriceInRobux (val)
                    if u13:get() then
                        return "Locked"
                    end
                    return (Comma(PriceInRobux or 0))
                end),
                PurchaseColor = Computed(function() -- Line: 105 -- upvalues: u13 (val), u5 (upval)
                    if u13:get() then
                        return (Color3.fromRGB(150, 150, 150))
                    end
                    return u5.PurchaseColor or Color3.fromRGB(10, 220, 80)
                end),
                Clicked = function() -- Line: 110
                    -- upvalues: Sound (upval), u13 (val), u10 (val), StoreController (upval), u5 (upval), a1 (upval)
                    -- upvalues: a1_2 (upval), u8 (val), a1_3 (val)
                    Sound("Click"):Play()
                    if u13:get() then
                        return
                    end
                    if u10 then
                        StoreController:promptCratePurchase(u5.name)
                        return
                    end
                    if a1.OnPurchase then
                        a1.OnPurchase(a1_2, {
                            Name = u5.name,
                            DisplayName = u5.name .. " Crate",
                            Currency = u8,
                            Price = a1_3.Value,
                        })
                    end
                end,
            }
        end

        for i, j in u11 do
            if v2 then
                v2[i] = (createPriceButton(j, i))
            end
        end
        local Type = u13.Type
        local u47 = Enum.CurrencyType.ToString(Type) or Type
        local u49 = u47 == "Robux"
        local u52 = Computed(function() -- Line: 142 -- upvalues: u55 (upval)
            return not u55:get()
        end)
        if not u49 then
            PriceInRobux = u13.Value
        else
            local success, result = pcall(function() -- Line: 44 -- upvalues: MarketplaceService (upval), u13 (val)
                return MarketplaceService:GetProductInfo(u13.Id, Enum.InfoType.Product)
            end)
            PriceInRobux = if not success then u13.Value else result.PriceInRobux
        end
        local v3 = DailyItem
        local v4 = {Name = u5.name}
        v4.Currency = Computed(function() -- Line: 149 -- upvalues: u52 (val), u47 (val)
            if u52:get() then
                return "Locked"
            end
            return u47
        end)
        v4.Amount = Computed(function() -- Line: 152 -- upvalues: u52 (val), PriceInRobux (val)
            if u52:get() then
                return "Locked"
            end
            return (Comma(PriceInRobux or 0))
        end)
        v4.PriceButtons = v2
        v4.Rarity = v1
        v4.RarityColor = u1[v1]
        v4.Size = a1.IsMobile and UDim2.fromOffset(180, 180) or nil
        v4.IconSize = u5.IconSize
        v4.Icon = info.Icon or ""
        v4.PurchaseColor = Computed(function() -- Line: 164 -- upvalues: u52 (val), u5 (val)
            if u52:get() then
                return (Color3.fromRGB(150, 150, 150))
            end
            return u5.PurchaseColor or Color3.fromRGB(10, 220, 80)
        end)
        v4.Preview = Computed(function() -- Line: 170 -- upvalues: u5 (val)
            return {Type = "Crates", Item = u5.name, Preview = u5.info.Preview}
        end)

        function v4.Clicked() -- Line: 178
            -- upvalues: Sound (upval), u52 (val), u49 (val), StoreController (upval), u5 (val), a1 (upval), a1_2 (val)
            -- upvalues: u47 (val), u13 (val)
            Sound("Click"):Play()
            if u52:get() then
                return
            end
            if u49 then
                StoreController:promptCratePurchase(u5.name)
                return
            end
            if a1.OnPurchase then
                a1.OnPurchase(a1_2, {
                    Name = u5.name,
                    DisplayName = u5.name .. " Crate",
                    Currency = u47,
                    Price = u13.Value,
                })
            end
        end

        return v3(v4)
    end, function(a1) -- Line: 200
        a1:Destroy()
    end)
    v5[Children] = v6
    v4 = v4(v5)
    v5 = Hydrate(v2)
    local v7 = {}
    local Size = a1.Size or a1.IsMobile and UDim2.fromOffset(750, 0) or nil
    v7.Size = Size
    v7.Position = a1.Position
    v7.AnchorPoint = a1.AnchorPoint
    v7.Visible = Computed(function() -- Line: 210 -- upvalues: Visible (val)
        return Visible:get()
    end)
    if not IsMobile then
        v1 = {v4, a1[Children]}
    else
        v1 = {}
        local v8 = Hydrate(Content)
        local v9 = {}
        v9[Children] = {v4, a1[Children]}
        v1[1] = v8(v9)
    end
    v7[Children] = v1
    return v5(v7)
end
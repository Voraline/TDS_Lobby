-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useShopMarketplaceData
-- Decompile time: 14.84 ms

local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ShopMarketplace = require(ReplicatedStorage.Client.Interfaces.Lobby.Utility.ShopMarketplace)
local useProductRecommendations = require(ReplicatedStorage.Client.Interfaces.Hooks.useProductRecommendations)
local LocalPlayer = Players.LocalPlayer

local function mergeEntry(a1, a2) -- Line: 20
    local v1 = if type(a1) ~= "table" then {} else table.clone(a1)
    for i, j in a2 do
        v1[i] = j
    end
    return v1
end

local function subscribeToMarketplaceProducts(a1, a2, a3) -- Line: 28
    -- upvalues: ShopMarketplace (val), MarketplaceService (val), LocalPlayer (val)
    local u3 = false
    local v1 = ShopMarketplace.collectProducts(a1, a2)

    local function update(a1, a2) -- Line: 32 -- upvalues: u3 (ref), a3 (val) -- types: a1: string
        if u3 then
            return
        end
        a3(function(a1_2) -- Line: 37 -- upvalues: a1 (val), a2 (val)
            local v1 = table.clone(a1_2)
            local v2 = a1_2[a1]
            local v3 = if type(v2) ~= "table" then {} else table.clone(v2)
            for i, j in a2 do
                v3[i] = j
            end
            v1[a1] = v3
            return v1
        end)
    end

    for i, j in v1 do
        task.spawn(function(a1) -- Line: 44 -- upvalues: MarketplaceService (upval), u3 (ref), a3 (val), LocalPlayer (upval)
            local result_2, success_2
            local u6 = ("%*:%*"):format(a1.kind, a1.id)
            if a1.kind == "subscription" then
                local success, result = pcall(function() -- Line: 47 -- upvalues: MarketplaceService (upval), a1 (val)
                    return MarketplaceService:GetSubscriptionProductInfoAsync(a1.id)
                end)
                local u12 = {}
                u12.price = if not success or not result.DisplayPrice then nil else (" %* / month"):format(result.DisplayPrice)
                u12.description = if not success then nil else result.DisplayDescription or result.Description
                if u3 then
                    return
                end
                a3(function(a1) -- Line: 37 -- upvalues: u6 (val), u12 (val)
                    local v1 = table.clone(a1)
                    local v2 = a1[u6]
                    local v3 = if type(v2) ~= "table" then {} else table.clone(v2)
                    for i, j in u12 do
                        v3[i] = j
                    end
                    v1[u6] = v3
                    return v1
                end)
                return
            end
            local GamePass = if a1.kind ~= "gamepass" then Enum.InfoType.Product else Enum.InfoType.GamePass
            local v1 = nil
            local v2 = nil
            for i = 1, 3 do
                success_2, result_2 = pcall(function() -- Line: 70 -- upvalues: MarketplaceService (upval), a1 (val), GamePass (val)
                    return MarketplaceService:GetProductInfoAsync(a1.id, GamePass)
                end)
                if success_2 then
                    v1 = result_2
                    break
                end
                v2 = result_2
                if u3 or i == 3 then
                    break
                end
                task.wait(i * 0.5)
            end
            if u3 then
                return
            end
            if not v1 then
                warn(("[SHOP]: Failed to load marketplace info for %*"):format(u6), v2)
            else
                local u71 = {}
                u71.forSale = if a1.kind ~= "gamepass" then nil else v1.IsForSale == true
                u71.price = v1.PriceInRobux
                u71.description = v1.Description
                if not u3 then
                    a3(function(a1) -- Line: 37 -- upvalues: u6 (val), u71 (val)
                        local v1 = table.clone(a1)
                        local v2 = a1[u6]
                        local v3 = if type(v2) ~= "table" then {} else table.clone(v2)
                        for i, j in u71 do
                            v3[i] = j
                        end
                        v1[u6] = v3
                        return v1
                    end)
                end
            end
            local v3 = false
            if a1.kind == "gamepass" then
                local success_3, result_3 = pcall(function() -- Line: 104 -- upvalues: MarketplaceService (upval), LocalPlayer (upval), a1 (val)
                    return MarketplaceService:UserOwnsGamePassAsync(LocalPlayer.UserId, a1.id)
                end)
                v3 = success_3 and result_3 == true
            end
            local u119 = {owned = v3}
            if u3 then
                return
            end
            a3(function(a1) -- Line: 37 -- upvalues: u6 (val), u119 (val)
                local v1 = table.clone(a1)
                local v2 = a1[u6]
                local v3 = if type(v2) ~= "table" then {} else table.clone(v2)
                for i, j in u119 do
                    v3[i] = j
                end
                v1[u6] = v3
                return v1
            end)
        end, j)
    end
    local u28 = MarketplaceService.PromptGamePassPurchaseFinished:Connect(function(a1, a2, a3_2) -- Line: 120 -- upvalues: LocalPlayer (upval), u3 (ref), a3 (val)
        if a1 == LocalPlayer and a3_2 then
            local u8 = ("gamepass:%*"):format(a2)
            local u9 = {owned = true}
            if u3 then
                return
            end
            a3(function(a1) -- Line: 37 -- upvalues: u8 (val), u9 (val)
                local v1 = table.clone(a1)
                local v2 = a1[u8]
                local v3 = if type(v2) ~= "table" then {} else table.clone(v2)
                for i, j in u9 do
                    v3[i] = j
                end
                v1[u8] = v3
                return v1
            end)
        end
    end)
    return function() -- Line: 127 -- upvalues: u3 (ref), u28 (val)
        u3 = true
        u28:Disconnect()
    end
end

return function(a1, a2, a3, a4) -- Line: 133
    -- upvalues: React (val), ShopMarketplace (val), useProductRecommendations (val)
    -- upvalues: subscribeToMarketplaceProducts (val)
    local u7, u8 = React.useState({})
    local v1 = {a4, u7}
    local v2 = React.useMemo(function() -- Line: 141 -- upvalues: a4 (val), u7 (val)
        if not a4 then
            return u7
        end
        local v1 = table.clone(u7)
        local v2 = u7["subscription:EXP-5914385580085215338"]
        local v3 = if type(v2) ~= "table" then {} else table.clone(v2)
        for i, j in {owned = true} do
            v3[i] = j
        end
        v1["subscription:EXP-5914385580085215338"] = v3
        return v1
    end, v1)
    local u20 = ShopMarketplace.getOffsaleGamepassSignature(a1, u7)
    local v3 = {a1, u20}
    v1 = React.useMemo(function() -- Line: 154 -- upvalues: u20 (val), ShopMarketplace (upval), a1 (val)
        local v1 = {}
        for i in u20:gmatch("[^|]+") do
            v1[(("gamepass:%*"):format(i))] = {forSale = false}
        end
        return ShopMarketplace.collectGamepassCandidates(a1, v1)
    end, v3)
    local u37 = useProductRecommendations({cacheKey = "shop-gamepasses", candidates = v1, enabled = #v1 > 0})
    local useMemo_3 = React.useMemo
    local v4 = {u37.orderedCandidates, u7, a3}
    local u47 = useMemo_3(function() -- Line: 167 -- upvalues: ShopMarketplace (upval), u37 (val), u7 (val), a3 (val)
        return ShopMarketplace.orderGamepassCandidatesByOwnership(u37.orderedCandidates, u7, a3)
    end, v4)
    local v5 = {a1, u47}
    local v6 = React.useMemo(function() -- Line: 174 -- upvalues: ShopMarketplace (upval), a1 (val), u47 (val)
        return ShopMarketplace.applyGamepassRecommendations(a1, u47)
    end, v5)
    local v7 = {a1, a2}
    React.useEffect(function() -- Line: 178 -- upvalues: subscribeToMarketplaceProducts (upval), a1 (val), a2 (val), u8 (val)
        return (subscribeToMarketplaceProducts(a1, a2, u8))
    end, v7)
    return v6, v2
end
-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Utility.ShopPurchaseRoute
-- Decompile time: 1.19 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ShopCostUtils = require(ReplicatedStorage.Shared.Modules.ShopCostUtils)
return {
    resolve = function(a1, a2, a3, a4, a5, a6) -- Line: 22
        -- upvalues: ShopCostUtils (val)
        local v1 = ShopCostUtils.getRobuxProductId(a3, a4)
        if a1 and a3 then
            return {kind = "shopItem", item = a1, itemKey = a2, robuxProductId = v1}
        end
        if a6 then
            return {kind = "subscription", id = a6}
        end
        if a5 then
            return {kind = "gamepass", id = a5}
        end
        if v1 then
            return {kind = "product", id = v1}
        end
        if a1 and type(a1.gamepassId) == "number" then
            return {kind = "gamepass", id = a1.gamepassId}
        end
        return nil
    end,
}
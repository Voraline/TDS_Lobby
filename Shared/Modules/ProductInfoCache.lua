-- Script path: ReplicatedStorage.Shared.Modules.ProductInfoCache
-- Decompile time: 1.02 ms

local MarketplaceService = game:GetService("MarketplaceService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
local u15 = {}
return {
    getProductInfo = function(a1, a2) -- Line: 38 -- upvalues: u15 (val), TypedPromise (val), MarketplaceService (val) -- types: a1: number
        if u15[a1] then
            return TypedPromise.resolve(u15[a1])
        end
        return TypedPromise.new(function(a1_2, a2_2, a3) -- Line: 43 -- upvalues: MarketplaceService (upval), a1 (val), a2 (val), u15 (upval)
            local result, success
            local v1 = nil
            local v2 = nil
            local u5 = false
            a3(function() -- Line: 47 -- upvalues: u5 (ref)
                u5 = true
            end)
            for i = 1, 5 do
                if u5 then
                    return
                end
                success, result = pcall(function() -- Line: 56 -- upvalues: MarketplaceService (upval), a1 (upval), a2 (upval)
                    return MarketplaceService:GetProductInfo(a1, a2)
                end)
                if success then
                    v1 = result
                    break
                else
                    v2 = result
                    task.wait(1)
                end
            end
            if not v1 then
                a2_2(v2 or "unknown")
            else
                u15[a1] = v1
                a1_2(v1)
            end
        end)
    end,
}
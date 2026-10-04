-- Script path: ReplicatedStorage.Shared.UI.ProductInfo
-- Decompile time: 1.60 ms

local v1 = game:GetService("RunService"):IsServer()
local ServerStorage = game:GetService("ServerStorage")
local MarketplaceService = game:GetService("MarketplaceService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Shared = ReplicatedStorage.Shared
local Value = require(Shared.UI.Fusion).Value
local Promise = if not v1 then require(ReplicatedStorage.Shared.Modules.Promise) else require(ServerStorage.Server.Modules.Session.DataStore2.Promise)
local u41 = {}

local function getProductInfo(a1, a2) -- Line: 19 -- upvalues: Promise (val), MarketplaceService (val)
    return Promise.new(function(a1_2, a2_2) -- Line: 20 -- upvalues: MarketplaceService (upval), a1 (val), a2 (val)
        local result, success
        local v1 = nil
        local v2 = nil
        for i = 1, 5 do
            success, result = pcall(function() -- Line: 25 -- upvalues: MarketplaceService (upval), a1 (upval), a2 (upval)
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
        if v1 then
            a1_2(v1)
            return
        end
        a2_2(v2 or "unknown")
    end)
end

return function(a1, a2, a3) -- Line: 46 -- upvalues: u41 (val), Value (val), Promise (val), MarketplaceService (val)
    local u5 = u41[a2]
    if not u5 then
        u5 = {}
        u41[a2] = u5
    end
    local u14 = u5[a1]
    if not u14 then
        u14 = Value(a3)
        u5[a1] = u14
        ;((Promise.new(function(a1_2, a2_2) -- Line: 20 -- upvalues: MarketplaceService (upval), a1 (val), a2 (val)
            local result, success
            local v1 = nil
            local v2 = nil
            for i = 1, 5 do
                success, result = pcall(function() -- Line: 25 -- upvalues: MarketplaceService (upval), a1 (upval), a2 (upval)
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
            if v1 then
                a1_2(v1)
                return
            end
            a2_2(v2 or "unknown")
        end)):andThen(function(a1) -- Line: 59 -- upvalues: u14 (ref)
            u14:set(a1)
        end)):catch(function(a1_2) -- Line: 62 -- upvalues: a1 (val), u5 (ref), u14 (ref)
            warn("failed to get info for", a1, "::", a1_2)
            if u5[a1] == u14 then
                u5[a1] = nil
            end
        end)
    end
    return u14
end
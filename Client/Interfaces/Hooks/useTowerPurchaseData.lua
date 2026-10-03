-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useTowerPurchaseData
-- Decompile time: 2.71 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local ProductInfoCache = require(ReplicatedStorage.Shared.Modules.ProductInfoCache)
local Purchasables = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Shop.Purchasables)
local React = require(ReplicatedStorage.Shared.UI.React)
local TowerExpUtil = require(ReplicatedStorage.Shared.Modules.TowerExpUtil)
local useCache = require(script.Parent.useCache)
local useTowers = require(script.Parent.useTowers)
local useEffect = React.useEffect
return function(a1, a2) -- Line: 15
    -- upvalues: React (val), useTowers (val), useCache (val), useEffect (val), TowerExpUtil (val), Purchasables (val)
    -- upvalues: Enum (val), ProductInfoCache (val), Players (val)
    local v1, u6 = React.useState({})
    local v2, u11 = React.useState(false)
    local u13 = useTowers()
    local u15 = a1
    if u15 then
        u15 = u13[a1]
    end
    local u21 = useCache("TowerExp", {}, a2)
    local v3 = {u15, u21}
    useEffect(function() -- Line: 23
        -- upvalues: u15 (val), u6 (val), u11 (val), u13 (val), a1 (val), TowerExpUtil (upval), u21 (val)
        -- upvalues: Purchasables (upval), Enum (upval), ProductInfoCache (upval), Players (upval)
        if not u15 then
            u6({})
            u11(true)
            return
        end
        u6({})
        u11(true)
        local u15_2 = task.spawn(function() -- Line: 33
            -- upvalues: u15 (upval), u13 (upval), a1 (upval), TowerExpUtil (upval), u21 (upval), Purchasables (upval)
            -- upvalues: Enum (upval), ProductInfoCache (upval), Players (upval), u6 (upval), u11 (upval)
            local v1
            local v2 = {}
            local Price = u15.Properties.Price
            local Gamepass = u15.Properties.Gamepass
            local EvolutionLevel = u15.Properties.EvolutionLevel
            local v3 = true
            if EvolutionLevel then
                v1 = nil
                for i, j in u13 do
                    if j.Properties.EvolvedTo == a1 then
                        v1 = i
                        break
                    end
                end
                v3 = if not v1 then false else EvolutionLevel <= TowerExpUtil.getLevel({TowerExp = u21}, v1)
            end
            if not Gamepass then
                for k, n in Purchasables.Towers do
                    if n.Name == a1 then
                        Gamepass = {Id = n.GamepassId, GiftId = n.GamepassGiftId}
                        break
                    end
                end
            end
            if Price then
                v1 = false
                if Price[1] ~= nil then
                    v1 = typeof(Price[1]) == "table"
                end
                if not v1 then
                    local Type = Price.Type
                    local Value = Price.Value
                    local Eligible = Price.Eligible
                    if Type == Enum.CurrencyType.Robux and Price.Id then
                        Value = ProductInfoCache.getProductInfo(Price.Id, Enum.InfoType.GamePass):expect().PriceInRobux
                    end
                    if Type ~= Enum.CurrencyType.Free or Eligible then
                        table.insert(v2, {
                            Type = Type,
                            Value = Value,
                            Eligible = if not Eligible then true else Eligible(Players.LocalPlayer),
                            Id = Price.Id,
                        })
                    end
                else
                    for m, i5 in Price do
                        table.insert(v2, {Type = i5.Type, Value = i5.Value, Eligible = v3})
                    end
                end
            end
            if Gamepass and Gamepass.Id then
                v1 = ProductInfoCache.getProductInfo(Gamepass.Id, Enum.InfoType.GamePass):expect()
                if v1.IsForSale then
                    table.insert(v2, {
                        Eligible = true,
                        Type = Enum.CurrencyType.Robux,
                        Value = v1.PriceInRobux,
                        Id = Gamepass.Id,
                        GiftId = Gamepass.GiftId,
                    })
                end
            end
            u6(v2)
            u11(false)
        end)
        return function() -- Line: 136 -- upvalues: u15_2 (val)
            task.cancel(u15_2)
        end
    end, v3)
    return v1, v2
end
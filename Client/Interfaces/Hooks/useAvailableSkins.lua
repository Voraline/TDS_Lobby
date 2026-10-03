-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useAvailableSkins
-- Decompile time: 3.50 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local React = require(ReplicatedStorage.Shared.UI.React)
local Sift = require(ReplicatedStorage.Packages.Sift)
local useProductInfoMap = require(ReplicatedStorage.Client.Interfaces.Hooks.useProductInfoMap)
local Towers = require(ReplicatedStorage.Shared.Data.Icons).Towers
local useCache = require(Hooks.useCache)
local useCrates = require(Hooks.useCrates)
local useFFlag = require(Hooks.useFFlag)
local useTowerData = require(Hooks.useTowerData)
local useMemo = React.useMemo

local function existsInInventory(a1, a2) -- Line: 32 -- types: a1: table, a2: string
    for k, v in pairs(a1) do
        if v.Name == a2 then
            return true
        end
    end
    return false
end

local function existsInCrate(a1, a2, a3) -- Line: 42 -- types: a1: table, a2: string, a3: string
    for i, j in a1 do
        if j.Price and j.Contents and j.Contents[a3] and table.find(j.Contents[a3], a2) then
            return true, i
        end
    end
    return false
end

return function(a1, a2) -- Line: 60
    -- upvalues: useCrates (val), useTowerData (val), useFFlag (val), useCache (val), useProductInfoMap (val)
    -- upvalues: useMemo (val), Towers (val), Sift (val), existsInCrate (val), Enum (val)
    local u4 = useCrates(a2)
    local u7 = useTowerData(a1)
    local u17 = useFFlag("skins.hidden", {}, if a2 ~= nil then {enabled = a2} else nil)
    local u23 = useCache("Inventory.Troops", {}, a2)
    local u28, v1 = useCache("Inventory.Skins", {}, a2)
    local v2, u32, u33 = useProductInfoMap()
    local v3 = {u23, a1}
    local u40 = useMemo(function() -- Line: 71 -- upvalues: a1 (val), u23 (val)
        return a1 and u23[a1]
    end, v3)
    local v4 = {v2, u28, u40, u7, u17, u4}
    return (useMemo(function() -- Line: 75
        -- upvalues: u7 (val), Towers (upval), a1 (val), u40 (val), Sift (upval), u28 (val), u32 (val), u33 (val)
        -- upvalues: u17 (val), existsInCrate (upval), u4 (val), Enum (upval)
        if not u7 then
            return nil
        end
        local u5 = Towers[a1]
        if not u5 then
            u5 = {}
        end
        local Skin = u40
        if Skin then
            Skin = u40.Skin
        end
        local v1 = Sift.Dictionary.map(u7.Properties.SkinData, function(a1_2, a2) -- Line: 83
            -- upvalues: Skin (val), u28 (upval), a1 (upval), u32 (upval), u33 (upval), u17 (upval)
            -- upvalues: existsInCrate (upval), u4 (upval), u5 (val)
            local Icon, Price, v1, v2, v3
            local v4 = Skin == a2
            local v5 = u28[a1]
            if v5 then
                v1 = u28[a1]
                for k, v in pairs(v1) do
                    if v.Name == a2 then
                        v1 = nil
                        Price = a1_2.Price
                        if Price and Price.Id then
                            Price = table.clone(Price)
                            v2, v3 = u32(Price.Id, Enum.InfoType.Product)
                            if not v3 then
                                u33(Price.Id, Enum.InfoType.Product)
                            end
                            if v3 then
                                Price.Value = v3.PriceInRobux
                            elseif v2 then
                                Price.Value = -1
                            end
                        end
                        if false then
                            if table.find(u17, a2) then
                                return nil
                            end
                            v2, v3 = existsInCrate(u4, a1, a2)
                            if not v2 then
                                return nil
                            end
                            v1 = v3
                        end
                        v2 = {Name = a2, DisplayName = a1_2.DisplayName}
                        Icon = u5[a2] or a1_2.Icon
                        v2.Icon = Icon
                        v2.Rarity = a1_2.Rarity
                        v2.Owned = v5
                        v2.Equipped = v4
                        v2.Crate = v1
                        v2.Price = Price
                        return v2
                    end
                end
                v5 = false
            end
            v1 = nil
            Price = a1_2.Price
            if Price and Price.Id then
                Price = table.clone(Price)
                v2, v3 = u32(Price.Id, Enum.InfoType.Product)
                if not v3 then
                    u33(Price.Id, Enum.InfoType.Product)
                end
                if v3 then
                    Price.Value = v3.PriceInRobux
                elseif v2 then
                    Price.Value = -1
                end
            end
            if not v5 and not Price then
                if table.find(u17, a2) then
                    return nil
                end
                v2, v3 = existsInCrate(u4, a1, a2)
                if not v2 then
                    return nil
                end
                v1 = v3
            end
            v2 = {Name = a2, DisplayName = a1_2.DisplayName}
            Icon = u5[a2] or a1_2.Icon
            v2.Icon = Icon
            v2.Rarity = a1_2.Rarity
            v2.Owned = v5
            v2.Equipped = v4
            v2.Crate = v1
            v2.Price = Price
            return v2
        end)
        local v2 = {Name = "Default"}
        local Default = u5.Default or u7.Properties.Icon
        v2.Icon = Default
        v2.Rarity = Enum.SkinRarity.Common
        v2.Owned = u28[a1] ~= nil
        v2.Equipped = Skin == "Default"
        v1.Default = v2
        return v1
    end, v4)), {cache = u28, updateCache = v1}
end
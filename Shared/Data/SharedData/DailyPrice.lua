-- Script path: ReplicatedStorage.Shared.Data.SharedData.DailyPrice
-- Decompile time: 0.84 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Asset = require(ReplicatedStorage.Shared.Modules.Asset)
local CrateData = require(ReplicatedStorage.Shared.Modules.CrateData)
return function(a1, a2, a3) -- Line: 6 -- upvalues: Asset (val), CrateData (val) -- types: a1: string, a2: string, a3: string
    local v1 = Asset("Troops", a1)
    local Properties = v1 and v1.Properties
    local SkinData = Properties and Properties.SkinData
    local v2 = SkinData and SkinData[a2]
    if v2 and a3 then
        local v3 = CrateData[a3]
        local Daily = v3 and v3.Daily
        if not Daily then
            return false, "Skin is not available in a crate"
        end
        local v4 = nil
        local Prices = Daily.Prices
        local CurrencyType = Daily.CurrencyType
        if not CurrencyType then
            return false, "Skin is not available in a crate"
        end
        if Prices.Skins then
            v4 = Prices.Skins[a1]
        end
        if not v4 then
            if not Prices.Skins then
                if Prices.Rarities then
                    v4 = Prices.Rarities[v2.Rarity]
                end
            elseif Prices.Skins[a2] then
                v4 = Prices.Skins[a2]
            elseif Prices.Rarities then
                v4 = Prices.Rarities[v2.Rarity]
            end
        end
        if not v4 then
            return false, "Skin is not for sale"
        end
        return {Type = CurrencyType, Value = v4}
    end
    return false
end
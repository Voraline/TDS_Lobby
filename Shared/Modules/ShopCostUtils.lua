-- Script path: ReplicatedStorage.Shared.Modules.ShopCostUtils
-- Decompile time: 2.78 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local u10 = {}

local function getField(a1, a2, a3) -- Line: 19 -- types: a2: string, a3: string
    local v1 = a1[a2]
    if v1 ~= nil then
        return v1
    end
    return a1[a3]
end

function u10.getCurrencyName(a1) -- Line: 24 -- upvalues: Enum (val)
    if a1 == nil then
        return nil
    end
    return Enum.CurrencyType.ToString(not (type(a1) ~= "string") and tonumber(a1) or a1) or tostring(a1)
end

function u10.normalizeCost(a1) -- Line: 36
    if type(a1) ~= "table" then
        return nil
    end
    local currency = a1.currency or a1.Type or a1.Currency
    if currency == nil then
        return nil
    end
    local value = a1.value
    local Value = if value == nil then a1.Value else value
    if Value == nil then
        Value = a1.cost
    end
    local v1 = {currency = currency, value = if type(Value) ~= "number" then nil else Value}
    local id = a1.id
    v1.id = if id == nil then a1.Id else id
    local giftId = a1.giftId
    v1.giftId = if giftId == nil then a1.GiftId else giftId
    return v1
end

function u10.normalizeCosts(a1) -- Line: 59 -- upvalues: u10 (val)
    local v1
    if type(a1) ~= "table" then
        return {}
    end
    local v2 = {}
    local costs = a1.costs
    if type(costs) ~= "table" then
        costs = if type(a1[1]) ~= "table" then nil else a1
    end
    for i, j in costs or {} do
        v1 = u10.normalizeCost(j)
        if v1 then
            table.insert(v2, v1)
        end
    end
    if #v2 > 0 then
        return v2
    end
    local v3 = u10.normalizeCost(if type(a1.cost) ~= "table" then a1 else a1.cost)
    if v3 then
        table.insert(v2, v3)
    end
    return v2
end

function u10.normalizeCostPosition(a1, a2) -- Line: 90 -- types: a1: number, a2: userdata
    local Min = a2.Min
    local Max = a2.Max
    if a1 <= 0 then
        return 0
    end
    if not (Max <= Min) and not (Min <= 0) then
        local v1 = math.log(Min)
        return (math.clamp((math.log(a1) - v1) / ((math.log(Max)) - v1), 0, 1))
    end
    return 0.5
end

function u10.normalizePurchaseCosts(a1) -- Line: 109 -- upvalues: u10 (val)
    if type(a1) ~= "table" then
        return {}
    end
    local v1 = {}
    if type(a1.costs) == "table" then
        local v2
        for i, j in a1.costs do
            if type(j) == "table" and type(j.currency) == "number" then
                v2 = u10.normalizeCost(j)
                if v2 then
                    table.insert(v1, v2)
                end
            end
        end
    end
    if #v1 == 0 and type(a1.cost) == "table" then
        local v3 = u10.normalizeCost(a1.cost)
        if v3 then
            table.insert(v1, v3)
        end
    end
    return v1
end

function u10.getCostValue(a1) -- Line: 136 -- upvalues: u10 (val)
    local v1 = u10.normalizeCost(a1)
    return v1 and v1.value or nil
end

function u10.isRobuxCost(a1) -- Line: 141 -- upvalues: u10 (val)
    local v1 = u10.normalizeCost(a1)
    local v2 = false
    if v1 ~= nil then
        v2 = u10.getCurrencyName(v1.currency) == "Robux"
    end
    return v2
end

function u10.isFreeCost(a1) -- Line: 146 -- upvalues: u10 (val)
    local v1 = u10.normalizeCost(a1)
    local v2 = false
    if v1 ~= nil then
        v2 = u10.getCurrencyName(v1.currency) == "Free"
    end
    return v2
end

function u10.getRobuxProductId(a1, a2) -- Line: 151 -- upvalues: u10 (val) -- types: a2: number?
    if type(a2) == "number" then
        return a2, false
    end
    local v1 = u10.normalizeCost(a1)
    if v1 and u10.getCurrencyName(v1.currency) == "Robux" then
        if type(v1.id) == "number" then
            return v1.id, false
        end
        if type(v1.value) == "number" and 1000000 <= v1.value then
            return v1.value, true
        end
        return nil, false
    end
    return nil, false
end

return u10
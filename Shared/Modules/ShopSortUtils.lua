-- Script path: ReplicatedStorage.Shared.Modules.ShopSortUtils
-- Decompile time: 4.57 ms

local Modules = game:GetService("ReplicatedStorage").Shared.Modules
local Enum = require(Modules.Enum)
local ShopCostUtils = require(Modules.ShopCostUtils)
local u13 = {}
local u14 = {robux = 1, gems = 2, coins = 3}
local u15 = {}
u15.coins = NumberRange.new(300, 50000)
u15.gems = NumberRange.new(100, 1000)
u15.robux = NumberRange.new(50, 200)

local function getItemIdentity(a1) -- Line: 40
    return table.concat({
        tostring(a1.type or ""),
        tostring(a1.tower or ""),
        tostring(a1.skin or ""),
        (tostring(a1.name or a1.stat or "")),
    }, ":")
end

local function getCostRange(a1, a2, a3) -- Line: 49 -- upvalues: u15 (val) -- types: a2: string, a3: table?
    if a3 and type(a1.type) == "string" then
        local v1 = a3[a1.type:lower()]
        local v2 = if type(v1) ~= "table" then nil else v1[a2] or v1[a2:lower()]
        if type(v2) == "table" then
            local minimum = v2.minimum
            local maximum = v2.maximum
            if type(minimum) == "number" and type(maximum) == "number" and minimum > 0 and minimum < maximum then
                return NumberRange.new(minimum, maximum)
            end
        end
    end
    return u15[a2:lower()]
end

function u13.getCurrencyPriority(a1, a2) -- Line: 77 -- upvalues: ShopCostUtils (val), u14 (val) -- types: a2: boolean?
    local v1, v2
    if type(a1) ~= "table" then
        return (1 / 0)
    end
    local v3 = ShopCostUtils.normalizeCosts(a1)
    if a2 and #v3 > 1 then
        return 0
    end
    if type(a1.gamepassId) == "number" then
        return 1
    end
    local v4 = (1 / 0)
    local v5 = nil
    local v6 = nil
    for i, j in v3, v5, v6 do
        v2 = ShopCostUtils.getCurrencyName(j.currency)
        v1 = v2 and u14[v2:lower()]
        if v1 then
            v4 = math.min(v4, v1)
        end
    end
    return v4
end

function u13.getItemPosition(a1, a2) -- Line: 104
    -- upvalues: ShopCostUtils (val), getCostRange (val)
    local v1, v2, v3
    if type(a1) ~= "table" then
        return 0.5
    end
    local v4 = nil
    local v5, v6 = a1, a2
    for i, j in ShopCostUtils.normalizeCosts(a1) do
        v2 = ShopCostUtils.getCurrencyName(j.currency)
        v3 = v2 and getCostRange(v5, v2, v6)
        if v3 and type(j.value) == "number" then
            v1 = ShopCostUtils.normalizeCostPosition(j.value, v3)
            v4 = if not v4 then v1 else math.min(v4, v1)
        end
    end
    return v4 or 0.5
end

function u13.getItemPersonalizationDistance(a1, a2, a3) -- Line: 124
    -- upvalues: u13 (val)
    local v1 = (if type(a1) ~= "table" then nil else tonumber(a1.personalizationPosition)) or u13.getItemPosition(a1, a3)
    return (math.abs(v1 - (math.clamp(a2, 0, 1)))), v1
end

function u13.getCratePosition(a1) -- Line: 139 -- upvalues: u13 (val)
    if type(a1) == "table" and a1.type == "crate" then
        return u13.getItemPosition(a1)
    end
    return 0.5
end

function u13.getCratePersonalizationDistance(a1, a2) -- Line: 147 -- upvalues: u13 (val) -- types: a2: number
    local v1 = u13.getCratePosition(a1)
    return (math.abs(v1 - (math.clamp(a2, 0, 1)))), v1
end

function u13.personalizeItem(a1, a2, a3) -- Line: 156 -- upvalues: u13 (val) -- types: a2: number, a3: table?
    local v1 = table.clone(a1)
    local v2, v3 = u13.getItemPersonalizationDistance(v1, a2, a3)
    v1.personalizationPosition = v3
    v1.personalizationDistance = v2
    if v1.type == "crate" then
        v1.personalizationPlayerPosition = math.clamp(a2, 0, 1)
    end
    return v1
end

function u13.getCrateCategoryPriority(a1, a2) -- Line: 175 -- upvalues: Enum (val)
    local v1 = tonumber(a2)
    local v2 = true
    if v1 ~= nil then
        v2 = 0.5 <= (math.clamp(v1, 0, 1))
    end
    if a1 == Enum.CrateCategory.Robux then
        if v2 then
            return 1
        end
        return 2
    end
    if a1 == Enum.CrateCategory.Default then
        if v2 then
            return 2
        end
        return 1
    end
    if a1 == Enum.CrateCategory.Consumables then
        return 3
    end
    if a1 == Enum.CrateCategory.Event then
        return 4
    end
    return (1 / 0)
end

function u13.compareTowers(a1, a2) -- Line: 193 -- upvalues: u13 (val), getItemIdentity (val)
    local v1 = tonumber(a1.category) or (1 / 0)
    local v2 = tonumber(a2.category) or (1 / 0)
    if v1 ~= v2 then
        return v1 < v2
    end
    local v3 = u13.getCurrencyPriority(a1, true)
    local v4 = u13.getCurrencyPriority(a2, true)
    if v3 ~= v4 then
        return v3 < v4
    end
    if a1.locked ~= a2.locked then
        return a1.locked ~= true
    end
    return (getItemIdentity(a1)) < getItemIdentity(a2)
end

function u13.compareItems(a1, a2) -- Line: 213 -- upvalues: u13 (val), getItemIdentity (val)
    local v1, v2, v3, v4
    local v5 = tonumber(a1.personalizationDistance)
    local v6 = tonumber(a2.personalizationDistance)
    if not v5 and not v6 then
        if a1.type == "tower" and a2.type == "tower" then
            return u13.compareTowers(a1, a2)
        end
        v1 = tonumber(a1.rarity) or (-1 / 0)
        v2 = tonumber(a2.rarity) or (-1 / 0)
        if v1 ~= v2 then
            return v2 < v1
        end
        v3 = u13.getCurrencyPriority(a1)
        v4 = u13.getCurrencyPriority(a2)
        if v3 ~= v4 then
            return v3 < v4
        end
        return (getItemIdentity(a1)) < getItemIdentity(a2)
    end
    if v5 and v6 and v5 ~= v6 then
        return v5 < v6
    end
    if v5 ~= nil and v6 == nil then
        return true
    end
    if v5 == nil and v6 ~= nil then
        return false
    end
    if a1.type == "tower" and a2.type == "tower" then
        return u13.compareTowers(a1, a2)
    end
    v1 = tonumber(a1.rarity) or (-1 / 0)
    v2 = tonumber(a2.rarity) or (-1 / 0)
    if v1 ~= v2 then
        return v2 < v1
    end
    v3 = u13.getCurrencyPriority(a1)
    v4 = u13.getCurrencyPriority(a2)
    if v3 ~= v4 then
        return v3 < v4
    end
    return (getItemIdentity(a1)) < getItemIdentity(a2)
end

return u13
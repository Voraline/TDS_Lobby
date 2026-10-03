-- Script path: ReplicatedStorage.Shared.Modules.CommerceProductInfo
-- Decompile time: 3.78 ms

local CommerceService = game:GetService("CommerceService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local u31 = {}
local u32 = {}
local u33 = {}

local function isErrorValid(a1) -- Line: 49 -- types: a1: string
    for i, j in {429, 500} do
        if a1:find((("HTTP %*"):format(j))) then
            return true
        end
    end
    return false
end

local function fetchDevProductsById(a1) -- Line: 61
    -- upvalues: u32 (val), table (val), TypedPromise (val), RunService (val), NewNetwork (val)
    local v1
    local v2 = {}
    for i = #a1, 1, -1 do
        v1 = a1[i]
        if u32[v1] then
            v2[v1] = u32[v1]
            table.remove(a1, i)
        end
    end
    if not next(a1) then
        return TypedPromise.resolve(v2)
    end
    return TypedPromise.new(function(a1_2, a2) -- Line: 76 -- upvalues: RunService (upval), NewNetwork (upval), a1 (val), u32 (upval)
        if RunService:IsServer() then
            a2("FetchDevProductsById can only be called from client")
            return
        end
        local v1 = (NewNetwork.Channel("Shopify")):invokeServer("GetDevProductInfo", a1)
        for i, j in v1 do
            u32[i] = j
        end
        a1_2(v1)
    end)
end

local function fetchCommerceProductById(a1) -- Line: 92
    -- upvalues: u31 (val), TypedPromise (val), u33 (val), CommerceService (val), isErrorValid (val)
    if u31[a1] then
        return TypedPromise.resolve(u31[a1])
    end
    if u33[a1] then
        return u33[a1]
    end
    local v1 = TypedPromise.new(function(a1_2, a2) -- Line: 101 -- upvalues: CommerceService (upval), a1 (val), isErrorValid (upval)
        local result, success
        local v1 = nil
        while true do
            success, result = pcall(function() -- Line: 105 -- upvalues: CommerceService (upval), a1 (upval)
                return CommerceService:GetCommerceProductInfoAsync(a1)
            end)
            if success then
                break
            end
            v1 = result or "unknown"
            if not isErrorValid(v1) then
                a2(v1)
                return
            end
            task.wait(1)
        end
        local v2 = result
        if v2 then
            a1_2(v2)
            return
        end
        a2(v1 or "unknown")
    end)
    u33[a1] = v1
    ;(v1:andThen(function(a1_2) -- Line: 134 -- upvalues: u31 (upval), a1 (val)
        u31[a1] = a1_2
    end)):finally(function() -- Line: 137 -- upvalues: u33 (upval), a1 (val)
        u33[a1] = nil
    end)
    return v1
end

return {
    fetchProductsInfo = function(a1) -- Line: 144
        -- upvalues: TypedPromise (val), table (val), fetchCommerceProductById (val), fetchDevProductsById (val)
        return TypedPromise.new(function(a1_2, a2) -- Line: 145
            -- upvalues: table (upval), a1 (val), fetchCommerceProductById (upval), TypedPromise (upval)
            -- upvalues: fetchDevProductsById (upval)
            local u2 = {}
            local u36 = {}
            local v1 = table.reduce(a1, function(a1, a2) -- Line: 149 -- upvalues: fetchCommerceProductById (upval), table (upval), u2 (val)
                local v1 = ((fetchCommerceProductById(a2)):andThen(function(a1) -- Line: 151 -- upvalues: table (upval), u2 (upval), a2 (val)
                    local v1
                    if not a1.IsForSale then
                        return nil
                    end
                    for i, j in a1.Benefits do
                        if j.BenefitType == Enum.BenefitType.DeveloperProduct then
                            v1 = tonumber(j.Id)
                            if v1 and not table.find(u2, v1) then
                                table.insert(u2, v1)
                            end
                        end
                    end
                    return {id = a2, product = a1}
                end)):catch(function(a1) -- Line: 167 -- upvalues: a2 (val)
                    warn((("Error fetching product %*: %*"):format(a2, a1)))
                end)
                table.insert(a1, v1)
                return a1
            end, {})
            local v2, v3 = TypedPromise.all(v1):await()
            if not v2 then
                a2(v3)
                return
            end
            if #u2 > 0 then
                local v4, v5 = fetchDevProductsById(u2):await()
                local v6 = v5
                if not v4 then
                    a2(v6)
                    return
                end
                u36 = v6
            end
            a1_2((table.reduce(v3, function(a1, a2, a3) -- Line: 200 -- upvalues: table (upval), u36 (ref) -- types: a2: table
                local Name, v1, v2
                local product = a2.product
                local id = a2.id
                if not product.IsForSale then
                    return a1
                end
                local v3 = {}
                table.insert(v3, {icon = product.Item.IconImageAssetId, text = product.Item.Name})
                local v4 = nil
                local v5 = nil
                local v6 = a1
                for i, j in product.Benefits, v4, v5 do
                    if j.BenefitType == Enum.BenefitType.DeveloperProduct then
                        Name = j.Name
                        v1 = string.lower(Name)
                        v2 = u36[j.Id]
                        if v2 then
                            table.insert(v3, {
                                icon = v2.icon,
                                text = Name,
                                banner = if not v1:find("crate") then if not v1:find("skin") then if not v1:find("plush") then "IN-GAME REWARD!" else "FREE CHARM!" else "FREE SKIN!" else "FREE CRATE!",
                            })
                        end
                    end
                end
                table.insert(v6, {id = id, items = v3})
                return v6
            end, {})))
        end)
    end,
    fetchCommerceProductById = fetchCommerceProductById,
    fetchDevProductsById = fetchDevProductsById,
}
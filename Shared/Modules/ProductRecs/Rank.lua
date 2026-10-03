-- Script path: ReplicatedStorage.Shared.Modules.ProductRecs.Rank
-- Decompile time: 5.50 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sift = require(ReplicatedStorage.Packages.Sift)
local u9 = {}
local u10 = {
    DeveloperProduct = Enum.InfoType.Product,
    DevProduct = Enum.InfoType.Product,
    Gamepass = Enum.InfoType.GamePass,
    Pass = Enum.InfoType.GamePass,
    Product = Enum.InfoType.Product,
    GamePass = Enum.InfoType.GamePass,
}

local function getInfoTypeName(a1) -- Line: 41
    return a1.Name or tostring(a1)
end

local function resolveInfoType(a1) -- Line: 45 -- upvalues: u10 (val)
    if typeof(a1) == "EnumItem" and a1.EnumType == Enum.InfoType then
        return a1
    end
    if type(a1) ~= "string" then
        if type(a1) == "number" then
            for i, j in Enum.InfoType:GetEnumItems() do
                if j.Value == a1 then
                    return j
                end
            end
        end
        return nil
    end
    local v1 = u10[a1]
    if v1 then
        return v1
    end
    local v2 = Enum.InfoType[a1]
    if v2 then
        return v2
    end
    return nil
end

local function getProductId(a1) -- Line: 71
    if type(a1) == "number" then
        return a1
    end
    if type(a1) ~= "table" then
        return nil
    end
    local productId = a1.productId or a1.ProductId or a1.id or a1.Id or a1.targetId or a1.TargetId
    if type(productId) == "number" then
        return productId
    end
    return nil
end

local function getNestedIdentifier(a1) -- Line: 90
    if type(a1) ~= "table" then
        return nil
    end
    return a1.productIdentifier or a1.ProductIdentifier or a1.identifier or a1.Identifier
end

local function getCandidateInfoType(a1) -- Line: 101 -- upvalues: resolveInfoType (val)
    if type(a1) ~= "table" then
        return Enum.InfoType.Product
    end
    return resolveInfoType(a1.infoType) or resolveInfoType(a1.InfoType) or resolveInfoType(a1.type) or resolveInfoType(a1.Type)
end

local function getCandidateKey(a1, a2) -- Line: 112 -- types: a2: string
    if type(a1) == "table" then
        local key = a1.key or a1.Key
        if type(key) == "string" and key ~= "" then
            return key
        end
    end
    return a2
end

function u9.getIdentifierKey(a1, a2) -- Line: 123 -- types: a1: number
    local Name = a2.Name or tostring(a2)
    return (("%*:%*"):format(Name, a1))
end

function u9.normalizeCandidate(a1, a2) -- Line: 127 -- upvalues: resolveInfoType (val), u9 (val) -- types: a2: number?
    local v1
    local v2 = a1
    local productIdentifier = if type(a1) == "table" then a1.productIdentifier or a1.ProductIdentifier or a1.identifier or a1.Identifier else nil
    local v3 = if not productIdentifier then a1 else productIdentifier
    if type(v3) == "number" then
        v1 = v3
    elseif type(v3) == "table" then
        local productId = v3.productId or v3.ProductId or v3.id or v3.Id or v3.targetId or v3.TargetId
        v1 = if type(productId) ~= "number" then nil else productId
    else
        v1 = nil
    end
    local Product = if type(v3) == "table" then resolveInfoType(v3.infoType) or resolveInfoType(v3.InfoType) or resolveInfoType(v3.type) or resolveInfoType(v3.Type) else Enum.InfoType.Product
    if v1 and not (v1 <= 0) and Product then
        local v4
        if Product ~= Enum.InfoType.Product and Product ~= Enum.InfoType.GamePass then
            return nil
        end
        local v5 = u9.getIdentifierKey(v1, Product)
        local v6 = {}
        if type(v2) ~= "table" then
            v4 = v5
        else
            local key = v2.key or v2.Key
            v4 = if type(key) ~= "string" then v5 else if key == "" then v5 else key
        end
        v6.key = v4
        v6.productId = v1
        v6.infoType = Product
        v6.identifierKey = v5
        v6.source = v2
        v6.index = a2 or 0
        return v6
    end
    return nil
end

function u9.normalizeCandidates(a1) -- Line: 158 -- upvalues: Sift (val), u9 (val) -- types: a1: table?
    return Sift.Array.map(a1 or {}, function(a1, a2) -- Line: 161 -- upvalues: u9 (upval)
        return u9.normalizeCandidate(a1, a2)
    end)
end

function u9.createCandidateSignature(a1) -- Line: 166 -- upvalues: Sift (val), u9 (val) -- types: a1: table?
    local v1
    local v2 = {}
    for i, j in a1 or {} do
        if type(j) ~= "string" then
            v1 = u9.normalizeCandidate(j)
            if v1 then
                v2 = Sift.Array.push(v2, (("%*@%*"):format(v1.key, v1.identifierKey)))
            end
        else
            v2 = Sift.Array.push(v2, (("key:%*"):format(j)))
        end
    end
    return table.concat(v2, "|")
end

function u9.getInfoTypes(a1) -- Line: 188 -- upvalues: u9 (val), Sift (val) -- types: a1: table?
    local Name, infoType
    local v1 = {}
    local v2 = {}
    for i, j in u9.normalizeCandidates(a1) do
        infoType = j.infoType
        Name = infoType.Name or tostring(infoType)
        if not v2[Name] then
            v2[Name] = true
            v1 = Sift.Array.push(v1, j.infoType)
        end
    end
    return v1
end

function u9.toProductIdentifiers(a1) -- Line: 203 -- upvalues: u9 (val), Sift (val) -- types: a1: table?
    local v1 = {}
    local v2 = {}
    for i, j in u9.normalizeCandidates(a1) do
        if not v2[j.identifierKey] then
            v2[j.identifierKey] = true
            v1 = Sift.Array.push(v1, {productId = j.productId, infoType = j.infoType})
        end
    end
    return v1
end

function u9.extractResponseProducts(a1) -- Line: 222
    local v1
    if type(a1) ~= "table" then
        return {}
    end
    for i, j in {
        "products",
        "Products",
        "productIdentifiers",
        "ProductIdentifiers",
        "recommendedProducts",
        "RecommendedProducts",
        "items",
        "Items",
    } do
        v1 = a1[j]
        if type(v1) == "table" then
            return v1
        end
    end
    return a1
end

local function getCandidateLookup(a1) -- Line: 248 -- upvalues: u9 (val), Sift (val) -- types: a1: table
    local identifierKey
    local v1 = {}
    local v2 = {}
    for i, j in u9.normalizeCandidates(a1) do
        v1[j.key] = j.key
        identifierKey = j.identifierKey
        v2[identifierKey] = (Sift.Array.push(v2[j.identifierKey] or {}, j.key))
    end
    return v1, v2
end

function u9.buildRankByKey(a1, a2) -- Line: 262
    -- upvalues: getCandidateLookup (val), u9 (val), Sift (val)
    local v1, v2, v3
    local v4 = {}
    local v5, v6 = getCandidateLookup(a1 or {})
    local v7 = 0
    local v8 = a2 or {}
    local v9 = nil
    local v10 = nil
    for i, j in v8, v9, v10 do
        v1 = u9.normalizeCandidate(j)
        v2 = {}
        if type(j) ~= "string" then
            if v1 then
                v3 = v5[v1.key]
                if v3 then
                    v2 = Sift.Array.push(v2, v3)
                end
                for k, n in v6[v1.identifierKey] or {} do
                    v2 = Sift.Array.push(v2, n)
                end
            end
        elseif v5[j] then
            v2 = Sift.Array.push(v2, j)
        elseif v1 then
            v3 = v5[v1.key]
            if v3 then
                v2 = Sift.Array.push(v2, v3)
            end
            for m, i5 in v6[v1.identifierKey] or {} do
                v2 = Sift.Array.push(v2, i5)
            end
        end
        for i6, i7 in v2 do
            if v4[i7] == nil then
                v7 = v7 + 1
                v4[i7] = v7
            end
        end
    end
    return v4
end

function u9.orderByRank(a1, a2, a3) -- Line: 296 -- upvalues: Sift (val) -- types: a1: table, a2: table?, a3: function
    return Sift.Array.map(Sift.Array.sort(Sift.Array.map(a1, function(a1, a2_2) -- Line: 297 -- upvalues: a3 (val), a2 (val)
        local v1 = a3(a1)
        local v2 = {value = a1, index = a2_2}
        v2.rank = v1 and a2 and a2[v1] or nil
        return v2
    end), function(a1, a2) -- Line: 306
        if a1.rank and a2.rank and a1.rank ~= a2.rank then
            return a1.rank < a2.rank
        end
        if a1.rank and not a2.rank then
            return true
        end
        if a2.rank and not a1.rank then
            return false
        end
        return a1.index < a2.index
    end), function(a1) -- Line: 322
        return a1.value
    end)
end

function u9.orderCandidates(a1, a2) -- Line: 327 -- upvalues: Sift (val), u9 (val) -- types: a1: table?, a2: table?
    return u9.orderByRank(Sift.Array.copy(a1 or {}), a2, function(a1) -- Line: 330 -- upvalues: u9 (upval)
        local v1 = u9.normalizeCandidate(a1)
        return v1 and v1.key or nil
    end)
end

return u9
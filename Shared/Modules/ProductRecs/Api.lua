-- Script path: ReplicatedStorage.Shared.Modules.ProductRecs.Api
-- Decompile time: 2.66 ms

local MarketplaceService = game:GetService("MarketplaceService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Rank = require(ReplicatedStorage.Shared.Modules.ProductRecs.Rank)
local Sift = require(ReplicatedStorage.Packages.Sift)
local v1 = {}

local function normalizeResponse(a1) -- Line: 17 -- upvalues: Rank (val)
    return Rank.normalizeCandidates(Rank.extractResponseProducts(a1))
end

local function callMethod(a1, a2, a3) -- Line: 21 -- types: a2: string
    local u3 = a1[a2]
    if type(u3) ~= "function" then
        return false, "unsupported"
    end
    return pcall(function() -- Line: 27 -- upvalues: u3 (val), a1 (val), a3 (val)
        return u3(a1, a3)
    end)
end

local function buildIdentifierVariants(a1) -- Line: 32 -- upvalues: Rank (val), Sift (val) -- types: a1: table
    local v1 = {{}, {}, {}, {}}
    local v2 = {}
    for i, j in (Rank.normalizeCandidates(a1)) do
        if not v2[j.identifierKey] then
            v2[j.identifierKey] = true
            v1[1] = (Sift.Array.push(v1[1], {productId = j.productId, infoType = j.infoType}))
            v1[2] = (Sift.Array.push(v1[2], {id = j.productId, infoType = j.infoType}))
            v1[3] = (Sift.Array.push(v1[3], {Id = j.productId, InfoType = j.infoType}))
            v1[4] = (Sift.Array.push(v1[4], {ProductId = j.productId, InfoType = j.infoType}))
        end
    end
    return v1
end

function v1.rankProducts(a1, a2) -- Line: 70
    -- upvalues: Rank (val), MarketplaceService (val), buildIdentifierVariants (val)
    local result, success, v1, v2, v3
    if #Rank.normalizeCandidates(a1) == 0 then
        return {ok = false, source = "empty", error = "empty"}
    end
    local u9 = a2
    if not u9 then
        u9 = MarketplaceService
    end
    local v4 = nil
    for i, j in buildIdentifierVariants(a1) do
        local RankProductsAsync = u9.RankProductsAsync
        if type(RankProductsAsync) == "function" then
            success, result = pcall(function() -- Line: 27 -- upvalues: RankProductsAsync (val), u9 (val), j (val)
                return RankProductsAsync(u9, j)
            end)
            v3 = success
            v1 = result
        else
            v3 = false
            v1 = "unsupported"
        end
        if v3 then
            v2 = Rank.normalizeCandidates(Rank.extractResponseProducts(v1))
            if #v2 == 0 then
                return {ok = false, source = "empty", error = "empty", raw = v1}
            end
            return {ok = true, source = "rankProducts", products = v2, raw = v1}
        end
        v4 = v1
        if v1 == "unsupported" then
            break
        end
    end
    return {ok = false, source = if v4 ~= "unsupported" then "error" else "unsupported", error = v4}
end

function v1.recommendTopProducts(a1, a2) -- Line: 117
    -- upvalues: MarketplaceService (val), Rank (val)
    local v1, v2
    if #a1 == 0 then
        return {ok = false, source = "empty", error = "empty"}
    end
    local u5 = a2
    if not u5 then
        u5 = MarketplaceService
    end
    local RecommendTopProductsAsync = u5.RecommendTopProductsAsync
    if type(RecommendTopProductsAsync) == "function" then
        local success, result = pcall(function() -- Line: 27 -- upvalues: RecommendTopProductsAsync (val), u5 (val), a1 (val)
            return RecommendTopProductsAsync(u5, a1)
        end)
        v1 = success
        v2 = result
    else
        v1 = false
        v2 = "unsupported"
    end
    if not v1 then
        return {ok = false, source = if v2 ~= "unsupported" then "error" else "unsupported", error = v2}
    end
    local v3 = Rank.normalizeCandidates(Rank.extractResponseProducts(v2))
    if #v3 == 0 then
        return {ok = false, source = "empty", error = "empty", raw = v2}
    end
    return {ok = true, source = "recommendTopProducts", products = v3, raw = v2}
end

return v1
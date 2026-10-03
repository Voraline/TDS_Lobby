-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useProductRecommendations
-- Decompile time: 2.91 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ProductRecs = ReplicatedStorage.Shared.Modules.ProductRecs
local Api = require(ProductRecs.Api)
local Rank = require(ProductRecs.Rank)
local React = require(ReplicatedStorage.Shared.UI.React)
local useCallback = React.useCallback
local useEffect = React.useEffect
local useState = React.useState
local u22 = {}

local function buildState(a1, a2, a3, a4, a5, a6) -- Line: 49
    -- upvalues: Rank (val)
    local v1 = a2 or {}
    return {
        orderedCandidates = Rank.orderCandidates(a1, v1),
        rankByKey = v1,
        loading = a3,
        error = a4,
        source = a5,
        refresh = a6,
    }
end

local function buildFallbackRank(a1, a2, a3) -- Line: 69
    -- upvalues: Rank (val)
    if a3 and a2 and #a2 ~= 0 then
        return Rank.buildRankByKey(a1, a2)
    end
    return {}
end

local function getRecommendation(a1, a2) -- Line: 81 -- upvalues: Api (val), Rank (val) -- types: a1: string, a2: table
    if a1 ~= "recommendTop" and a1 ~= "top" then
        return Api.rankProducts(a2)
    end
    return Api.recommendTopProducts(Rank.getInfoTypes(a2))
end

return function(a1) -- Line: 89
    -- upvalues: useState (val), useCallback (val), Rank (val), buildState (val), useEffect (val), u22 (val), Api (val)
    local candidates = a1.candidates
    if not candidates then
        candidates = {}
    end
    local u5 = a1.mode or "rank"
    local u8 = a1.enabled == true
    local v1, u12 = useState(0)
    local u16 = useCallback(function() -- Line: 94 -- upvalues: u12 (val)
        u12(function(a1) -- Line: 95
            return a1 + 1
        end)
    end, {})
    local v2 = Rank.createCandidateSignature(candidates)
    local v3 = Rank.createCandidateSignature(a1.manualOrder)
    local u40 = ("%*:%*:%*:%*:%*"):format(tostring(a1.cacheKey or "default"), u5, v2, v3, v1)
    local v4, u44 = useState(function() -- Line: 105 -- upvalues: buildState (upval), candidates (val), u16 (val)
        return (buildState(candidates, {}, false, nil, "disabled", u16))
    end)
    local v5 = useEffect
    local v6 = {u8, u40, a1.refreshKey, v1}
    v5(function() -- Line: 109
        -- upvalues: u8 (val), u44 (val), buildState (upval), candidates (val), u16 (val), Rank (upval), u22 (upval)
        -- upvalues: u40 (val), a1 (val), u5 (val), Api (upval)
        if not u8 then
            u44((buildState(candidates, {}, false, nil, "disabled", u16)))
            return
        end
        local u14 = Rank.normalizeCandidates(candidates)
        if #u14 == 0 then
            u44((buildState(candidates, {}, false, "empty", "empty", u16)))
            return
        end
        local v1 = u22[u40]
        if v1 and v1.refreshKey == a1.refreshKey then
            u44((buildState(candidates, v1.rankByKey, false, v1.error, v1.source, u16)))
            return
        end
        local u42 = false
        local v2 = candidates
        local manualOrder = a1.manualOrder
        local u53 = if not u8 then {} else if not manualOrder then {} else if #manualOrder ~= 0 then Rank.buildRankByKey(v2, manualOrder) else {}
        u44((buildState(candidates, u53, true, nil, "loading", u16)))
        task.spawn(function() -- Line: 140
            -- upvalues: u5 (upval), u14 (val), Api (upval), Rank (upval), u53 (val), candidates (upval), u22 (upval)
            -- upvalues: u40 (upval), a1 (upval), u42 (ref), u44 (upval), buildState (upval), u16 (upval)
            local v1 = u5
            local v2 = u14
            local v3 = if v1 == "recommendTop" then Api.recommendTopProducts(Rank.getInfoTypes(v2)) else if v1 ~= "top" then Api.rankProducts(v2) else Api.recommendTopProducts(Rank.getInfoTypes(v2))
            v1 = u53
            local source = if not next(u53) then v3.source else "manual"
            local error = v3.error
            if v3.ok and v3.products then
                local v4 = Rank.buildRankByKey(candidates, v3.products)
                if next(v4) then
                    v1 = v4
                    source = v3.source
                    error = nil
                end
            end
            local v5 = u40
            u22[v5] = {rankByKey = v1, error = error, source = source, refreshKey = a1.refreshKey}
            if u42 then
                return
            end
            u44((buildState(candidates, v1, false, error, source, u16)))
        end)
        return function() -- Line: 170 -- upvalues: u42 (ref)
            u42 = true
        end
    end, v6)
    return (buildState(candidates, v4.rankByKey, v4.loading, v4.error, v4.source, u16))
end
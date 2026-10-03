-- Script path: ReplicatedStorage.Shared.Modules.PVPUtilities
-- Decompile time: 1.63 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
require(ReplicatedStorage.Shared.Types.PVPConstantTypes)
local PVPConstants = require(script.Parent.PVPConstants)
return {
    getSpawnAmount = function(a1, a2, a3) -- Line: 10 -- types: a1: number, a3: number
        local PurchaseAmountEndWave = a2.PurchaseAmountEndWave or a3 or 40
        local v1 = a2.StartWave or 1
        local v2 = a2.PurchaseAmount or 1
        local v3 = a2.PurchaseAmountEnd or v2
        local v4 = math.floor(v3 * (math.min((math.max(a1 - v1, 0)) / PurchaseAmountEndWave, 1)) + v2)
        if v4 ~= v4 then
            return v3
        end
        return v4
    end,
    getRankFromRating = function(a1) -- Line: 27 -- upvalues: Enum (val), PVPConstants (val) -- types: a1: number
        local Unranked = Enum.Rank.Unranked
        local v1 = PVPConstants.RANK_DATA[Unranked]
        local v2 = tonumber(a1) or 0
        for i, j in PVPConstants.RANK_DATA do
            if j.RankRange.Min <= v2 and v2 <= j.RankRange.Max then
                return i, j
            end
        end
        return Unranked, v1
    end,
    getRankAverages = function(a1, a2) -- Line: 42 -- types: a2: boolean
        local Rating, v1, v2
        local v3 = {}
        local v4 = {}
        local v5 = nil
        local v6 = nil
        for i, j in a1, v5, v6 do
            v2 = v3[j.Team]
            Rating = if not a2 then j.Session.Data.CasualPVPRating.Rating else j.Session.Data.RankedPVPRating.Rating
            if v2 ~= nil then
                v2.Rating = v2.Rating + Rating.Rating
            else
                v2 = {Rating = Rating.Rating}
                v3[j.Team] = v2
            end
            v4[j.Team] = (v4[j.Team] or 0) + 1
        end
        v5 = nil
        v6 = nil
        for k, n in v3, v5, v6 do
            for m, i5 in v3[k] do
                v1 = v3[k]
                v1[m] = v1[m] / v4[k]
            end
        end
        return v3
    end,
}
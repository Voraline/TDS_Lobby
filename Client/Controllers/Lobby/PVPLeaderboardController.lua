-- Script path: ReplicatedStorage.Client.Controllers.Lobby.PVPLeaderboardController
-- Decompile time: 2.15 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ClientAtoms = require(ReplicatedStorage.Shared.Modules.ClientAtoms)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local PVPUtilities = require(ReplicatedStorage.Shared.Modules.PVPUtilities)
local Sift = require(ReplicatedStorage.Packages.Sift)
local v1 = {}
local u30 = {}
local pvpLeaderboardPlayers = ClientAtoms.pvpLeaderboardPlayers
local PVPLeaderboard = NewNetwork.Channel("PVPLeaderboard")

local function updateLeaderboardState() -- Line: 15
    -- upvalues: pvpLeaderboardPlayers (val), u30 (ref), Sift (val), PVPUtilities (val), Enum (val)
    pvpLeaderboardPlayers(function(a1) -- Line: 16 -- upvalues: u30 (upval), Sift (upval), PVPUtilities (upval), Enum (upval)
        return (Sift.Array.map(table.clone(u30), function(a1, a2) -- Line: 18 -- upvalues: PVPUtilities (upval), Enum (upval)
            local v1 = tonumber(a1.key)
            local v2 = tonumber(a1.value.elo) or -1
            local v3 = PVPUtilities.getRankFromRating(v2)
            return {
                userId = v1,
                rank = if not v3 then Enum.Rank.PrivateI else v3,
                wins = a1.value.wins or 0,
                losses = a1.value.losses or 0,
                globalRank = a2,
            }
        end))
    end)
end

function v1.init() -- Line: 37
    -- upvalues: PVPLeaderboard (val), u30 (ref), pvpLeaderboardPlayers (val), Sift (val), PVPUtilities (val)
    -- upvalues: Enum (val)
    PVPLeaderboard:onEvent("LeaderboardMonthlyUpdated", function(a1) -- Line: 38
        -- upvalues: u30 (upval), pvpLeaderboardPlayers (upval), Sift (upval), PVPUtilities (upval), Enum (upval)
        u30 = a1
        pvpLeaderboardPlayers(function(a1) -- Line: 16 -- upvalues: u30 (upval), Sift (upval), PVPUtilities (upval), Enum (upval)
            return (Sift.Array.map(table.clone(u30), function(a1, a2) -- Line: 18 -- upvalues: PVPUtilities (upval), Enum (upval)
                local v1 = tonumber(a1.key)
                local v2 = tonumber(a1.value.elo) or -1
                local v3 = PVPUtilities.getRankFromRating(v2)
                return {
                    userId = v1,
                    rank = if not v3 then Enum.Rank.PrivateI else v3,
                    wins = a1.value.wins or 0,
                    losses = a1.value.losses or 0,
                    globalRank = a2,
                }
            end))
        end)
    end)
    PVPLeaderboard:onEvent("LeaderboardMonthlyKeyUpdated", function(a1, a2) -- Line: 45
        -- upvalues: Sift (upval), u30 (upval), pvpLeaderboardPlayers (upval), PVPUtilities (upval), Enum (upval)
        local v1 = u30
        local v2 = Sift.Array.findWhere(v1, function(a1_2) -- Line: 46 -- upvalues: a1 (val)
            return a1_2.key == a1
        end)
        if v2 then
            u30[v2] = a2
        else
            table.insert(u30, a2)
            table.sort(u30, function(a1, a2) -- Line: 53
                return a2.sortKey < a1.sortKey
            end)
        end
        pvpLeaderboardPlayers(function(a1) -- Line: 16 -- upvalues: u30 (upval), Sift (upval), PVPUtilities (upval), Enum (upval)
            return (Sift.Array.map(table.clone(u30), function(a1, a2) -- Line: 18 -- upvalues: PVPUtilities (upval), Enum (upval)
                local v1 = tonumber(a1.key)
                local v2 = tonumber(a1.value.elo) or -1
                local v3 = PVPUtilities.getRankFromRating(v2)
                return {
                    userId = v1,
                    rank = if not v3 then Enum.Rank.PrivateI else v3,
                    wins = a1.value.wins or 0,
                    losses = a1.value.losses or 0,
                    globalRank = a2,
                }
            end))
        end)
    end)
    PVPLeaderboard:fireServer("Request")
end

task.spawn(v1.init)
return v1
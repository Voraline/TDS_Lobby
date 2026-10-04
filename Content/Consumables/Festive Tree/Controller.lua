-- Script path: ReplicatedStorage.Content.Consumables.Festive Tree.Controller
-- Decompile time: 2.60 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local ServerStorage = game:GetService("ServerStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Player = require(ServerStorage.Server.Modules.Player)
local TeamOctrees = require(ReplicatedStorage.Shared.Modules.TeamOctrees)
local TimerClass = require(ReplicatedStorage.Shared.Modules.TimerClass)
require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TowerService = require(ServerStorage.Server.Services.Game.TowerService)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
local u56 = {}

local function TrackTree(a1, a2) -- Line: 29 -- upvalues: u56 (val) -- types: a1: table
    local v1 = u56[a1]
    if not v1 then
        u56[a1] = {Count = 0, Trees = {}}
    end
    if not v1.Trees[a2] then
        v1.Trees[a2] = true
        v1.Count = v1.Count + 1
    end
end

local function UntrackTree(a1, a2) -- Line: 45 -- upvalues: u56 (val) -- types: a1: table
    local v1 = u56[a1]
    if not v1 then
        return
    end
    if v1.Trees[a2] then
        v1.Trees[a2] = nil
        v1.Count = v1.Count - 1
    end
end

local function TowerHasNoTrackers(a1) -- Line: 57 -- upvalues: u56 (val) -- types: a1: table
    return not u56[a1] or u56[a1].Count <= 0
end

return {
    CreateContext = function(a1) -- Line: 62
        a1.lifeTime = 45
        a1.radius = 16
        a1.buff = 30
    end,
    OnUse = function(a1) -- Line: 68
        -- upvalues: TypedPromise (val), Players (val), Player (val), TeamOctrees (val), u56 (val), Enum (val)
        -- upvalues: TrackTree (val), TowerService (val), TimerClass (val)
        return TypedPromise.new(function(a1_2, a2, a3) -- Line: 69
            -- upvalues: a1 (val), Players (upval), Player (upval), TeamOctrees (upval), u56 (upval), Enum (upval)
            -- upvalues: TrackTree (upval), TowerService (upval), TimerClass (upval)
            local Context = a1.Context
            local Replicator = a1.Replicator
            local playerId = Context.playerId
            local PlayerByUserId = Players:GetPlayerByUserId(playerId)
            local u17 = PlayerByUserId
            if u17 then
                u17 = Player.GetEntityFromPlayer(PlayerByUserId)
            end
            if not PlayerByUserId then
                a2("Invalid player")
                return
            end
            local u23 = {}
            local buff = Context.buff

            local function buffNearbyTowers() -- Line: 82
                -- upvalues: TeamOctrees (upval), u17 (val), Context (val), u23 (val), u56 (upval), Enum (upval)
                -- upvalues: buff (val), TrackTree (upval), a1 (upval)
                local v1 = TeamOctrees.getTeammates(u17.Team, Context.position, Context.radius)
                if v1 and #v1 > 0 then
                    for i, v in ipairs(v1) do
                        if v.Type ~= "Units" and not u23[v] then
                            if not u56[v] or u56[v].Count <= 0 then
                                v.StatusEffects:addDtMultiplier(Enum.StatusEffect.Stunned, "FestiveTree", buff)
                                if not v.StatusEffects:has(Enum.StatusEffect.FreezeImmune) then
                                    v.StatusEffects:addDtMultiplier(Enum.StatusEffect.Frozen, "FestiveTree", buff)
                                end
                            end
                            TrackTree(v, a1)
                            u23[v] = true
                        end
                    end
                end
            end

            local u33 = TowerService.TowerSpawnedEvent:Connect(buffNearbyTowers)
            buffNearbyTowers()
            local u44 = TimerClass.new("FestiveTree", Context.lifeTime, nil, nil, true, true)
            u44.OnSecond:Connect(function(a1) -- Line: 122 -- upvalues: Replicator (val) -- types: a1: number
                Replicator:Set("Health", a1)
            end)
            Replicator:Set("Health", Context.lifeTime)
            Replicator:Set("MaxHealth", Context.lifeTime)

            local function cleanUp() -- Line: 128
                -- upvalues: u33 (ref), u23 (val), a1 (upval), u56 (upval), Enum (upval), u44 (val)
                local v1, v2
                if u33 then
                    u33:Disconnect()
                    u33 = nil
                end
                for k, v in pairs(u23) do
                    u23[k] = nil
                    v1 = a1
                    v2 = u56[k]
                    if v2 and v2.Trees[v1] then
                        v2.Trees[v1] = nil
                        v2.Count = v2.Count - 1
                    end
                    if not u56[k] or u56[k].Count <= 0 then
                        k.StatusEffects:removeDtMultiplier(Enum.StatusEffect.Stunned, "FestiveTree")
                        k.StatusEffects:removeDtMultiplier(Enum.StatusEffect.Frozen, "FestiveTree")
                    end
                end
                u44:Destroy()
            end

            u44.OnFinish:Connect(function() -- Line: 152 -- upvalues: cleanUp (val), a1_2 (val)
                cleanUp()
                a1_2()
            end)
            a3(cleanUp)
        end)
    end,
}
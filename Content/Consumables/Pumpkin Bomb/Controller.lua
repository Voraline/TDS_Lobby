-- Script path: ReplicatedStorage.Content.Consumables.Pumpkin Bomb.Controller
-- Decompile time: 2.94 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local Damage = require(ServerStorage.Server.Modules.Damage)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local PlayerService = require(ServerStorage.Server.Services.Shared.PlayerService)
local TeamOctrees = require(ReplicatedStorage.Shared.Modules.TeamOctrees)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
local WeightTable = require(ReplicatedStorage.Shared.Modules.WeightTable)
local u56 = {}

function u56.Nimble(a1) -- Line: 17 -- upvalues: Enum (val) -- types: a1: table
    a1.StatusEffects:apply(Enum.StatusEffect.Nimble, "innate")
end

function u56.Bloated(a1) -- Line: 20 -- upvalues: Enum (val) -- types: a1: table
    a1.StatusEffects:apply(Enum.StatusEffect.Bloated, "innate")
end

u56["Health Regen"] = function(a1) -- Line: 23 -- upvalues: Enum (val) -- types: a1: table
    a1.StatusEffects:apply(Enum.StatusEffect.HealthRegen, "innate")
end

local u60 = {}

function u60.Freeze(a1) -- Line: 29 -- upvalues: Enum (val) -- types: a1: table
    a1:ApplyDebuff(Enum.DebuffType.Freeze, 2, {DefenseMelt = 20})
end

u60["Remove Detections"] = function(a1) -- Line: 34 -- upvalues: Enum (val) -- types: a1: table
    a1.StatusEffects:remove(Enum.StatusEffect.Aggro)
    a1.StatusEffects:remove(Enum.StatusEffect.Hidden)
end

u60["Bleed Stack"] = function(a1, a2) -- Line: 39 -- upvalues: Players (val), Enum (val) -- types: a1: table
    local PlayerByUserId = Players:GetPlayerByUserId(a2.Context.playerId)
    if not PlayerByUserId then
        return
    end
    for i = 1, 3 do
        a1:ApplyDebuff(Enum.DebuffType.Bleed, 0, {MaxStacks = 10, WaitTimeTilDamage = 0.65, EV = 0.375, BaseDamage = 2}, PlayerByUserId)
    end
end

return {
    CreateContext = function(a1) -- Line: 58 -- upvalues: Players (val), WeightTable (val)
        local Position = Vector3.new(0, 0, 0)
        local PlayerByUserId = Players:GetPlayerByUserId(a1.playerId)
        if PlayerByUserId and PlayerByUserId.Character then
            Position = PlayerByUserId.Character.PrimaryPart.Position
        end
        a1.lifeTime = math.max(0.5, (Position - a1.position).Magnitude / 100)
        a1.noise = Random.new():NextNumber()
        a1.dtMultiplier = 6
        a1.gravity = -1
        a1.velocity = 2
        a1.useData = {
            explosionDamage = 120,
            explosionRadius = 6,
            weightedTable = WeightTable.new({{Chance = 60, Value = "debuffs"}, {Chance = 40, Value = "buff"}}),
        }
        a1.use = a1.useData.weightedTable:Select().Value
    end,
    OnUse = function(a1) -- Line: 88
        -- upvalues: TypedPromise (val), Players (val), ItemDrop (val), TeamOctrees (val), Enum (val), u56 (val)
        -- upvalues: u60 (val), PlayerService (val), Damage (val)
        return TypedPromise.new(function(a1_2, a2, a3) -- Line: 89
            -- upvalues: a1 (val), Players (upval), ItemDrop (upval), TypedPromise (upval), TeamOctrees (upval)
            -- upvalues: Enum (upval), u56 (upval), u60 (upval), PlayerService (upval), Damage (upval)
            local Context = a1.Context
            local PlayerByUserId = Players:GetPlayerByUserId(Context.playerId)
            if not PlayerByUserId then
                a2("Invalid player")
                return
            end
            local v1 = (ItemDrop.GetTimeToDestinationWithGV(
                PlayerByUserId.Character.PrimaryPart.Position,
                Context.position,
                Context.gravity,
                Context.velocity
            )) / Context.dtMultiplier
            local u37 = ((TypedPromise.delay(v1)):andThen(function() -- Line: 106
                -- upvalues: TeamOctrees (upval), Enum (upval), Context (val), u56 (upval), u60 (upval)
                -- upvalues: PlayerService (upval), a1 (upval), Damage (upval), a1_2 (val)
                local v1 = TeamOctrees.getTargets(Enum.Team.Player, Context.position, Context.useData.explosionRadius)
                local v2 = {}
                for i, j in not (Context.use ~= "buff") and u56 or u60 do
                    table.insert(v2, {name = i, hook = j})
                end
                if #v2 == 0 then
                    return
                end
                local v3 = v2[math.random(1, #v2)]
                local v4 = PlayerService.GetEntityFromPlayer(a1.Executor)
                local v5 = nil
                local v6 = nil
                for k, n in v1, v5, v6 do
                    if n.Type ~= "Towers" then
                        if Context.use ~= "buff" then
                            Damage.dealDamage({Owner = v4}, n, Context.useData.explosionDamage, Enum.DamageType.Energy)
                        end
                        v3.hook(n, a1)
                    end
                end
                a1_2()
            end)):finally(a1_2)
            a3(function() -- Line: 149 -- upvalues: u37 (ref)
                if u37 then
                    u37:cancel()
                end
            end)
        end)
    end,
}
-- Script path: ReplicatedStorage.Content.Consumables.Easter Egg.Controller
-- Decompile time: 2.86 ms

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local TeamOctrees = require(ReplicatedStorage.Shared.Modules.TeamOctrees)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local u51 = {}
local u52 = {}

function u52.Hidden(a1, a2) -- Line: 20 -- upvalues: u51 (val), Enum (val), TimescaleUtilities (val)
    if u51[a2].Hidden then
        a2.StatusEffects:removeBySource(Enum.StatusEffect.HiddenDetection, "EasterEgg_" .. u51[a2].Hidden)
    end
    u51[a2].Hidden = a1
    a2.StatusEffects:apply(Enum.StatusEffect.HiddenDetection, "EasterEgg_" .. a1, 20)
    TimescaleUtilities.Delay(20, function() -- Line: 35 -- upvalues: u51 (upval), a2 (val), a1 (val)
        if u51[a2].Hidden ~= a1 then
            return
        end
        local v1 = u51[a2]
        v1.Hidden = nil
    end)
end

function u52.Range(a1, a2) -- Line: 42 -- upvalues: u51 (val), Enum (val), TimescaleUtilities (val)
    if u51[a2].Range then
        a2:UpdateBuff("Range", "RangeEasterEgg", 0, u51[a2].Range)
    end
    u51[a2].Range = a1
    a2:Buff({
        Type = "Range",
        Name = "RangeEasterEgg",
        Stackable = false,
        Value = 30,
        UID = a1,
    })
    a2.AbilityEffects:AddTimed(Enum.BuffType.Range, 20)
    TimescaleUtilities.Delay(20, function() -- Line: 60 -- upvalues: u51 (upval), a2 (val), a1 (val)
        if u51[a2].Range ~= a1 then
            return
        end
        local v1 = u51[a2]
        v1.Range = nil
        a2:UpdateBuff("Range", "RangeEasterEgg", 0, a1)
    end)
end

function u52.Speed(a1, a2) -- Line: 69 -- upvalues: u51 (val), Enum (val), TimescaleUtilities (val)
    if u51[a2].Speed then
        a2:UpdateBuff("Cooldown", "SpeedEasterEgg", 0, u51[a2].Speed)
    end
    u51[a2].Speed = a1
    a2:Buff({
        Type = "Cooldown",
        Name = "SpeedEasterEgg",
        Stackable = false,
        Value = 30,
        UID = a1,
    })
    a2.AbilityEffects:AddTimed(Enum.BuffType.Cooldown, 20)
    TimescaleUtilities.Delay(20, function() -- Line: 87 -- upvalues: u51 (upval), a2 (val), a1 (val)
        if u51[a2].Speed ~= a1 then
            return
        end
        local v1 = u51[a2]
        v1.Speed = nil
        a2:UpdateBuff("Cooldown", "SpeedEasterEgg", 0, a1)
    end)
end

local function giveBuff(a1) -- Line: 98 -- upvalues: HttpService (val), table (val), u52 (val), u51 (val)
    local v1 = HttpService:GenerateGUID(false)
    local v2 = table.shuffle(table.keys(u52))[1]
    if not u51[a1] then
        u51[a1] = {}
    end
    u52[v2](v1, a1)
end

return {
    CreateContext = function(a1) -- Line: 110 -- upvalues: Players (val)
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
        a1.useData = {explosionDamage = 120, explosionRadius = 6}
    end,
    OnUse = function(a1) -- Line: 133
        -- upvalues: TypedPromise (val), Players (val), ItemDrop (val), TeamOctrees (val), Enum (val), giveBuff (val)
        return TypedPromise.new(function(a1_2, a2, a3) -- Line: 134
            -- upvalues: a1 (val), Players (upval), ItemDrop (upval), TypedPromise (upval), TeamOctrees (upval)
            -- upvalues: Enum (upval), giveBuff (upval)
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
            local u37 = ((TypedPromise.delay(v1)):andThen(function() -- Line: 151 -- upvalues: TeamOctrees (upval), Enum (upval), Context (val), giveBuff (upval), a1_2 (val)
                for i, j in (TeamOctrees.getTeammates(Enum.Team.Player, Context.position, Context.useData.explosionRadius)) do
                    if j.Type == "Towers" then
                        giveBuff(j)
                    end
                end
                a1_2()
            end)):finally(a1_2)
            a3(function() -- Line: 169 -- upvalues: u37 (ref)
                if u37 then
                    u37:cancel()
                end
            end)
        end)
    end,
}
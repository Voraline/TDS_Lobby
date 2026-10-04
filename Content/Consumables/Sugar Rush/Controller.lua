-- Script path: ReplicatedStorage.Content.Consumables.Sugar Rush.Controller
-- Decompile time: 2.61 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TowerService = require(ServerStorage.Server.Services.Game.TowerService)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
local u42 = Random.new()
return {
    CreateContext = function(a1) -- Line: 21
        a1.MaxDuration = 30
        a1.MinDuration = 10
        a1.FireRate = 60
        a1.FatigueRate = 40
    end,
    OnUse = function(a1) -- Line: 28
        -- upvalues: TypedPromise (val), Players (val), TowerService (val), Enum (val), TimescaleUtilities (val)
        -- upvalues: u42 (val)
        return TypedPromise.new(function(a1_2, a2, a3) -- Line: 29
            -- upvalues: a1 (val), Players (upval), TowerService (upval), TypedPromise (upval), Enum (upval)
            -- upvalues: TimescaleUtilities (upval), u42 (upval)
            local FatigueRate, new, v1, v2
            local Context = a1.Context
            local PlayerByUserId = Players:GetPlayerByUserId(Context.playerId)
            local v3 = TowerService.getAllTowersByPlayer(PlayerByUserId)
            local u14 = {}
            local v4 = 1
            for i, j in v3 do
                local u45 = u42:NextNumber(Context.MinDuration, Context.MaxDuration)
                v4 = math.max(u45, v4)
                local FireRate = Context.FireRate
                new = TypedPromise.new
                local u54 = true
                v1 = new(function(a1, a2, a3) -- Line: 42
                    -- upvalues: u54 (val), FireRate (val), Context (val), j (val), Enum (upval), u45 (val)
                    -- upvalues: TimescaleUtilities (upval)
                    local u3 = {
                        Name = "Candy Bar",
                        Stackable = false,
                        Type = if not u54 then "Fatigue" else "Cooldown",
                        Value = FireRate,
                        UID = Context.playerId,
                    }
                    j:Buff(u3)
                    if u54 and FireRate > 0 then
                        j.AbilityEffects:AddTimed(Enum.BuffType.Cooldown, u45)
                    end
                    a3(function() -- Line: 57 -- upvalues: j (upval), u3 (val)
                        j:CancelBuff(u3)
                    end)
                    TimescaleUtilities.Delay(u45, function() -- Line: 61 -- upvalues: j (upval), u3 (val), a1 (val)
                        j:CancelBuff(u3)
                        a1()
                    end)
                end)
                FatigueRate = Context.FatigueRate
                v2 = u45 / 2
                v1:andThenCall(function(a1, a2, a3, a4) -- Line: 36
                    -- upvalues: TypedPromise (upval), Context (val), Enum (upval), TimescaleUtilities (upval)
                    return TypedPromise.new(function(a1_2, a2_2, a3_2) -- Line: 42
                        -- upvalues: a2 (val), a3 (val), Context (upval), a1 (val), Enum (upval), a4 (val)
                        -- upvalues: TimescaleUtilities (upval)
                        local u3 = {
                            Name = "Candy Bar",
                            Stackable = false,
                            Type = if not a2 then "Fatigue" else "Cooldown",
                            Value = a3,
                        }
                        u3.UID = Context.playerId
                        a1:Buff(u3)
                        if a2 and a3 > 0 then
                            a1.AbilityEffects:AddTimed(Enum.BuffType.Cooldown, a4)
                        end
                        a3_2(function() -- Line: 57 -- upvalues: a1 (upval), u3 (val)
                            a1:CancelBuff(u3)
                        end)
                        TimescaleUtilities.Delay(a4, function() -- Line: 61 -- upvalues: a1 (upval), u3 (val), a1_2 (val)
                            a1:CancelBuff(u3)
                            a1_2()
                        end)
                    end)
                end, j, false, FatigueRate, v2)
                u14[j] = v1
            end
            a3(function() -- Line: 78 -- upvalues: u14 (val)
                for i, j in u14 do
                    j:cancel()
                end
            end)
            TimescaleUtilities.Delay(v4, a1_2)
        end)
    end,
}
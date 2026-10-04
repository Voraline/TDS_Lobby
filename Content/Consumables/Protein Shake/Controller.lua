-- Script path: ReplicatedStorage.Content.Consumables.Protein Shake.Controller
-- Decompile time: 0.70 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local EnemyQueueService = require(ServerStorage.Server.Services.Game.EnemyQueueService)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local Player = require(ServerStorage.Server.Modules.Player)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
return {
    CreateContext = function(a1) -- Line: 12 -- upvalues: Enum (val)
        a1.amount = 3
        a1.modifier = Enum.Modifier.Bloated
    end,
    OnUse = function(a1) -- Line: 17 -- upvalues: TypedPromise (val), Players (val), Player (val), EnemyQueueService (val)
        return TypedPromise.new(function(a1_2, a2) -- Line: 18 -- upvalues: a1 (val), Players (upval), Player (upval), EnemyQueueService (upval)
            local Context = a1.Context
            local playerId = Context.playerId
            local PlayerByUserId = Players:GetPlayerByUserId(playerId)
            if not PlayerByUserId or not Player.GetEntityFromPlayer(PlayerByUserId) then
                a2("Invalid player")
                return
            end
            EnemyQueueService.addModifier(PlayerByUserId, Context.modifier, Context.amount)
            task.wait(0.1)
            a1_2()
        end)
    end,
}
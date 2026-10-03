-- Script path: ReplicatedStorage.Content.Consumables.Graveyard.Controller
-- Decompile time: 0.85 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local EnemyService = require(ServerStorage.Server.Services.Game.EnemyService)
local PlayerService = require(ServerStorage.Server.Services.Shared.PlayerService)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
return {
    CreateContext = function(a1) -- Line: 15
        a1.lifetime = 5
        a1.spawnRate = 0.5
        a1.animTime = 2.63
    end,
    OnUse = function(a1) -- Line: 21
        -- upvalues: TypedPromise (val), PlayerService (val), TimescaleUtilities (val), EnemyService (val)
        local Context = a1.Context
        return TypedPromise.new(function(a1_2, a2, a3) -- Line: 24
            -- upvalues: PlayerService (upval), a1 (val), TimescaleUtilities (upval), Context (val)
            -- upvalues: EnemyService (upval)
            local v1 = PlayerService.GetEntityFromPlayer(a1.Executor)
            TimescaleUtilities.Wait(1)
            local lifetime = Context.lifetime
            local spawnRate = Context.spawnRate
            for i = 0, lifetime, spawnRate do
                EnemyService.CreateEnemy("Normal", "1", v1, nil, nil, nil, nil, {})
                TimescaleUtilities.Wait(Context.spawnRate)
            end
            a1_2()
        end)
    end,
}
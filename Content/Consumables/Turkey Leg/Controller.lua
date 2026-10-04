-- Script path: ReplicatedStorage.Content.Consumables.Turkey Leg.Controller
-- Decompile time: 0.56 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local PlayerService = require(ServerStorage.Server.Services.Shared.PlayerService)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
return {
    CreateContext = function(a1) -- Line: 13
        a1.Heal = 100
    end,
    OnUse = function(a1) -- Line: 17 -- upvalues: TypedPromise (val), PlayerService (val), GameState (val), TimescaleUtilities (val)
        return TypedPromise.new(function(a1_2, a2, a3) -- Line: 18
            -- upvalues: a1 (val), PlayerService (upval), GameState (upval), TimescaleUtilities (upval)
            local Context = a1.Context
            local v1 = PlayerService.GetPlayerByUserId(Context.playerId)
            if v1 then
                GameState.IncrementTeamHealth(v1.Team, Context.Heal)
            end
            TimescaleUtilities.Delay(2, a1_2)
        end)
    end,
}
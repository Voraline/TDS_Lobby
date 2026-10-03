-- Script path: ReplicatedStorage.Content.Consumables.Fruit Cake.Controller
-- Decompile time: 0.75 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local PlayerService = require(ServerStorage.Server.Services.Shared.PlayerService)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
return {
    CreateContext = function(a1) -- Line: 14
        a1.Heal = 5
    end,
    OnUse = function(a1) -- Line: 18 -- upvalues: TypedPromise (val), PlayerService (val), TimescaleUtilities (val), GameState (val)
        return TypedPromise.new(function(a1_2, a2, a3) -- Line: 19
            -- upvalues: a1 (val), PlayerService (upval), TimescaleUtilities (upval), GameState (upval)
            local Context = a1.Context
            local v1 = PlayerService.GetPlayerByUserId(Context.playerId)
            if v1 then
                local Team = v1.Team
                for i = 1, 10 do
                    TimescaleUtilities.Wait(1)
                    GameState.IncrementTeamHealth(Team, Context.Heal)
                end
            end
            TimescaleUtilities.Delay(10, a1_2)
        end)
    end,
}
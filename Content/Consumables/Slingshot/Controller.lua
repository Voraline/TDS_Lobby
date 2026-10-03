-- Script path: ReplicatedStorage.Content.Consumables.Slingshot.Controller
-- Decompile time: 1.04 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Player = require(ServerStorage.Server.Modules.Player)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
return {
    CreateContext = function(a1) -- Line: 12
        a1.healthAmount = 10
    end,
    OnUse = function(a1) -- Line: 16 -- upvalues: TypedPromise (val), Players (val), Player (val), Enum (val), GameState (val)
        return TypedPromise.new(function(a1_2, a2) -- Line: 17 -- upvalues: a1 (val), Players (upval), Player (upval), Enum (upval), GameState (upval)
            local Context = a1.Context
            local playerId = Context.playerId
            local PlayerByUserId = Players:GetPlayerByUserId(playerId)
            local v1 = PlayerByUserId and Player.GetEntityFromPlayer(PlayerByUserId)
            if not v1 then
                a2("Invalid player")
                return
            end
            local Red = if v1.Team ~= Enum.Team.Blue then Enum.Team.Blue else Enum.Team.Red
            GameState.SetTeamHealth(
                Red,
                math.max(1, GameState.HealthPerTeam[Red].Current - Context.healthAmount),
                GameState.HealthPerTeam[Red].Max
            )
            task.wait(0.1)
            a1_2()
        end)
    end,
}
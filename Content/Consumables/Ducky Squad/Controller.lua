-- Script path: ReplicatedStorage.Content.Consumables.Ducky Squad.Controller
-- Decompile time: 0.94 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Player = require(ServerStorage.Server.Modules.Player)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
local UnitService = require(ServerStorage.Server.Services.Game.UnitService)
return {
    CreateContext = function(a1) -- Line: 11
        a1.unitsToSend = {"Fire Ducky", "Confusion Ducky", "Ice Ducky", "Poison Ducky", "Shock Ducky"}
    end,
    OnUse = function(a1) -- Line: 21 -- upvalues: TypedPromise (val), Players (val), Player (val), UnitService (val)
        return TypedPromise.new(function(a1_2, a2) -- Line: 22 -- upvalues: a1 (val), Players (upval), Player (upval), UnitService (upval)
            local Context = a1.Context
            local playerId = Context.playerId
            local PlayerByUserId = Players:GetPlayerByUserId(playerId)
            local v1 = PlayerByUserId and Player.GetEntityFromPlayer(PlayerByUserId)
            if not v1 then
                a2("Invalid player")
                return
            end
            for i, j in Context.unitsToSend do
                UnitService.CreateNewUnit({name = j, owner = v1})
                task.wait(1)
            end
            task.wait(0.1)
            a1_2()
        end)
    end,
}
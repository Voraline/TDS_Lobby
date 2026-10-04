-- Script path: ReplicatedStorage.Content.GlobalModifiers.BanGatlingGun
-- Decompile time: 0.60 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
local TagReplicator = require(ReplicatedStorage.Client.Modules.TagReplicator)
return {
    displayName = "Gatling Gun Banned",
    description = "Gatling Gun is not allowed.",
    icon = 108137113182163,
    onEnableServer = function(a1, a2, a3) -- Line: 14
        -- upvalues: ServerStorage (val), TagReplicator (val), ReplicatedStorage (val), Enum (val)
        local TowerService = require(ServerStorage.Server.Services.Game.TowerService)
        ;(TagReplicator.getReplicatorEntityFromFolder((ReplicatedStorage:WaitForChild("Modifiers")))):Set(
            Enum.GameModifier.BanGatlingGun,
            true
        )
        TowerService.BanTower("Gatling Gun")
        a2:Mark(function() -- Line: 22 -- upvalues: TowerService (val)
            TowerService.UnbanTower("Gatling Gun")
        end)
    end,
}
-- Script path: ReplicatedStorage.Content.GlobalModifiers.RandomTowerPositions
-- Decompile time: 0.99 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local ServerStorage = game:GetService("ServerStorage")
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
local Sift = require(ReplicatedStorage.Packages.Sift)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
return {
    displayName = "Random Tower Positions",
    description = "Existing tower positions randomized.",
    icon = 75665061838625,
    onEnableServer = function(a1, a2, a3) -- Line: 14
        -- upvalues: RunService (val), ServerStorage (val), Sift (val), TimescaleUtilities (val)
        local Position, RepositionTower
        if RunService:IsClient() then
            return
        end
        local TowerService = require(ServerStorage.Server.Services.Game.TowerService)
        local v1 = TowerService.GetTowers()
        local v2 = {}
        for i, j in v1 do
            table.insert(v2, j.Position)
        end
        if #v2 < 2 then
            return
        end
        local v3 = Sift.Array.shuffle(v2)
        local v4 = 1
        local v5 = nil
        local v6 = nil
        for k, n in v1, v5, v6 do
            RepositionTower = TowerService.RepositionTower
            Position = v3[v4] or n.Position
            RepositionTower(n, Position)
            v4 = v4 + 1
        end
        TimescaleUtilities.Delay(5, function() -- Line: 41 -- upvalues: a3 (val)
            a3()
        end)
    end,
}
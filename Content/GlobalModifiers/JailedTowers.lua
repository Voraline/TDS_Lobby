-- Script path: ReplicatedStorage.Content.GlobalModifiers.JailedTowers
-- Decompile time: 1.53 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
local LegacyMiddleware = require(ReplicatedStorage.Shared.Modules.LegacyMiddleware)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
return {
    displayName = "Jailed Towers",
    description = "Every wave a new tower from your loadout is disabled",
    icon = 108282173055832,
    rewardMultiplier = 0.2,
    canToggle = true,
    onEnableServer = function(a1, a2, a3) -- Line: 17
        -- upvalues: ServerStorage (val), Players (val), table (val), Enum (val), LegacyMiddleware (val)
        local TowerService = require(ServerStorage.Server.Services.Game.TowerService)
        a1.middleware(LegacyMiddleware:Hook(LegacyMiddleware.HookType.OnNextWave, LegacyMiddleware.Boundedness.Outbound, function(a1, a2) -- Line: 20 -- upvalues: Players (upval), TowerService (val), table (upval), Enum (upval)
            local Name, v1, v2, v3, v4
            if a2 <= 5 then
                return a2
            end
            for i, j in Players:GetPlayers() do
                v3 = TowerService.getAllTowersByPlayer(j)
                v4 = {}
                Name = nil
                v1 = nil
                v2 = nil
                for k, n in v3, v1, v2 do
                    if not table.find(v4, n.Name) then
                        table.insert(v4, n.Name)
                    end
                    if n.StatusEffects:has(Enum.StatusEffect.Jailed) then
                        Name = n.Name
                        n.StatusEffects:remove(Enum.StatusEffect.Jailed)
                    end
                end
                if Name then
                    table.remove(v4, table.find(v4, Name))
                end
                table.shuffle(v4)
                for m, i5 in v3 do
                    if i5.Name == v4[1] then
                        i5.StatusEffects:apply(Enum.StatusEffect.Jailed, "JailedTowers")
                    end
                end
            end
            return a2
        end))
    end,
}
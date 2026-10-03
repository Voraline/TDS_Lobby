-- Script path: ReplicatedStorage.Content.GlobalModifiers.SandboxUnlocks
-- Decompile time: 6.15 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local Content = require(ReplicatedStorage.Shared.Modules.Content)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local GameRules = require(ReplicatedStorage.Shared.Modules.GameRules)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
local LegacyMiddleware = require(ReplicatedStorage.Shared.Modules.LegacyMiddleware)
local SkillsUtil = require(ReplicatedStorage.Shared.Modules.SkillsUtil)
local math = require(ReplicatedStorage.Shared.Modules.Utils.math)
local Gamemodes = Content("Gamemodes")
local u60 = Random.new()

local function isLogbookDisabled() -- Line: 23 -- upvalues: GameState (val), Gamemodes (val)
    if typeof(GameState.GameMode) == "string" and typeof(GameState.Difficulty) == "string" then
        local v1 = Gamemodes:FindFirstChild(GameState.GameMode)
        local Difficulties = v1 and v1:FindFirstChild("Difficulties")
        local v2 = Difficulties and Difficulties:FindFirstChild(GameState.Difficulty)
        local DisplayInfo = v2 and v2:FindFirstChild("DisplayInfo")
        if DisplayInfo and DisplayInfo:IsA("ModuleScript") then
            local success, result = pcall(require, DisplayInfo)
            local v3 = success
            if v3 then
                v3 = false
                if typeof(result) == "table" then
                    v3 = result.DisableLogbookSpawning == true
                end
            end
            return v3
        end
        return false
    end
    return false
end

return {
    onEnableServer = function(a1, a2, a3) -- Line: 42
        -- upvalues: ServerStorage (val), isLogbookDisabled (val), LegacyMiddleware (val), GameState (val)
        -- upvalues: Players (val), math (val), GameRules (val), Enum (val), SkillsUtil (val), u60 (val)
        local ItemPickupService = require(ServerStorage.Server.Services.Game.ItemPickupService)
        local PlayerService = require(ServerStorage.Server.Services.Shared.PlayerService)
        local u27 = require(ServerStorage.Server.Services.Shared.FFlagService).get("sandbox.enemy-pity-overrides", {})
        local u29 = isLogbookDisabled()
        local u30 = {}
        a1.middleware(LegacyMiddleware:Hook(LegacyMiddleware.HookType.OnRewardCalculated, LegacyMiddleware.Boundedness.Inbound, function(a1, a2) -- Line: 57 -- upvalues: GameState (upval), Players (upval), PlayerService (val)
            local GameMode, Gamemodes, Maps, Session, v1
            if not GameState.Won then
                return a2
            end
            local v2 = Players:GetPlayers()
            local v3 = nil
            local v4 = nil
            for i, j in v2, v3, v4 do
                v1 = PlayerService.GetEntityFromPlayer(j)
                if v1 then
                    Session = v1.Session
                    if Session then
                        Maps = Session.Data.Sandbox.Unlocks.Maps or {}
                        Maps[GameState.MapName] = true
                        Gamemodes = Session.Data.Sandbox.Unlocks.Gamemodes or {}
                        GameMode = GameState.GameMode
                        Gamemodes[(("%*/%*"):format(GameMode, GameState.Difficulty))] = true
                        Session.Data.Sandbox.Unlocks.Maps = Maps
                        Session.Data.Sandbox.Unlocks.Gamemodes = Gamemodes
                    else
                        warn("No session for player", j)
                    end
                else
                    warn("No entity for player", j)
                end
            end
            return a2
        end))
        a1.middleware(LegacyMiddleware:Hook(LegacyMiddleware.HookType.SpawnEnemy, LegacyMiddleware.Boundedness.Outbound, function(a1, a2) -- Line: 97
            -- upvalues: u29 (val), GameState (upval), math (upval), GameRules (upval), Enum (upval), SkillsUtil (upval)
            -- upvalues: u60 (upval), Players (upval), u27 (val), PlayerService (val), u30 (val)
            -- upvalues: ItemPickupService (val)
            if u29 then
                return a2
            end
            if a2.Owner and a2.Owner.UserId then
                return a2
            end
            if GameState.GameMode ~= "Sandbox" and GameState.GameMode ~= "PVP" then
                local v1 = math.clamp(math.map(a2.MaxHealth, 10, 100000, 0.001, 0.05), 0.001, 0.05)
                local v2 = if not GameRules.HasSkill(Enum.SkillTreeNode.Scholar) then 0 else SkillsUtil.avgSkillEval(Enum.SkillTreeNode.Scholar) / 100
                local u46 = (u60:NextNumber()) <= v1 + v2
                a2.OnDeath:Connect(function() -- Line: 125
                    -- upvalues: Players (upval), u46 (val), u27 (upval), PlayerService (upval), a2 (val), u30 (upval)
                    -- upvalues: ItemPickupService (upval), Enum (upval), u60 (upval)
                    local Enemies, EnemyLorebook, PityStats, Position, ReplicationFolder, Session, new, v1, v2, v3, v4, v5, v6
                    local Players_2 = Players:GetPlayers()
                    if #Players_2 == 0 then
                        return
                    end
                    if u46 then
                        local Enemies_2, Session_2, v7
                        v1 = nil
                        while not v1 do
                            if not (#Players_2 > 0) then
                                break
                            end
                            v7 = u60:NextInteger(1, #Players_2)
                            v1 = Players_2[v7]
                            v4 = false
                            v5 = PlayerService.GetEntityFromPlayer(v1)
                            if v5 then
                                Session_2 = v5.Session
                                if Session_2 then
                                    Enemies_2 = Session_2.Data.Sandbox.Unlocks.Enemies or {}
                                    v4 = Enemies_2[a2.Name] ~= true
                                end
                                if u30[v1] then
                                    v4 = not u30[v1][a2.Name]
                                end
                            end
                            if not v4 then
                                v1 = nil
                                table.remove(Players_2, v7)
                            end
                        end
                        if not v1 then
                            return
                        end
                        v7 = u30[v1] or {}
                        v7[a2.Name] = true
                        u30[v1] = v7
                        ItemPickupService.new(
                            Enum.ItemPickupType.EnemyLorebook,
                            a2.Position,
                            a2.Replicator.ReplicationFolder,
                            nil,
                            {v1},
                            {name = a2.Name},
                            0
                        )
                        return
                    end
                    v1 = u27()
                    v4 = nil
                    v5 = nil
                    for i, j in Players_2, v4, v5 do
                        v6 = PlayerService.GetEntityFromPlayer(j)
                        if v6 then
                            Session = v6.Session
                            if Session then
                                Enemies = Session.Data.Sandbox.Unlocks.Enemies or {}
                                if Enemies[a2.Name] ~= true then
                                    PityStats = Session.Data.Sandbox.PityStats or {}
                                    PityStats[a2.Name] = (PityStats[a2.Name] or 0) + 1
                                    Session.Data.Sandbox.PityStats = PityStats
                                    if (v1[a2.Name] or 60) <= PityStats[a2.Name] then
                                        PityStats[a2.Name] = nil
                                        v2 = u30[j] or {}
                                        v2[a2.Name] = true
                                        u30[j] = v2
                                        new = ItemPickupService.new
                                        EnemyLorebook = Enum.ItemPickupType.EnemyLorebook
                                        Position = a2.Position
                                        ReplicationFolder = a2.Replicator.ReplicationFolder
                                        v3 = {name = a2.Name}
                                        new(EnemyLorebook, Position, ReplicationFolder, nil, {j}, v3, 0)
                                    end
                                end
                            else
                                warn("No session for player", j)
                            end
                        else
                            warn("No entity for player", j)
                        end
                    end
                end)
                return a2
            end
            return a2
        end))
    end,
}
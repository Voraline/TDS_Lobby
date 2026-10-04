-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.PlayerController
-- Decompile time: 4.63 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Shared = ReplicatedStorage.Shared
local LocalPlayer = Players.LocalPlayer
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local PlayerStatsStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.PlayerStatsStore)
LazyLoader = require(Shared.UI.LazyLoader)
Cache = require(Shared.UI.Cache)
local v1 = {}
v1.__index = v1

function v1.init(a1, a2) -- Line: 17 -- upvalues: Enum (val), PlayerStatsStore (val), LocalPlayer (val)
    local u2 = {
        "Coins",
        "Experience",
        "Gems",
        "Level",
        "Loses",
        "Wins",
        "Triumphs",
        "Tag",
        "SpinTickets",
        "TimescaleTickets",
        "ReviveTickets",
    }
    ;(Cache("Flags.Tutorial"):Get()):andThen(function(a1) -- Line: 32 -- upvalues: Enum (upval), PlayerStatsStore (upval), LocalPlayer (upval)
        local v1 = tonumber(a1 or Enum.TutorialStage.Start)
        PlayerStatsStore.setTutorial(v1)
        task.spawn(function() -- Line: 36 -- upvalues: LocalPlayer (upval), PlayerStatsStore (upval)
            local Tutorial = LocalPlayer:WaitForChild("Tutorial")
            if not Tutorial then
                return
            end
            Tutorial.Changed:Connect(function() -- Line: 42 -- upvalues: PlayerStatsStore (upval), Tutorial (val)
                PlayerStatsStore.setTutorial(Tutorial.Value)
            end)
        end)
    end)
    ;(Cache("Values"):Get()):andThen(function(a1) -- Line: 48 -- upvalues: PlayerStatsStore (upval), u2 (val), LocalPlayer (upval)
        if not a1 then
            return
        end
        for k, v in pairs(a1) do
            (Cache(string.format("Values.%s", k))).Updated:Connect(function(a1) -- Line: 55 -- upvalues: PlayerStatsStore (upval), k (val)
                PlayerStatsStore.setValue(k, a1)
            end)
            PlayerStatsStore.setValue(k, v)
            if table.find(u2, k) then
                task.spawn(function() -- Line: 66 -- upvalues: LocalPlayer (upval), k (val), PlayerStatsStore (upval)
                    local u4 = LocalPlayer:WaitForChild(k)
                    if not u4 then
                        return
                    end
                    u4.Changed:Connect(function() -- Line: 72 -- upvalues: u4 (val), PlayerStatsStore (upval), k (upval)
                        local Value = u4.Value
                        PlayerStatsStore.setValue(k, Value)
                    end)
                end)
            end
        end
    end)
    a2()
end

function v1.getLevel(a1) -- Line: 83 -- upvalues: PlayerStatsStore (val)
    return PlayerStatsStore.getLevel()
end

function v1.getWins(a1) -- Line: 88 -- upvalues: PlayerStatsStore (val)
    return PlayerStatsStore.getState().wins
end

function v1.getLoses(a1) -- Line: 93 -- upvalues: PlayerStatsStore (val)
    return PlayerStatsStore.getState().loses
end

function v1.getTriumphs(a1) -- Line: 98 -- upvalues: PlayerStatsStore (val)
    return PlayerStatsStore.getState().triumphs
end

function v1.getExperience(a1) -- Line: 103 -- upvalues: PlayerStatsStore (val)
    return PlayerStatsStore.getExperience()
end

function v1.getCoins(a1) -- Line: 108 -- upvalues: PlayerStatsStore (val)
    return PlayerStatsStore.getCoins()
end

function v1.getGems(a1) -- Line: 113 -- upvalues: PlayerStatsStore (val)
    return PlayerStatsStore.getGems()
end

function v1.getTimescaleTickets(a1) -- Line: 118 -- upvalues: PlayerStatsStore (val)
    return PlayerStatsStore.getTimescaleTickets()
end

function v1.getReviveTickets(a1) -- Line: 123 -- upvalues: PlayerStatsStore (val)
    return PlayerStatsStore.getReviveTickets()
end

function v1.getSpinTickets(a1) -- Line: 128 -- upvalues: PlayerStatsStore (val)
    return PlayerStatsStore.getSpinTickets()
end

function v1:isLevel(a2) -- Line: 133
    return a2 <= self:getLevel()
end

function v1.levelsUntil(a1, a2) -- Line: 138
    if a1:isLevel(a2) then
        return 0
    end
    return a2 - a1:getLevel()
end

function v1.canAfford(a1, a2, a3) -- Line: 143 -- upvalues: PlayerStatsStore (val)
    return a2 <= (PlayerStatsStore.getState()[(a3 or "Coins"):lower()] or 0)
end

return LazyLoader(v1)
-- Script path: ReplicatedStorage.Client.Modules.Replicators.DifficultyReplicator
-- Decompile time: 0.53 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DifficultyStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.DifficultyStore)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local Difficulty = require(ReplicatedStorage.Shared.Modules.Network).Channel("Difficulty")
local u31 = Maid.new()
return {
    Listen = function() -- Line: 17 -- upvalues: u31 (val), Difficulty (val), DifficultyStore (val), Players (val)
        u31:Mark((Difficulty:On("Ready", function(a1) -- Line: 18 -- upvalues: DifficultyStore (upval), Players (upval) -- types: a1: number
            DifficultyStore.setReadyCount(a1)
            if #Players:GetPlayers() <= a1 then
                DifficultyStore.setReadyVisible(false)
            end
        end)))
    end,
}
-- Script path: ReplicatedStorage.Content.NewEnemies.Spectator.Stats
-- Decompile time: 0.25 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 4.5,
    MaxHealth = 450,
    Scale = 1.2,
    Description = "Righty finds the Spectators unsettling because when they were possessed by the Narrator, their bodies transformed into coal-black silhouettes. These ghostly figures haunt the theater's darkest corners, watching performances from the shadows while avoiding contact with anyone else.",
    HealthPerDifficulty = {Easy = 600, Hard = 825},
    Reward = {Easy = 650, Hard = 750},
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.Hidden},
}
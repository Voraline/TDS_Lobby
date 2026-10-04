-- Script path: ReplicatedStorage.Content.NewEnemies.Spy Ducky.Stats
-- Decompile time: 0.23 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Description = "Spy Ducky is a ghost, a mystery. He changes disguises faster than one could quack. Infiltrating the highest level of government secrets and being internationally wanted for espionage, Spy Ducky could be a villain in his own right. He could be anywhere, anything, anyone. Spy Ducky could even you.",
    Speed = 4,
    Health = 10,
    HealthPerDifficulty = {Hard = 250, Easy = 125},
    Reward = {Hard = 375, Easy = 375},
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.Hidden},
}
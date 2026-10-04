-- Script path: ReplicatedStorage.Content.NewEnemies.Hex Corpse.Stats
-- Decompile time: 0.31 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    DisplayName = "Splitter",
    Speed = 5,
    MaxHealth = 250,
    ReviveHealth = 800,
    Defense = 50,
    Time = 0.5,
    HealthPerDifficulty = {
        Act2Easy = 125,
        Act2 = 250,
        Act3Easy = 125,
        Act3 = 200,
        PollutedWasteland = 2500,
    },
    Reward = {
        Act2Easy = 125,
        Act2 = 250,
        Act3Easy = 125,
        Act3 = 200,
        PollutedWasteland = 4500,
    },
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.FireImmune},
}
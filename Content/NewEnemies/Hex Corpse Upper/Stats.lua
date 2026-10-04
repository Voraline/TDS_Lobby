-- Script path: ReplicatedStorage.Content.NewEnemies.Hex Corpse Upper.Stats
-- Decompile time: 0.26 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    DisplayName = "Split",
    Speed = 6.5,
    MaxHealth = 250,
    Defense = 50,
    Time = 0.5,
    HealthPerDifficulty = {
        Act2Easy = 180,
        Act2 = 250,
        Act3Easy = 180,
        Act3 = 200,
        PollutedWasteland = 1250,
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
-- Script path: ReplicatedStorage.Content.NewEnemies.Null Shrieker.Stats
-- Decompile time: 0.30 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Description = "The Null Shrieker is a flying enemy within the Nil Zone. Despite its blindness, it navigates by relying on sound to locate its prey. The bandages that cover its eyes are believed to be self-inflicted, as if the creature chose to blind itself.",
    Speed = 4.75,
    Health = 125,
    HealthPerDifficulty = {Act2Easy = 150, Act3Easy = 175, Act2 = 300, Act3 = 350},
    Reward = {Act2Easy = 250, Act3Easy = 200, Act2 = 350, Act3 = 200},
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.Flying},
}
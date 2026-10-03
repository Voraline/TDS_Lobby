-- Script path: ReplicatedStorage.Content.NewEnemies.Null Dredge.Stats
-- Decompile time: 0.25 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "A Null Dredge is a slow, lazy enemy. They are heavy in size but quite shy, so they choose to hide their face using a bag. Despite their massive body, Null Dredges prefer to avoid fighting and will wander through the Nil Zone at their own pace. However, their temper is short, and any little disturbance will send them into a rampage.",
    Speed = 3,
    Health = 50,
    Defense = 25,
    Scale = 0.7,
    HealthPerDifficulty = {
        Act1Easy = 55,
        Act2Easy = 80,
        Act3Easy = 30,
        Act1 = 85,
        Act2 = 150,
        Act3 = 60,
    },
    Reward = {
        Act1Easy = 100,
        Act2Easy = 100,
        Act3Easy = 50,
        Act1 = 100,
        Act2 = 250,
        Act3 = 50,
    },
    Attributes = {},
}